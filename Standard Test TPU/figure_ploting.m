close all;
clear all;
load A1.mat
load A2.mat
A3=[A1 A2];
L01=[33 33 33 33.5 33 33 33 33 32.5 32.5 32.5];
L02=[40.5 40.5 41 41 40.5 40.5 42 41.5 41 41 41];
R=(L02-L01)/15;

a = 1;
b = ones(1,64)./64;
figure('DefaultAxesFontSize',14,'Position',[200 200 800 640])
color.code=colormap(slanCM(160));
color.l=length(color.code);
for i=1:6
    color.index(i)=round(color.l*i/6);
    newcolors2(i,:)=color.code(color.index(i),:);
end
%colororder(newcolors2);
%colororder(newcolors2);
for i=1:width(A3)/2
    x(:,i)=R(i).*A3(:,2*i-1)./L01(i);
    z(:,i)=A3(:,2*i)./A0;
    y(:,i)=filter(b,a,z(:,i));
    if i<=6
        plot(x(:,i),y(:,i),'-','LineWidth',2,'Color',newcolors2(i,:));
    else
        plot(x(:,i),y(:,i),'--','LineWidth',2,'Color',newcolors2(i-6,:));
    end
    hold on
end


lgd = legend('Polyflex Sample 1','Polyflex Sample 2','Polyflex Sample 3','Polyflex Sample 4','Polyflex Sample 5','Polyflex Sample 6','Bambu TPU95A Sample 1','Bambu TPU95A Sample 2','Bambu TPU95A Sample 3','Bambu TPU95A Sample 4','Bambu TPU95A Sample 5');
legend('boxoff')
legend('Location','southeast','FontName','Arial','NumColumns',2);
xlabel('Strain (mm/mm)');
ylabel ('Stress (Pa)');
axis([0 0.3 0 5e6]);
xticks(0:0.1:0.3)
ax=gca;
ax.FontName='Arial';