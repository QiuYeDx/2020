clear;
%% ¼����ȡ����
myrecorder = audiorecorder(44100,16,1);
recordblocking(myrecorder,5);
recorder_array = getaudiodata(myrecorder);
recorder_array = recorder_array';
% pause(1);
audiowrite('MyRecorder5s.wav',recorder_array,44100);
% plot((1:length(recorder_array))/44100,recorder_array);
% [y,fs]=audioread('recorder_2.wav');
% sound(y,fs);

%% ȥ�����������ҵ��Ͳ�����صĵط�
