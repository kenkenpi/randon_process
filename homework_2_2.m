clc;clear all;close all;

global A B N T0 
A=0.78;
B=3.11/4;
N=40;
T0=0.3;
%rng(1);
epsilon=rand(1,40)*2*pi-pi;
omegan=zeros(1,40);
for n=0:1:N
    omegan(1,n+1)=0.05*n;
end
f1=figure;
f2=figure;
%% （1）画kesi
kesi=zeros(1,1200);
tt=1;
for t=1:0.1:120
    for n=1:1:N
        kesi(tt)=kesi(tt)+sqrt(2*integral(@(omega)0.78./(omega.^5).*exp(-3.11./4./(omega.^4)),omegan(1,n),omegan(1,n+1)))*cos(omegan(1,n+1)*t+epsilon(1,n));
    end
    tt=tt+1;
end
t=1:1:1200;
figure(f1);
plot(t,kesi)
%% （2）对kesi进行采样，T0=0.3
kesi_s=zeros(1,400);
E_kesi_s_hat=0;
for n=1:1:400
    kesi_s(1,n)=kesi(n*3);
    E_kesi_s_hat=E_kesi_s_hat+kesi_s(1,n);
end
figure(f2);
plot(kesi_s)
%% (3)计算kesi_s均值
E_kesi_s_hat=E_kesi_s_hat/400;
%% (4)计算样本相关函数
B_kesi_s_hat=zeros(1,61);
a=1;
for i=-30:1:30
    
    for j=1:1:(400-abs(i))
        if a==1
        B_kesi_s_hat(1,a)=B_kesi_s_hat(1,a)+(kesi_s(1,j+abs(i))-E_kesi_s_hat)*(kesi_s(j)-E_kesi_s_hat)/400;
        else
        B_kesi_s_hat(1,a)=B_kesi_s_hat(1,a)+(kesi_s(1,j+abs(i))-E_kesi_s_hat)*(kesi_s(j)-E_kesi_s_hat)/400;
        end
    end
    a=a+1;
end
f3=figure;
figure(f3);
plot(1:61,B_kesi_s_hat)
%% (5)(6)计算样本功率谱密度函数、画其图

    sum=0;
for z=1:60
    for m=1:400
        sum=sum+kesi_s(1,m)*exp(-1i*0.05*z*m*0.3);
    end
    S_kesi_hat=0.3/400*(abs(sum))^2;
    s(z)=S_kesi_hat;
end
z=1:60;
f4=figure;
figure(f4);
plot(z,s)
%% (7)
for n=1:60
    S_kesi(n)=A/((0.05*n)^5)*exp(-1*B/((0.05*n)^4));
end
C=(max(S_kesi))/(max(s));
f5=figure;
figure(f5);
plot(1:60,S_kesi)
hold on
plot(1:60,C*s)



%% end




