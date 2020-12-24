function recognizeCallback(hObject, eventdata, handles)
global Model
global fname
% hObject    handle to recognize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global model
%global fname
%ini=struct('name','','wav','');
%disp(fname.name);
n=length(Model)
%disp(Model(n).name);
a=[];
for i=1:n
    len1=length(fname.feature);
    len2=length(Model(i).feature);
    if len1<=len2
        k=len1;
    else
        k=len2;
    end;
    %a=[a,relate(str2num(fname.test),str2num(Model(i).test))];
    ss=fname.feature;
    tt=Model(i).feature;
    sss=ss(1:k);
    ttt=tt(1:k);
    answer=corrcoef(sss,ttt);
    a=[a,answer(1,2)];
    %fname.feature(1:10)
    %Model(i).feature(1:10)
end;
    [s,t]=max(a)
    if s>0.75 
      %fprintf('you are   %s,the possibility is   %d',Model(t).name,s);
      %str='you are ';
      %str1='     ,the possibility is  ';
      g=num2str(s);
      %com=strcat(str,Model(t).name,str1,g,'');
      %disp(com);
      
      h=msgbox(Model(t).name,'you are');
      waitfor(h);
      li=strcat('the possibility is ','  ',g);
      h=msgbox(li);
      waitfor(h);
    else
      msgbox('sorry,recognition fail!');
    end;
    % ini=struct('name','','wav','','test','');
        %model=[];
        %model=[model,initial];
      %  if strcmp(model(1).name,'')==1
    %       model=[model,fname];
   %     else 
    %        n=length(model);
    %        for i=2:n
   %             if strcmp(model(i).name,fname.name)==1
    %                h=msgbox('model has finished');
   %                 waitfor(h);
   %                 break;
   %              else
   %                 model=[model,fname];
  %               end;  
   %          end;  
   %      end;% now finished º”»Îƒ£∞Â
     %    modelCallback;