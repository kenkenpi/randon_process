clc
clear all
%% 产生正态分布（0，1）的2000个白序列
%rng(1);
N=2000;
Y2=randn(1,N);
X=rand(1,N*12+12);
Y=zeros(1,N);

for j=1:N
    for k=1:12
        Y(j)=Y(j)+X(1,12*j+k)-0.5;
    end
end
x=1:50;
%% %%%%%  1.打印五十个数  %%%%%%%%%%
simple_y=Y(1,1:50)
simple_y2=Y2(1,1:50)
plot(x,simple_y)
hold on
plot(x,simple_y2)
%% %%%%%%%%  2.分布检验，分成十个分区，e<=10  %%%%%%%%%%%%%%%%
block_num=zeros(1,8);
block_num2=zeros(1,8);
for i=1:1:8
    for j=1:2000
        if i==1
            if Y(1,j)<=-3
                block_num(i)=block_num(i)+1;
            end
        elseif i==8
            if Y(1,j)>3
                block_num(i)=block_num(i)+1;
            end
        elseif (Y(1,j)<=(-4+i))&&(Y(1,j)>(-5+i))
           block_num(i)=block_num(i)+1;
        end
    end
end
for i=1:1:8
    for j=1:N
        if i==1
            if Y2(1,j)<=-3
                block_num2(i)=block_num2(i)+1;
            end
        elseif i==8
            if Y2(1,j)>3
                block_num2(i)=block_num2(i)+1;
            end
        elseif (Y2(1,j)<=(-4+i))&&(Y2(1,j)>(-5+i))
           block_num2(i)=block_num2(i)+1;
        end
    end
end
xx=1:8
bar(xx,[block_num;block_num2])
%% %%%%%%  3.均值检验  %%%%%%%%%%%%%%%%%%%
EY2=0
sum_y2=0;
sum_dy2=0;
for i=1:N
sum_y2=sum_y2+Y2(1,i);
sum_dy2=Y2(1,i)*Y2(1,i)-EY2*EY2+sum_dy2;
end
EY2_hat=sum_y2/N
%% %%%%%%  4.方差检验  %%%%%%%%%
DY2=1/12
DY2_hat=sum_dy2/N
%% %%%%%%  5.计算相关函数  %%%%%%%%%
By2=zeros(1,21);
By2(1,11)=1;
By2_hat=zeros(1,21);
a=1;
for i=-10:1:10
    
    for j=1:1:(N-abs(i))
        if a==1
        By2_hat(1,a)=By2_hat(1,a)+(Y2(1,j+abs(i))-EY2_hat)*(Y2(j)-EY2_hat)/N;
        else
        By2_hat(1,a)=By2_hat(1,a)+(Y2(1,j+abs(i))-EY2_hat)*(Y2(j)-EY2_hat)/N;
        end
    end
    a=a+1;
end
f3=figure;
figure(f3);
plot(1:21,By2_hat)
hold on 
plot(1:21,By2)
%% END










