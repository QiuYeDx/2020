function w=addwinlpc(f)

fs=8000;
%此函数用来分帧后，在"加窗”的同时提取lpc倒谱参数
%f是分帧后得到的值,f=enframe(py,win,inc);
b=[];
s = [];
for i=1:size(f,1);%size(f,1)显示size的行
    y=f(i,:);%显示第i行的所有数据
    p = (y' .* hamming(256))';%加窗
    s = [s,p];
    c=lpc(p);%求lpc
    d=cceps(c);%求lpc倒谱
    b=[b,d(2:13)];%取2到13个，一共12个
end;
%以上绘制经过分词\分帧\加窗后信号的频域图,即在未进行特征提取前的数据的频域图
len1=length(s);
n=2^ceil(log2(len1));
y1=fft(s,n);
f=fs*(0:n/2)/n;
y2=abs(y1)/n;
plot(f,y2(1:n/2+1));
axis([1 4000 -0.001 max(y2)+0.01]);
title('频域振幅波形');

w=b;

