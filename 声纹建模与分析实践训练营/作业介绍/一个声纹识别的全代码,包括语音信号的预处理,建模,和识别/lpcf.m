function w=lpcf(fn)
[y,fs,bits]=wavread(fn);
y1=f_risen(y);
y2=lubo(y1);
S=fenci(y2);
Y=msound(S,y);
f=enframe(Y,256,80);
w=addwinlpc(f);


