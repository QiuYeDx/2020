function Y=msound(S,y)
%play sound divided by S
fs=8000;
% s = size(who('S'));
% if length(s) ~= 2,
%     text('S is error.');
%     return;
% end;
a=size(S);
if a(2)==1
    y(1:S(1,1))=0;
    y(S(2,1):end)=0;
else
   for i=1:a(2)
       if i==1,
          y(1:S(1,i))=0;
      else
          y(S(2,i-1):S(1,i))=0;
      end;
   end;
   y(S(2,a(2)):end)=0;
end;
sound(y,fs);
Y=y(find(y>0));
%--------------------
m=length(Y);
n=2^ceil(log2(m));
y1=fft(Y,n);
f=fs*(0:n/2)/n;
y2=abs(y1)/n;
plot(f,y2(1:n/2+1));
axis([1 4000 -0.001 max(y2)+0.01]);

