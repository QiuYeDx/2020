function s=gender(fn)
%分性别
[y,fs]=wavread(fn);
size=length(y);
n=2^ceil(log2(size));
y1=fft(y,n);
f=fs*(0:n/2)/n;
y2=abs(y1)/n;
% hold off;
% plot(f,y2(1:n/2+1));
% axis([1 600 -0.001 max(y2)+0.01]);
% title('频域振幅波形');
left = floor(100*n/fs);
right = ceil(250*n/fs);
[A,pos] = max(y2(left:right));
if f(pos)>100,s='girl';
else s='boy';end;
