function Y = relate(A,B,ln)
%计算相关性，自动对齐数据
len1 = length(A);
len2 = length(B);
if len1>len2,
    for i=1:len1,
        j = i*len2/len1;
        k = j - floor(j);
        j = ceil(j);
        if j >= len2,
            C(i) = B(len2);
        else
            C(i) = B(j)*k+B(j+1)*(1-k);
        end;
    end;
    B = smooth(C);
    A = smooth(A);
elseif len1<len2,
    for i=1:len2,
        j = i*len1/len2;
        k = j - floor(j);
        j = ceil(j);
        if j >= len1,
            C(i) = A(len1);
        else
            C(i) = A(j)*k+A(j+1)*(1-k);
        end;
    end;
    A = smooth(C);
    B = smooth(B);
end;

% subplot(2,1,1);
% plot(A);
% subplot(2,1,2);
% plot(B);
% pause(0);

Sa = 0;
Sb = 0;
Sc = 0;
mo=who('ln');
l=length(mo);
if  l== 0,
    len = length(A);
else
    len = ln;
end;
for i=1:len,
    Sa = (A(i)*A(i))+Sa;
    Sb = (B(i)*B(i))+Sb;
    Sc = (A(i)*B(i))+Sc;
end;
if Sa == 0 || Sb == 0,
    Y = Inf;
else
    Y = Sc/((Sa*Sb)^0.5);
end;
