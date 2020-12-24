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
TextOut1 = '¼����';
set( handles.edit1, 'String', TextOut1 ); % ��ʾ���������ڽ�������
myrecorder = audiorecorder(44100,16,1);
recordblocking(myrecorder,8);
recorder_array = getaudiodata(myrecorder);
recorder_array = recorder_array';
% pause(1);
audiowrite('¼���ļ�.wav',recorder_array,44100);
TextOut2 = '¼�����';
set( handles.edit1, 'String', TextOut2 ); % ��ʾ���������ڽ�������
%%

% --- Executes on button press in pushbutton3.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ��ʼ����ز���
load('recorder_filter.mat');%load�˲������ã���ͨ600-1600
bohao = [697,1209;697,1336;697,1477;770,1209;770,1336;770,1477;852 1209;852 1336;852 1477;941 1336];%��1-9-0��Ƶ��
[recorder,fs]=audioread('������Ƶ�ļ�.wav');%¼���ļ�
% sound(recorder,fs);
N = length(recorder);%��Ƶ�ļ��ĳ���
% figure(1);plot((1:N)/fs,recorder);

% ��¼�������˲�
recorder = filter(recorder_filter,1,recorder);
recorder(abs(recorder)<0.001) = 0;

% ���ʱ����
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

% ͨ���Զ�ʱ������,����findpeaks�����Ҳ���
En_reverse = [];
En_reverse = max(En)*3 - En;%ȡ��
[minv,minl]=findpeaks(En_reverse,'minpeakdistance',100);%�Ҳ��ȣ����ȼ��Ϊ100֡
hold on;plot(frameTime(minl),En(minl),'o','color','r');hold off;

% ����Ƶ���зָ�õ������ĵ�һ���ŵ�Ƭ��
En(En<0.00001) = 0;
target = En(minl);
point = [];
for i =1:length(minl)
    point(i) = find(time==frameTime(minl(i)));
end
% ����FFt����õ�Ƶ��
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
% ��fs_result�������������ҵ���ӽ���Ƶ��
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
set( handles.editS2, 'String', num2str( number ) ); % ��ʾ���������ڽ�������
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
TextOut3 = 'ԭʼ��Ƶ������';
set( handles.edit1, 'String', TextOut3 ); % ��ʾ���������ڽ�������
%clear;clc;
%% ��ʼ���������
A=10;%���
fs=44100;   %����Ƶ��
N=8820;    % �ź���������ÿ����Ƶ����ʱ��
y = [];%�����洢��Ƶ����
i_all = [2,10,1,9,4,8,1,3];%������¼ÿ��i��ֵ
f = [697,1209;697,1336;697,1477;770,1209;770,1336;770,1477;852 1209;852 1336;852 1477;941 1336];%��1-9-0��Ƶ��
% myrecorder = audiorecorder(44100,16,1);
%% ���������Ƶ������
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
audiowrite('������Ƶ�ļ�.wav',y,fs);
for i =1:length(i_all)
    if i_all(i) == 10
        i_all(i) = 0;
    end
end
disp(i_all);
TextOut4 = 'ԭʼ��Ƶ�������';
set( handles.edit2, 'String', TextOut4 ); % ��ʾ���������ڽ�������
set( handles.editS1, 'String', num2str( i_all ) ); % ��ʾ���������ڽ�������
sound(y,fs);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ��ʼ����ز���
load('recorder_filter.mat');%load�˲������ã���ͨ600-1600
bohao = [697,1209;697,1336;697,1477;770,1209;770,1336;770,1477;852 1209;852 1336;852 1477;941 1336];%��1-9-0��Ƶ��
[recorder,fs]=audioread('¼���ļ�.wav');%¼���ļ�
recorder = recorder/(max(abs(recorder)));%��һ��
sound(recorder,fs);
N = length(recorder);%��Ƶ�ļ��ĳ���
% figure(1);plot((1:N)/fs,recorder);

% ��¼�������˲�
recorder = filter(recorder_filter,1,recorder);%�˲�
recorder(abs(recorder)<0.001) = 0;

% ���ʱ����
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

% ͨ���Զ�ʱ������,����findpeaks�����Ҳ���
En_reverse = [];
En_reverse = max(En)*3 - En;%ȡ��
[minv,minl]=findpeaks(En_reverse,'minpeakdistance',100);%�Ҳ��ȣ����ȼ��Ϊ100֡
hold on;plot(frameTime(minl),En(minl),'o','color','r');hold off;

% ����Ƶ���зָ�õ������ĵ�һ���ŵ�Ƭ��
En(En<0.00001) = 0;
target = En(minl);
point = [];
for i =1:length(minl)
    point(i) = find(time==frameTime(minl(i)));
end

% ����FFt����õ�Ƶ��
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
% ��fs_result�������������ҵ���ӽ���Ƶ��
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
set( handles.editS2, 'String',  num2str( number )); % ��ʾ���������ڽ�������
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
