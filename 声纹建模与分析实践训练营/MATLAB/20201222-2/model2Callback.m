function model2Callback(hObject, eventdata, handles)
global fname
global Model

      % disp(fname.name);
      % disp(fname.wav);
      % disp(size(fname.feature));
      % disp(size(fname.test));
     if length(Model)==0
         Model=[];
         Model=[Model,fname];
     else
         n=length(Model);
         t=0;
         for i=1:n
              if strcmp(Model(i).name,fname.name)==1
                  t=1;
                  prompt={'repeat? yes or no?'};
                  title='The chance to you!';
                  ans=inputdlg(prompt,title);
                  if strcmp(ans,'yes')==1
                      Model(i).name=fname.name;
                      Model(i).wav=fname.wav;
                      Model(i).feature=fname.feature;
                      Model(i).test=fname.test; 
                      break;
                  else
                   h=msgbox('model has finished');
                   waitfor(h);
                   break;
                  end;
              end;
          end;
          if t==0
                Model=[Model,fname];
                  %Model=[Model,ini];
                 
          end;  
    end;
    n=length(Model);
    sprintf('Model num is %d',length(Model))
    for i=1:n
        disp(Model(i).name);
        disp(Model(i).wav);
        disp(size(Model(i).feature));
        disp(size(Model(i).test));
        
    end;
  
    
% hObject    handle to model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  %if strcmp(model(1).name,'')==1
    %       model=[model,fname];
   %     else 
  
      %Model=[];
      %ini=struct('name','','wav','','feature','','test','');
     
      %ini=struct('name','dd','wav','dd','feature','','test',''); 
 % if length(Model)==0
 %  Model=[];
 %     Model=[Model,fname];
  %    n=length(Model)
        % disp(Model(1).name);
        % disp(Model(1).wav);
       % disp(size(Model(1).feature));
     %   disp(size(Model(1).test));
     %end;
  
   
  
   
   