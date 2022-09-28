%产生两千个均匀分布的随机序列
X=rand(1,2000);
%% %%%%%%%  1.打印五十个数  %%%%%%%%%%
simple_x=X(1,1:50)
%% %%%%%%%%  2.分布检验，分成十个分区，e<=10  %%%%%%%%%%%%%%%%
block_num=zeros(1,10);

for i=1:1:10
    for j=1:2000
        if X(1,j)<(0.1*i)&&X(1,j)>=(0.1*(i-1))
           block_num(i)=block_num(i)+1;
        end
    end
end
%计算误差
sum=0;
square_sum=0;
for i=1:10
    sum=abs(block_num(i)-200)+sum;
    square_sum=square_sum+(block_num(i)-200)^2;
end
e=sum/10/200
d=sqrt(square_sum/10)/200
%折线图
x=1:1:10;
f1=figure;
figure(f1);
plot(x,block_num,x,200)
hold on
axis([0 11 150 250])
plot([0,11],[200 200],'--')
text(11,200,'理论均值')
%频率直方图
f2=figure;
figure(f2);
bar(x,block_num)
hold on
axis([0 11 150 250])
plot([0,11],[200 200],'--')
text(11,200,'理论均值')
%% %%%%%%%%  3.均值检验  %%%%%%%%%%%%%%%%
EX=0.5
sum_x=0;
sum_dx=0;
for i=1:2000
sum_x=sum_x+X(1,i);
sum_dx=X(1,i)*X(1,i)-EX*EX+sum_dx;
end
EX_hat=sum_x/2000
%% %%%%%%  4.方差检验  %%%%%%%%%%%%%%
DX_hat=sum_dx/2000
%% %%%%%%  5.计算相关函数  %%%%%%%%%
Bx=zeros(1,21);
Bx(1,11)=1/12;
Bx_hat=zeros(1,21);
a=1;
for i=-10:1:10
    
    for j=1:1:(2000-abs(i))
        if a==1
        Bx_hat(1,a)=Bx_hat(1,a)+(X(1,j+abs(i))-EX_hat)*(X(j)-EX_hat)/2000;
        else
        Bx_hat(1,a)=Bx_hat(1,a)+(X(1,j+abs(i))-EX_hat)*(X(j)-EX_hat)/2000;
        end
    end
    a=a+1;
end
f3=figure;
figure(f3);
plot(1:21,Bx_hat)
hold on
plot(1:21,Bx)
%%  END









