function seeingCallback(hObject, eventdata, handles)
global fname
fs=8000;
% hObject    handle to seeing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFig=figure(2);
set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
y=wavread(fname.wav);
wavwrite(y',fs,'shiyan1.wav');
appear('shiyan1.wav');
pause(1);
close(hFig);
