# Define options
# ======================================================================
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
set val(nn)             5                          ;# number of mobilenodes
set val(rp)             DSDV                       ;# routing protocol

# ======================================================================
# Main Program
# ======================================================================


#
# Initialize Global Variables
#
set ns_		[new Simulator]
set tracefd     [open Packet128.tr w]
$ns_ trace-all $tracefd
set namtracefd	[open Packet128.nam w]
$ns_ namtrace-all-wireless $namtracefd 700 500
# set up topography object
set topo       [new Topography]

$topo load_flatgrid 700 500
$val(mac) set dataRate_ 2Mb

#
# Create God
#
create-god $val(nn)


$ns_ node-config -adhocRouting $val(rp) \
		 -llType $val(ll) \
		 -macType $val(mac) \
		 -ifqType $val(ifq) \
		 -ifqLen $val(ifqlen) \
		 -antType $val(ant) \
		 -propType $val(prop) \
		 -phyType $val(netif) \
		 -channelType $val(chan) \
		 -topoInstance $topo \
		 -agentTrace ON \
		 -routerTrace ON \
		 -macTrace ON \
		 -movementTrace ON



for {set i 0} {$i < $val(nn) } {incr i} {
	set node_($i) [$ns_ node]	
	$node_($i) random-motion 0		;# disable random motion
}




$node_(0) set X_ 100.0
$node_(0) set Y_ 100.0
$node_(0) set Z_ 0.0

$node_(1) set X_ 50.0
$node_(1) set Y_ 50.0
$node_(1) set Z_ 0.0

$node_(2) set X_ 150.0
$node_(2) set Y_ 50.0
$node_(2) set Z_ 0.0

$node_(3) set X_ 50.0
$node_(3) set Y_ 150.0
$node_(3) set Z_ 0.0

$node_(4) set X_ 150.0
$node_(4) set Y_ 150.0
$node_(4) set Z_ 0.0



for {set i 0} {$i < $val(nn) } {incr i} {
	$ns_ initial_node_pos $node_($i) 40
}

set udp [new Agent/UDP]

$ns_ attach-agent $node_(1) $udp

set udp1 [new Agent/UDP]
$ns_ attach-agent $node_(2) $udp1

set udp2 [new Agent/UDP]
$ns_ attach-agent $node_(3) $udp2

set udp3 [new Agent/UDP]
$ns_ attach-agent $node_(4) $udp3

set null [new Agent/Null]
$ns_ attach-agent $node_(0) $null

$ns_ connect $udp $null
$ns_ connect $udp1 $null
$ns_ connect $udp2 $null
$ns_ connect $udp3 $null


set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp
$cbr1 set packetSize_ 128
$cbr1 set interval_ 0.005

set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp1
$cbr2 set packetSize_ 128
$cbr2 set interval_ 0.005

set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp2
$cbr3 set packetSize_ 128
$cbr3 set interval_ 0.005


set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp3
$cbr4 set packetSize_ 128
$cbr4 set interval_ 0.005

$ns_ at 10.0 "$cbr4 start" 
$ns_ at 10.0 "$cbr1 start" 
$ns_ at 10.0 "$cbr2 start" 
$ns_ at 10.0 "$cbr3 start" 


for {set i 0} {$i < $val(nn) } {incr i} {
    $ns_ at 150.0 "$node_($i) reset";
}
#$ns_ at 150.0 "stop"
$ns_ at 150.01 "puts \"NS EXITING...\" ; $ns_ halt"
proc stop {} {
    global ns_ tracefd namtracefd
    $ns_ flush-trace
    close $tracefd
    close $namtracefd
}

puts "Starting Simulation..."
$defaultRNG seed 0
$ns_ run








