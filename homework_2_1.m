clc;clear all;close all;
%%
T0=pi/2;
n=-100:1:100;
nn=1:1:202;
t=-10:0.1:10;
f1=figure;
%%
X=sin(t);

Y1=zeros(1,201);
tt=1;

for t=-10:0.1:10
    for n=-5:1:5
        Y1(1,tt)=Y1(1,tt)+(sin(n*T0))*(sin(t-n*T0))/(t-n*T0);
    end
    tt=tt+1;
end
t=-10:0.1:10;
figure(f1);
subplot(2,2,1);
plot(t,X)
hold on
plot(t,Y1)
%%
Y2=zeros(1,201);
tt=1;
for t=-10:0.1:10
    for n=-10:1:10
        Y2(1,tt)=Y2(1,tt)+(sin(n*T0))*(sin(t-n*T0))/(t-n*T0);
    end
    tt=tt+1;
end
t=-10:0.1:10;
figure(f1);
subplot(2,2,2);
plot(t,X)
hold on
plot(t,Y2)

%%
Y3=zeros(1,201);
tt=1;
for t=-10:0.1:10
    for n=-20:1:20
        Y3(1,tt)=Y3(1,tt)+(sin(n*T0))*(sin(t-n*T0))/(t-n*T0);
    end
    tt=tt+1;
end
t=-10:0.1:10;
subplot(2,2,3);
plot(t,X)
hold on
plot(t,Y3)
%% end









