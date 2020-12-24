function overCallback(hObject, eventdata, handles)
% hObject    handle to over (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global model

prompt={'te be deleted the name is:'};
title='eliminate';
answer=inputdlg(prompt,title)


len=length(model)
for i=1:2:len-2
    if strcmp(answer,model(i).name)==1
        if i==len
            n=len-2;
        else
            for j=i:2:len-2
                model(i).name=model(i+2).name;
                model(i).wav=model(i+2).wav;
                model(i).test=model(i+2).test;
            end;
            n=len-2;
        end;
    end;
end;
disp(n);