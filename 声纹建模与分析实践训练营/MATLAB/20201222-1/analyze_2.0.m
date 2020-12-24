clear;
%% ��ʼ����ز���
load('recorder_filter.mat');%load�˲������ã���ͨ600-1600
bohao = [697,1209;697,1336;697,1477;770,1209;770,1336;770,1477;852 1209;852 1336;852 1477;941 1336];%��1-9-0��Ƶ��
[recorder,fs]=audioread('MyRecorder5s.wav');%¼���ļ�
recorder = recorder/(max(abs(recorder)));%��һ��
sound(recorder,fs);
N = length(recorder);%��Ƶ�ļ��ĳ���
% figure(1);plot((1:N)/fs,recorder);

%% ��¼�������˲�
recorder = filter(recorder_filter,1,recorder);%�˲�
recorder(abs(recorder)<0.001) = 0;

%% ���ʱ����
wlen=200; inc=80;          % ����֡����֡��
win=hanning(wlen);         % ����������
X=enframe(recorder,win,inc)';     % ��֡
fn=size(X,2);              % ���֡��
time=(0:N-1)/fs;           % ������źŵ�ʱ��̶�
for i=1 : fn
    u=X(:,i);              % ȡ��һ֡
    u2=u.*u;               % �������
    En(i)=sum(u2);         % ��һ֡�ۼ����
end
frameTime=frame2time(fn,wlen,inc,fs);   % ���ÿ֡��Ӧ��ʱ��
figure(2);
subplot 211; plot(time,recorder); % ����ʱ�䲨�� 
title('MORSE��������');
ylabel('��ֵ'); xlabel(['ʱ��/s' 10 '(a)']);
subplot 212; plot(frameTime,En)     % ������ʱ����ͼ
title('��ʱ����');
ylabel('��ֵ'); xlabel(['ʱ��/s' 10 '(b)']);

%% ͨ���Զ�ʱ������,����findpeaks�����Ҳ���
En_reverse = [];
En_reverse = max(En)*3 - En;%ȡ��
[minv,minl]=findpeaks(En_reverse,'minpeakdistance',100);%�Ҳ��ȣ����ȼ��Ϊ100֡
hold on;plot(frameTime(minl),En(minl),'o','color','r');hold off;

%% ����Ƶ���зָ�õ������ĵ�һ���ŵ�Ƭ��
En(En<0.00001) = 0;
target = En(minl);
point = [];
for i =1:length(minl)
    point(i) = find(time==frameTime(minl(i)));
end

%% ����FFt����õ�Ƶ��
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
%% ��fs_result�������������ҵ���ӽ���Ƶ��
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