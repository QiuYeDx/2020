function fname=recordCallback(hObject, eventdata, handles)
global fname

% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%error=0;
a='请输入你的名字(采用汉字输入,如:郭慧娟)';
b='请输入您的文件名(采用名字的开头字母,如:ghj.wav)';
prompt={char(a),char(b)};
title='请录入record';
%AddOpts.resize='on';
ans=cellstr(inputdlg(prompt,title));%create cll array of strings from character array
%pause(1);
%waitfor(inputdlg);
   if (strcmp(ans(1),'')==1)
    h=errordlg('error');waitfor(h);return
   end;
%以上为inputdlg输入对话框设置,要求输入名字与文件名

fs = 8000; 
success=1;
fname=struct('name','','wav','','feature','','test','');
try 
        wb = waitbar(0,'在进度条结束后开始录音，您有3秒钟的录音时间','name','请准备...');
        for i=1:100,waitbar(i/100,wb);pause(0.01);end;
        set(wb,'name','请说"西华大学"...');
        y = wavrecord(fs*3,fs,'double');
        close(wb);
        name=ans(1);
        wav=ans(2);
        fname.name=name{1,1};
        fname.wav=wav{1,1};
       % fname =struct('name',ans(1),'wav',ans(2),'feature','','test','');
        wavwrite(y',fs,fname.wav);
catch
         success = 0;
         fname=[];
end;

if success == 1,
    hBox = msgbox('录制文件成功','成功');
    %waitfor(hBox);
    pause(1);
    close(hBox);
else
    hBox = msgbox('可能你的文件为只读属性','失败','warn');
    %waitfor(hBox);
    pause(1);
    close(hBox);
end;
h=msgbox(fname.name  ,fname.wav);
waitfor(h);