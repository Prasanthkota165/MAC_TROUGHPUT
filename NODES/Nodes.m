Node5=[1448.98 1448 1449.04 1448.29 1448.11 1448.41 1448.72 1449.04 1447.33 1448.37];
Mean5=mean(Node5,2);
sum=0;
for i=1:10
    sum=sum+(Node5(i)-Mean5)^2;
end
StandardDeviation5=sqrt(sum/10);
ConfidenceInterval5=[Mean5-2.262*(StandardDeviation5/sqrt(10)) Mean5+2.262*StandardDeviation5/sqrt(10)];
Node10=[1435.22 1429.3 1433.77 1427.97 1431.35 1435.57 1431.62 1436.72 1432.08 1430.33];
Mean10=mean(Node10,2);
sum=0;
for i=1:10
    sum=sum+(Node10(i)-Mean10)^2;
end
StandardDeviation10=sqrt(sum/10);
ConfidenceInterval10=[Mean10-2.262*(StandardDeviation10/sqrt(10)) Mean10+2.262*(StandardDeviation10/sqrt(10))];
Node15=[1419.58 1414.72 1410.96 1409.63 1413.32 1421.1 1413.79 1401.61 1413.08 1412.29];
Mean15=mean(Node15,2);
sum=0;
for i=1:10
    sum=sum+(Node15(i)-Mean15)^2;
end
StandardDeviation15=sqrt(sum/10);
ConfidenceInterval15=[Mean15-2.262*(StandardDeviation15/sqrt(10)) Mean15+2.262*(StandardDeviation15/sqrt(10))];
Node20=[1375.95 1397.19 1386.81 1373.16 1380.92 1360.14 1399.07 1363.16 1376.09 1390.57];
Mean20=mean(Node20,2);
sum=0;
for i=1:10
    sum=sum+(Node20(i)-Mean20)^2;
end
StandardDeviation20=sqrt(sum/10);
ConfidenceInterval20=[Mean20-2.262*(StandardDeviation20/sqrt(10)) Mean20+2.262*(StandardDeviation20/sqrt(10))];
Node25=[1349.65 1342.15 1338.33 1325.19 1367.69 1367.99 1374.35 1337.97 1368.28 1343.03];
Mean25=mean(Node25,2);
sum=0;
for i=1:10
    sum=sum+(Node25(i)-Mean25)^2;
end
StandardDeviation25=sqrt(sum/10);
ConfidenceInterval25=[Mean25-2.262*(StandardDeviation25/sqrt(10)) Mean25+2.262*(StandardDeviation25/sqrt(10))];
ChannelUtilization= (100/(2*1000))*[Mean5 Mean10 Mean15 Mean20 Mean25];
NoOfNodes=[5 10 15 20 25];
figure
plot(NoOfNodes,ChannelUtilization);
hold on;
plot(NoOfNodes,ChannelUtilization,'o','MarkerSize',10);
title('No of Nodes vs Channel Utilization');
xlabel('No of Nodes');
ylabel('Channel Utilization in %');