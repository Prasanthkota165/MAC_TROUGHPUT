					***Welcome to the README file***

1.Channel Utilisation vs Number of Transmitting Nodes ==> Go to the files in the folder NODES.

   1.1 Run the tcl files Node5, Node10, Node15, Node20 and Node25 using the command given below:
	
	ns Node5.tcl
	ns Node10.tcl
	ns Node15.tcl
	ns Node20.tcl
	ns Node25.tcl
   
   1.2 Extract the Channel Utilisation value from the awk script using the command given below for all the transmitting nodes.
	
	awk –f simple.awk Node5.tr
	awk –f simple.awk Node10.tr
	awk –f simple.awk Node15.tr
	awk –f simple.awk Node20.tr
	awk –f simple.awk Node25.tr

   1.3 10 Simulations results of each scenario is stored in the text file Node5.txt, Node10.txt, Node15.txt, Node20.txt and Node25.txt for 		reference.
   1.4 Calculated mean, standard deviation and confidence interval by running the MATLAB code Nodes.m and the results are given in report.

Scenario: The simulation setup is one ACCESS POINT with increasing number of node USERS. MAC of AP/USER will sense the channel using CSMA CD/CA or RTS/CTS while it send the traffic to avoid collision. We increase the number of users and simulated the MAC throughput analysis.

============================================================================================================================

2.Channel Utilisation vs Packet Size Scenario: ==> Go to the files in the folder packet_size.

   2.1 Run the tcl files Packet16, Packet64, Packet128, Packet256, Packet512, Packet1024, Packet1500 and Packet2048 using the command given below:

	
	ns Packet16.tcl
	ns Packet64.tcl
	ns Packet128.tcl
	ns Packet256.tcl
	ns Packet512.tcl
	ns Packet1024.tcl
	ns Packet1500.tcl
	ns Packet2048.tcl

2.

   2.2 Extract the Channel Utilisation value from the awk script using the command given below for all the transmitting nodes.

	
	awk –f simple.awk Packet16.tr
	awk –f simple.awk Packet64.tr
	awk –f simple.awk Packet128.tr
	awk –f simple.awk Packet256.tr
	awk –f simple.awk Packet512.tr
	awk –f simple.awk Packet1024.tr
	awk –f simple.awk Packet1500.tr
	awk –f simple.awk Packet2048.tr


   2.3 10 Simulations results of each scenario is stored in the text file Packet16.txt, Packet64.txt, Packet128.txt, Packet256.txt, 
       Packet512.txt, Packet1024.txt, Packet1500.txt and Packet2048.txt for reference.

   2.4 Calculated mean, standard deviation and confidence interval by running the MATLAB code Packets.m and the results are given in report.

Scenario: The simulation setup is one ACCESS POINT with 4 node USERS with increasing the packetsizes. MAC of AP/USER will sense the channel using CSMA CD/CA or RTS/CTS while it send the traffic to avoid collision. We increased the packetsizes and simulated the MAC throughput analysis.

---------------------
By-
PRASANTH KOTA
MIRARISH PAJOOM
