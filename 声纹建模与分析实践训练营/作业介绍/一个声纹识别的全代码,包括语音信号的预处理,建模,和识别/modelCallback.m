function model2Callback(hObject, eventdata, handles)
global fname;
global Model;
   %     disp(fname.name);
   %     disp(fname.wav);
   %     disp(size(fname.feature));
   %      disp(size(fname.test));
% hObject    handle to model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  %if strcmp(model(1).name,'')==1
    %       model=[model,fname];
   %     else 
   if length(Model)==0
      %Model=[];
      %ini=struct('name','','wav','','feature','','test','');
      Model=[];
      %ini=struct('name','dd','wav','dd','feature','','test','');
      
      Model=[Model,fname];
      n=length(Model)
        % disp(Model(1).name);
        % disp(Model(1).wav);
       % disp(size(Model(1).feature));
     %   disp(size(Model(1).test));
    end;
  
   
  
   
   