function w=addwinlpc(f)

fs=8000;
%�˺���������֡����"�Ӵ�����ͬʱ��ȡlpc���ײ���
%f�Ƿ�֡��õ���ֵ,f=enframe(py,win,inc);
b=[];
s = [];
for i=1:size(f,1);%size(f,1)��ʾsize����
    y=f(i,:);%��ʾ��i�е���������
    p = (y' .* hamming(256))';%�Ӵ�
    s = [s,p];
    c=lpc(p);%��lpc
    d=cceps(c);%��lpc����
    b=[b,d(2:13)];%ȡ2��13����һ��12��
end;
%���ϻ��ƾ����ִ�\��֡\�Ӵ����źŵ�Ƶ��ͼ,����δ����������ȡǰ�����ݵ�Ƶ��ͼ
len1=length(s);
n=2^ceil(log2(len1));
y1=fft(s,n);
f=fs*(0:n/2)/n;
y2=abs(y1)/n;
plot(f,y2(1:n/2+1));
axis([1 4000 -0.001 max(y2)+0.01]);
title('Ƶ���������');

w=b;

