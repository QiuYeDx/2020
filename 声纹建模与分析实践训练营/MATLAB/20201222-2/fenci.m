function S= fenci(py,len)
% ����һ�����������������Ļ��ĺ���
fs=8000;
size = length(py);
% n=2^ceil(log2(size));
if length(who('len')) == 0, 
    len = ceil(fs/70); 
end;
if size <= len,text('Too long.');
    return;
end;

% %�˲�
% fb = 1000;
% fc = 1200;
% As = 100;
% Ap = 1;
% wc = 2*fc/fs;
% wb = 2*fb/fs;
% [n,wn] = ellipord(wc,wb,Ap,As);
% [b,a] = ellip(n,Ap,As,wn);
% y = filter(b,a,y);
% 
% fb = 5000;
% fc = 4800;
% wc = 2*fc/fs;
% wb = 2*fb/fs;
% [n,wn] = ellipord(wc,wb,Ap,As);
% [b,a] = ellip(n,Ap,As,wn);
% y = filter(b,a,y);
% %
% y = smooth(y);


step = ceil(size/1000);
k = 1;
for i=1:step:size,
    if i<len,
        A(k) = sum(abs(fft(py(1:i))))/i;
    else
        A(k) = sum(abs(fft(py(i-len:i))))/len;
    end;
    if i<=len,
        Y(k) = relate(abs(fft(py(1:i))),abs(fft(py(i:i+len))));
    elseif i>size-len,
        Y(k) = relate(abs(fft(py(i-len:i))),abs(fft(py(i-1:size))));
    else
        Y(k) = relate(abs(fft(py(i-len:i))),abs(fft(py(i:i+len))));
    end;
    k = k + 1;
end;
Y = Y.^5;
A = smooth(A);
Y = smooth(Y);

av = (sum(A)/length(A)/10)*20;
lz = 1;
ll = 1;
gate = 0.5;
for i=1:k-1,
    if A(i) > av && Y(i) > gate,%not be sure
        J(i) = 1;
    else
        if i-lz < 10,
            for j=lz:i,J(j) = 0;end;
        else
            S(1,ll) = (lz+2)*step;
            S(2,ll) = i*step;
            ll = ll+1;
        end;
        lz = i;
        J(i) = 0;
    end;
end;
h=figure(2);
subplot(4,1,1);
plot(py);
axis([1,size,-1,1]);
title('δ����Ĳ���');

%���
subplot(4,1,2);
plot(A);
axis([0,k,0,max(A)*1.1]);
line([1,k-1],[av,av]);
title('ƽ�����������������');

%�����
subplot(4,1,3);
plot(Y);
axis([0,k,0,max(Y)*1.1]);
line([1,k-1],[gate,gate]);
title('ƽ������������������');

% ��
%P = A.*Y;
subplot(4,1,4);
plot(J,'g');
axis([0,k,0,1.1]);
title('�з�Ч��');

