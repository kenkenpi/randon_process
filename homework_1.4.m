clc
clear all
%% 
N=1000;
kesi=randn(1,N);
for k=1:N
    if k==1
        X(k)=kesi(1,k);
    else
    X(k)=kesi(1,k)-0.707*X(k-1);
    end
end
%% %%%%%%%%  1.EX  %%%%%%%%%%%%
EX=zeros(1,N);
X0=0.5;

for k=1:N
    EX(1,k)=(-0.707)^k*X0;
end
sum_x=0;
sum_dx=0;
for i=1:N
sum_x=sum_x+X(1,i);
sum_xx=sum_x+X(1,i)*X(1,i);
sum_dx=X(1,i)*X(1,i)-EX.*EX+sum_dx;
end
EX_hat=sum_x/N
%% %%%%%%%  2.EX^2_hat  %%%%%%%%%%%
for k=1:N
    EXX(1,k)=(1-(-0.707)^(2*k))/(1-X0);
end
EXX_hat=sum_xx/N
%% %%%%%%%  3.DX_hat  %%%%%%%%%%%%%
for k=1:N
    DX(1,k)=EXX(1,k)-EX(1,k)^2;
end
DX_hat=EXX_hat-EX_hat*EX_hat
%% %%%%%%%  4.Bx(m)_hat  %%%%%%%%%%
Bx_hat=zeros(1,21);
a=1;
for i=-10:1:10
    
    for j=1:1:(N-abs(i))
        if a==1
        Bx_hat(1,a)=Bx_hat(1,a)+(X(1,j+abs(i))-EX_hat)*(X(j)-EX_hat)/N;
        else
        Bx_hat(1,a)=Bx_hat(1,a)+(X(1,j+abs(i))-EX_hat)*(X(j)-EX_hat)/N;
        end
    end
    Bx(1,a)=(-0.707)^(abs(i))/(1-0.707*0.707);
    a=a+1;
end
f3=figure;
figure(f3);
plot(1:21,Bx_hat)
hold on 
plot(1:21,Bx)
%% END

















