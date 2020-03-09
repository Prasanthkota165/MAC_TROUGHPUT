clear;
clc;
Packet16=[ 170.66 170.734 170.715 170.699 170.618 170.550 170.651 170.667 170.673 170.606];
Mean16=mean(Packet16,2);
sum=0;
for i=1:10
    sum=sum+(Packet16(i)-Mean16)^2;
end
StandardDeviation16=sqrt(sum/10);
ConfidenceInterval16=[Mean16-2.262*(StandardDeviation16/sqrt(10)) Mean16+2.262*(StandardDeviation16/sqrt(10))];
Packet64=[357.367 357.259 357.504 357.725 357.898 357.512 357.158 357.499 357.483 357.3];
Mean64=mean(Packet64,2);
sum=0;
for i=1:10
    sum=sum+(Packet64(i)-Mean64)^2;
end
StandardDeviation64=sqrt(sum/10);
ConfidenceInterval64=[Mean64-2.262*(StandardDeviation64/sqrt(10)) Mean64+2.262*(StandardDeviation64/sqrt(10))];
Packet128=[554.437 554.14 554.474 554.376 554.603 554.484 554.768 554.33 554.964 554.46];
Mean128=mean(Packet128,2);
sum=0;
for i=1:10
    sum=sum+(Packet128(i)-Mean128)^2;
end
StandardDeviation128=sqrt(sum/10);
ConfidenceInterval128=[Mean128-2.262*(StandardDeviation128/sqrt(10)) Mean128+2.262*(StandardDeviation128/sqrt(10))];
Packet256=[834.247 833.054 833.856 834.394 833.413 833.904 834.638 834.251 833.353 832.844];
Mean256=mean(Packet256,2);
sum=0;
for i=1:10
    sum=sum+(Packet256(i)-Mean256)^2;
end
StandardDeviation256=sqrt(sum/10);
ConfidenceInterval256=[Mean256-2.262*(StandardDeviation256/sqrt(10)) Mean256+2.262*(StandardDeviation256/sqrt(10))];
Packet512=[1158.53 1158.67 1158.57 1157.94 1159.37 1158.49 1159.31 1158.82 1158.97 1159.33];
Mean512=mean(Packet512,2);
sum=0;
for i=1:10
    sum=sum+(Packet512(i)-Mean512)^2;
end
StandardDeviation512=sqrt(sum/10);
ConfidenceInterval512=[Mean512-2.262*(StandardDeviation512/sqrt(10)) Mean512+2.262*(StandardDeviation512/sqrt(10))];
Packet1024=[1447.64 1448.7 1447.04 1447.42 1447.66 1448.24 1448.2 1447.86 1446.96 1448.88];
Mean1024=mean(Packet1024,2);
sum=0;
for i=1:10
    sum=sum+(Packet1024(i)-Mean1024)^2;
end
StandardDeviation1024=sqrt(sum/10);
ConfidenceInterval1024=[Mean1024-2.262*(StandardDeviation1024/sqrt(10)) Mean1024+2.262*(StandardDeviation1024/sqrt(10))];
Packet1500=[1449.4 1449.26 1449.6 1449.94 1449.45 1448.69 1449.42 1448.96 1448.8 1449.57];
Mean1500=mean(Packet1500,2);
sum=0;
for i=1:10
    sum=sum+(Packet1500(i)-Mean1500)^2;
end
StandardDeviation1500=sqrt(sum/10);
ConfidenceInterval1500=[Mean1500-2.262*(StandardDeviation1500/sqrt(10)) Mean1500+2.262*(StandardDeviation1500/sqrt(10))];
Packet2048=[1448.46 1449.22 1448.87 1448.3 1448.4 1448.8 1447.49 1448.33 1447.64 1449];
Mean2048=mean(Packet2048,2);
sum=0;
for i=1:10
    sum=sum+(Packet2048(i)-Mean2048)^2;
end
StandardDeviation2048=sqrt(sum/10);
ConfidenceInterval2048=[Mean2048-2.262*(StandardDeviation2048/sqrt(10)) Mean2048+2.262*(StandardDeviation2048/sqrt(10))];

ChannelUtilization= (100/(2*1000))*[Mean16 Mean64 Mean128 Mean256 Mean512 Mean1024 Mean1500 Mean2048];
MeanSize=[16 64 128 256 512 1024 1500 2048];
figure
plot(MeanSize,ChannelUtilization);
hold on;
plot(MeanSize,ChannelUtilization,'o','MarkerSize',10);
title('Packet Size vs Channel Utilization');
xlabel('Packet Size in bytes');
ylabel('Channel Utilization in %');

