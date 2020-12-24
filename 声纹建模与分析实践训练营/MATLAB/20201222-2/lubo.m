function y11=lubo(fn)
global fname
global py
%fname=recordCallback;
%py=wavread(fn);
fs=8000;
%[y,fs,bits]=wavread(fn);
%ÂË²¨
%py=f_risen;
As =100;
Ap = 1;
% wp = 2*fp/fs;
% ws = 2*fs/fs;
% [n,wn] = ellipord(wp,ws,Ap,As);
% [b,a] = ellip(n,Ap,As,wn);
% y11 = filter(b,a,y);
py=wavread(fn);
fc = [50 2500];
fb = [100 2000];
wc = 2.*fb/fs;
wb = 2.*fc/fs;
[n,wn] = ellipord(wc,wb,Ap,As,'s');
[b,a] = ellip(n,Ap,As,wn);
y11= filter(b,a,py);
%
% y = smooth(y);

%y11 = y11';
%y11 = y11-[y11(end),y11(1:end-1)].*0.9375;

%size=length(y);
%n=2^ceil(log2(size));
%subplot(311);
%plot(y);
%title('Ô­Ê¼²¨ÐÎ');

%subplot(312);
%y1=fft(y,n);
 %f=fs*(0:n/2)/n;
 %y2=abs(y1)/n;
 %plot(f,y2(1:n/2+1));
% axis([1 4000 -0.001 max(y2)+0.01]);

%title('ÆµÓòÕñ·ù²¨ÐÎ');

 %subplot(313);
 t=length(y11);
 n=2^ceil(log2(t));
 y1=fft(y11,n);
 f=fs*(0:n/2)/n;
 y2=abs(y1)/n;
 plot(f,y2(1:n/2+1));
 axis([1 4000 -0.001 max(y2)+0.01]);


%title('luboÆµÓòÕñ·ù²¨ÐÎ');
%return