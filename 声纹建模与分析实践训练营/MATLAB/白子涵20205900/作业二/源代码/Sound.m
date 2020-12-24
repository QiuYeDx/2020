clear;clc;
%% 初始化相关数据
A=10;%振幅
fs=44100;   %采样频率
N=8820;    % 信号样点数，每个音频播放时长
y = [];%用来存储音频数据
i_all = [];%用来记录每次i的值
f = [697,1209;697,1336;697,1477;770,1209;770,1336;770,1477;852 1209;852 1336;852 1477;941 1336];%从1-9-0的频率
% myrecorder = audiorecorder(44100,16,1);
%% 生成随机音频并播放
for j=1:10
    i = randi([1 10]);
    i_all = [i_all i];
     y = [y A*sin(2*pi*f(i,1)*(0:N-1)/fs)+A*sin(2*pi*f(i,2)*(0:N-1)/fs) zeros(1,4410) ];
 %    y = [y A*sin(2*pi*f(i,1)*(0:N-1)/fs)+A*sin(2*pi*f(i,2)*(0:N-1)/fs) zeros(1,randi([1,8820]))];
end
%sound(y,fs);
% disp('record start!');
% recordblocking(myrecorder,length(y)/10000);
% disp('record end!');
% myrecorder_array = getaudiodata(myrecorder);
% plot((1:length(myrecorder_array))/44100,myrecorder_array);
audiowrite('MySound.wav',y,fs);
for i =1:length(i_all)
    if i_all(i) == 10
        i_all(i) = 0;
    end
end
disp(i_all);