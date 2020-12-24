function varargout = VoiceRecognition(varargin)
% VOICERECOGNITION MATLAB code for VoiceRecognition.fig
%      VOICERECOGNITION, by itself, creates a new VOICERECOGNITION or raises the existing
%      singleton*.
%
%      H = VOICERECOGNITION returns the handle to a new VOICERECOGNITION or the handle to
%      the existing singleton*.
%
%      VOICERECOGNITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VOICERECOGNITION.M with the given input arguments.
%
%      VOICERECOGNITION('Property','Value',...) creates a new VOICERECOGNITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VoiceRecognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VoiceRecognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VoiceRecognition

% Last Modified by GUIDE v2.5 08-Apr-2020 19:08:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VoiceRecognition_OpeningFcn, ...
                   'gui_OutputFcn',  @VoiceRecognition_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
%%

% --- Executes just before VoiceRecognition is made visible.
function VoiceRecognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VoiceRecognition (see VARARGIN)

% Choose default command line output for VoiceRecognition
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VoiceRecognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%%

% --- Outputs from this function are returned to the command line.
function varargout = VoiceRecognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%%

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TextOut1 = '录音中';
set( handles.edit1, 'String', TextOut1 ); % 显示处理数据在交互界面
myrecorder = audiorecorder(44100,16,1);
recordblocking(myrecorder,8);
recorder_array = getaudiodata(myrecorder);
recorder_array = recorder_array';
% pause(1);
audiowrite('录音文件.wav',recorder_array,44100);
TextOut2 = '录音完成';
set( handles.edit1, 'String', TextOut2 ); % 显示处理数据在交互界面
%%

% --- Executes on button press in pushbutton3.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 初始化相关参数
load('recorder_filter.mat');%load滤波器设置，带通600-1600
bohao = [697,1209;697,1336;697,1477;770,1209;770,1336;770,1477;852 1209;852 1336;852 1477;941 1336];%从1-9-0的频率
[recorder,fs]=audioread('生成音频文件.wav');%录音文件
% sound(recorder,fs);
N = length(recorder);%音频文件的长度
% figure(1);plot((1:N)/fs,recorder);

% 对录音进行滤波
recorder = filter(recorder_filter,1,recorder);
recorder(abs(recorder)<0.001) = 0;

% 求短时能量
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

% 通过对短时能量求反,利用findpeaks函数找波谷
En_reverse = [];
En_reverse = max(En)*3 - En;%取反
[minv,minl]=findpeaks(En_reverse,'minpeakdistance',100);%找波谷，波谷间隔为100帧
hold on;plot(frameTime(minl),En(minl),'o','color','r');hold off;

% 对音频进行分割，得到单独的单一拨号的片段
En(En<0.00001) = 0;
target = En(minl);
point = [];
for i =1:length(minl)
    point(i) = find(time==frameTime(minl(i)));
end
% 进行FFt运算得到频率
figure(3);
fs_result = [];
for i = 1:length(point)-1
    temp = recorder(point(i)+1:point(i+1));
    temp = filter(recorder_filter,1,temp);
    subplot(2,1,1);plot((point(i)+1:point(i+1))/fs,temp);
    [P1,f] = fft_recorder(temp,fs);
    [pk1,lc1] = findpeaks(P1,'SortStr','descend','NPeaks',2);
    fs_result = [fs_result;f(lc1)];
    subplot(2,1,2);plot(f,P1);axis([0 2000 0 inf]);
end
% 对fs_result进行排序，运算找到最接近的频率
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
        number = [number temp];
        err = [];
    end
end
disp(number);
set( handles.editS2, 'String', num2str( number ) ); % 显示处理数据在交互界面
%%

function editS1_Callback(hObject, eventdata, handles)
% hObject    handle to editS1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editS1 as text
%        str2double(get(hObject,'String')) returns contents of editS1 as a double
%%

% --- Executes during object creation, after setting all properties.
function editS1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editS1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function editS2_Callback(hObject, eventdata, handles)
% hObject    handle to editS2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editS2 as text
%        str2double(get(hObject,'String')) returns contents of editS2 as a double
%%

% --- Executes during object creation, after setting all properties.
function editS2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editS2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TextOut3 = '原始音频制作中';
set( handles.edit1, 'String', TextOut3 ); % 显示处理数据在交互界面
%clear;clc;
%% 初始化相关数据
A=10;%振幅
fs=44100;   %采样频率
N=8820;    % 信号样点数，每个音频播放时长
y = [];%用来存储音频数据
i_all = [2,10,1,9,4,8,1,3];%用来记录每次i的值
f = [697,1209;697,1336;697,1477;770,1209;770,1336;770,1477;852 1209;852 1336;852 1477;941 1336];%从1-9-0的频率
% myrecorder = audiorecorder(44100,16,1);
%% 生成随机音频并播放
for j=1:8
     y = [y A*sin(2*pi*f(i_all(j),1)*(0:N-1)/fs)+A*sin(2*pi*f(i_all(j),2)*(0:N-1)/fs) zeros(1,4410) ];
 %    y = [y A*sin(2*pi*f(i,1)*(0:N-1)/fs)+A*sin(2*pi*f(i,2)*(0:N-1)/fs) zeros(1,randi([1,8820]))];
end
%sound(y,fs);
% disp('record start!');
% recordblocking(myrecorder,length(y)/10000);
% disp('record end!');
% myrecorder_array = getaudiodata(myrecorder);
% plot((1:length(myrecorder_array))/44100,myrecorder_array);
audiowrite('生成音频文件.wav',y,fs);
for i =1:length(i_all)
    if i_all(i) == 10
        i_all(i) = 0;
    end
end
disp(i_all);
TextOut4 = '原始音频制作完成';
set( handles.edit2, 'String', TextOut4 ); % 显示处理数据在交互界面
set( handles.editS1, 'String', num2str( i_all ) ); % 显示处理数据在交互界面
sound(y,fs);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 初始化相关参数
load('recorder_filter.mat');%load滤波器设置，带通600-1600
bohao = [697,1209;697,1336;697,1477;770,1209;770,1336;770,1477;852 1209;852 1336;852 1477;941 1336];%从1-9-0的频率
[recorder,fs]=audioread('录音文件.wav');%录音文件
recorder = recorder/(max(abs(recorder)));%归一化
sound(recorder,fs);
N = length(recorder);%音频文件的长度
% figure(1);plot((1:N)/fs,recorder);

% 对录音进行滤波
recorder = filter(recorder_filter,1,recorder);%滤波
recorder(abs(recorder)<0.001) = 0;

% 求短时能量
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

% 通过对短时能量求反,利用findpeaks函数找波谷
En_reverse = [];
En_reverse = max(En)*3 - En;%取反
[minv,minl]=findpeaks(En_reverse,'minpeakdistance',100);%找波谷，波谷间隔为100帧
hold on;plot(frameTime(minl),En(minl),'o','color','r');hold off;

% 对音频进行分割，得到单独的单一拨号的片段
En(En<0.00001) = 0;
target = En(minl);
point = [];
for i =1:length(minl)
    point(i) = find(time==frameTime(minl(i)));
end

% 进行FFt运算得到频率
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
% 对fs_result进行排序，运算找到最接近的频率
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
x=length(find(number==i_all))/length(i_all);
number=[number x];
disp(number);%num2str( number )
set( handles.editS2, 'String',  num2str( number )); % 显示处理数据在交互界面
%%

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

%%
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
%%

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%
