close all;
clear all;
name=['bambu_tpu_1_1.csv'];
data=xlsread(name);
N=4505;
n=2;
A0=0.0032*0.006;
for i=1:5
    A2(:,2*i-1:2*i)=data(N*(i-1)+n*i+1:N*i+n*i,3:4);
end
L01=[33 33 32.5 32.5 32.5];
L02=[42 41.5 41 41 41];
R=(L02-L01)/15;
a = 1;
b = ones(1,64)./64;
figure
for i=1:5
    x(:,i)=R(i).*A2(:,2*i-1)./L01(i);
    z(:,i)=A2(:,2*i)./A0;
    y(:,i)=filter(b,a,z(:,i));
    plot(x(:,i),y(:,i));
    hold on
end

newcolors=[0 0.4470 0.7410;0.8500 0.3250 0.0980;0.9290 0.6940 0.1250;0 0 0;0.3010 0.7450 0.9330;0.6350 0.0780 0.1840];
colororder=newcolors;
lgd = legend('1','2','3','4','5');
title(lgd,'Sample')
xlabel('Stain (mm/mm)');
ylabel ('Stress (Pa)');
name2=['Stress-Strain curves'];
title(name2);

GAP=10;
for i=1:length(x)-GAP
    for j=1:5
        s(i,j)=(y(i+GAP,j)-y(i,j))/(x(i+GAP,j)-x(i,j));
    end
end
Young_modulus=mean(mean(s));

SAN1=length(x)/2;
GAP=10;
for i=1:SAN1
    for j=1:5
    s2(i,j)=(y(i+GAP,j)-y(i,j))/(x(i+GAP,j)-x(i,j));
    end
end
Young_modulus2=mean(mean(s2));

SAN2=floor(length(x)/3);
GAP=10;
for i=1:SAN2
    for j=1:5
    s3(i,j)=(y(i+GAP,j)-y(i,j))/(x(i+GAP,j)-x(i,j));
    end
end
Young_modulus3=mean(mean(s3));
save 'A2.mat'