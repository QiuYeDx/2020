clear;
%% 初始化相关参数
load('recorder_filter.mat');%load滤波器设置，带通600-1600
bohao = [697,1209;697,1336;697,1477;770,1209;770,1336;770,1477;852 1209;852 1336;852 1477;941 1336];%从1-9-0的频率
[recorder,fs]=audioread('MyRecorder5s.wav');%录音文件
recorder = recorder/(max(abs(recorder)));%归一化
sound(recorder,fs);
N = length(recorder);%音频文件的长度
% figure(1);plot((1:N)/fs,recorder);

%% 对录音进行滤波
recorder = filter(recorder_filter,1,recorder);%滤波
recorder(abs(recorder)<0.001) = 0;

%% 求短时能量
wlen=200; inc=80;          % 给出帧长和帧移
win=hanning(wlen);         % 给出海宁窗
X=enframe(recorder,win,inc)';     % 分帧
fn=size(X,2);              % 求出帧数
time=(0:N-1)/fs;           % 计算出信号的时间刻度
for i=1 : fn
    u=X(:,i);              % 取出一帧
    u2=u.*u;               % 求出能量
    En(i)=sum(u2);         % 对一帧累加求和
end
frameTime=frame2time(fn,wlen,inc,fs);   % 求出每帧对应的时间
figure(2);
subplot 211; plot(time,recorder); % 画出时间波形 
title('MORSE语音波形');
ylabel('幅值'); xlabel(['时间/s' 10 '(a)']);
subplot 212; plot(frameTime,En)     % 画出短时能量图
title('短时能量');
ylabel('幅值'); xlabel(['时间/s' 10 '(b)']);

%% 通过对短时能量求反,利用findpeaks函数找波谷
En_reverse = [];
En_reverse = max(En)*3 - En;%取反
[minv,minl]=findpeaks(En_reverse,'minpeakdistance',100);%找波谷，波谷间隔为100帧
hold on;plot(frameTime(minl),En(minl),'o','color','r');hold off;

%% 对音频进行分割，得到单独的单一拨号的片段
En(En<0.00001) = 0;
target = En(minl);
point = [];
for i =1:length(minl)
    point(i) = find(time==frameTime(minl(i)));
end

%% 进行FFt运算得到频率
fs_result = [];
for i = 1:length(point)-1
    figure(3);
    temp = recorder(point(i)+1:point(i+1));
    temp = filter(recorder_filter,1,temp);
    subplot(2,1,1);plot((point(i)+1:point(i+1))/fs,temp);
    [P1,f] = fft_recorder(temp,fs);
    [pk1,lc1] = findpeaks(P1,'SortStr','descend','NPeaks',2,'minpeakdistance',100);
    fs_result = [fs_result;f(lc1)];
    subplot(2,1,2);plot(f,P1,f(lc1),pk1,'o');axis([0 2000 0 inf]);
end
%% 对fs_result进行排序，运算找到最接近的频率
for i = 1:length(fs_result)
   fs_result(i,:) = sort(fs_result(i,:));
end
err = [];
number = [];
for i =1:length(fs_result)
    for j = 1:length(bohao)
        err = [err (fs_result(i,1)-bohao(j,1))^2+(fs_result(i,2)-bohao(j,2))^2];
    end
    if min(err) < 10
        temp = find(err == min(err));
        if temp == 10
            temp = 0;
        end
        disp(temp);
        number = [number temp];
    end
    err = [];
end

disp(number);