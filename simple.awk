BEGIN {sent = 0; received = 0; firstReceived = -1; 
	lastReceived = -1; data = 0; latency = 0}

$1 == "s" && $4 == "MAC" && $7 == "cbr" { 
	  sent = sent + 1; 
	  time[$6] = $2;
	}

$1 == "r" && $4 == "MAC" && $7 == "cbr" {
	  received = received + 1;
	  lastReceived = $2;
	  if (firstReceived == -1) firstReceived = $2;
	  data = data + $8;
	  latency = latency + $2 - time[$6];
	}

END { print "Sent: ", sent; 
      print "Received: ", received;
      print "First data packet received: ", firstReceived;
      print "Last data packet received: ", lastReceived;
      print "Bandwidth: ", data*8 / (lastReceived - firstReceived)/1000, "kbps";
      print "Average latency: ", latency/received, " seconds";
      print "Channel Utilization: ", (data*8 / (lastReceived - firstReceived)/1000)/20,"%";
}

