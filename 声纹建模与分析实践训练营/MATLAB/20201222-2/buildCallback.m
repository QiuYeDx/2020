function buildCallback(h, eventdata, handles, varargin)
global fname
fname=recordCallback;
%function build_Callback(hObject, eventdata, handles)
% hObject    handle to build (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%w=lpcf(fname.wav);



%if (strcmp(fname.name,'')==1),msgbox('����¼��','����','error');return;end;
success = 1;
%pTime = 1.5;

 %************************************************************************


if (strcmp(fname.name,'')==0)
    try
        wb = waitbar(0,'���ݴ�����');
        pause(0.1);
        close(wb);
        %set(wb,'name','��Ƶ����...');
        wb=waitbar(0.1,'��Ƶ����...');
        %[y,fs,bits]=wavread(fname.wav);
        %hFig = figure(2);
        %set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data0 = f_risen(fname.wav);
        %pause(0.5);
        %close(hFig);% now finished 'f_risen'
        pause(0.5);
        close(wb);
        h=msgbox('��Ƶ�����ɹ�,ye!');
        waitfor(h);
    catch
        h=msgbox('��Ƶ����ʧ��!');
        waitfor(h);close(wb);
    end;
end;   
    
%if success==0, 
%    close(hFig);  
%end;%if error,should how to do
  %************************************************************************
 
         %set(wb,'visible','on');
         %pause(pTime);
         %waitbar(0.2,wb);
         %set(wb,'name','�˲�...');
    try
        wb=waitbar(0.2,'�˲�');
        %hFig = figure(2);
        %set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data1 = lubo(data0);
        %pause(0.5);
        %close(hFig);% now finished 'lubo'
        pause(0.5);
        close(wb);
        h=msgbox('�˲��ɹ�,ye!');
        waitfor(h);
    catch
        h=msgbox('�˲�ʧ��!');
        waitfor(h);
        close(wb);
       
       % success = 0;
    end;
     %if success==0, close(wb);close(hFig);end;%if error,should how to do
   %************************************************************************      
         %set(wb,'visible','on');
         %waitbar(0.4,wb);
         %set(wb,'name','�ִ�...');
        
    try 
        wb=waitbar(0.4,'�ִ�...');
        hFig = figure(2);
        set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data2 = fenci(data1);
        data3=msound(data2,data1);
        pause(0.5);
        close(hFig);% now finished 'fenci'
        pause(0.5);
        close(wb);
        h=msgbox('�ִʳɹ�,ye!');
        waitfor(h);
    catch
       h=msgbox('�ִ�ʧ��,sorry!');
       waitfor(h);
       %success = 0;
       close(wb);
      
    end;
     %if success==0, close(wb);close(hFig); end;%if error,should how to do
 %************************************************************************          
      %set(wb,'visible','on');
      %pause(pTime);
      %waitbar(0.6,wb);
      %et(wb,'name','��֡...');
      
    try
        wb=waitbar(0.6,'��֡...');
        hFig = figure(2);
        set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data4 = enframe(data3,256,80);
        pause(0.5);
        close(hFig);% now finished 'enframe'
        pause(0.5);
        close(wb);
        h=msgbox('��֡�ɹ�,ye!');
        waitfor(h);
    catch
       h=msgbox('��֡ʧ��,���˳�!');
       waitfor(h);
       close(wb);
       %success = 0;
    end;
     %if success==0,close(wb); close(hFig);end;%if error,should how to do
   %************************************************************************      
      %set(wb,'visible','on');
      %pause(pTime);
      %waitbar(0.9,wb);
      %set(wb,'name','�Ӵ�����ȡ����...');
      
    try
        wb=waitbar(0.8,'�Ӵ�����ȡ����...');
        hFig = figure(2);
        set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data5=addwinlpc(data4);
        fname.feature=data5;
        sprintf('fname.feature is %d %d',size(fname.feature,1),size(fname.feature,2));
        pause(0.5);
        close(hFig);% now finished 'lubo'
        pause(0.5);
        close(wb);
        h=msgbox('��ʼ������ȡ�ɹ�,ye!');
        waitfor(h);
    catch
       h=msgbox('��ʼ������ȡʧ��,���˳�!');
       waitfor(h);
       %success = 0;
       close(wb);
     
   end;
    % if success==0, close(hFig);close(wb);end;%if error,should how to do
    %************************************************************************     
      %set(wb,'visible','on');
      %pause(pTime);
      %waitbar(1,wb);
      %set(wb,'name','����Լ��,����ģ��...');
      
    try
        wb=waitbar(1,'����Լ��,����ģ��...');
        
        %pause(0.5);
        %close(wb);
        y=data5';
        Y=pdist(y);
        Z=linkage(Y,'average');
        %h=dendrogram(Z);
        c=cophenet(Z,Y);%Խ�ӽ�1Խ��
        g=num2str(c);
        h=msgbox(g);
        waitfor(h);%only press the waitfor(h),you can perform the after
        T=cluster(Z,'maxclust',10);% now finished ����
        for j=1:10
            rr=find(T==j);%���������j��Ԫ�ر��,notice��T�����Ĳ�һ��,T is Ԫ�ض�Ӧ������,find(T==j)�Ľ����Ԫ�صı��
            ee=length(rr);
            for i=1:ee
               a(i,j)=rr(i);%make T to a mxtrix,the difficulty is the column is not same,I take it
            end;
        end;%T������y��Ԫ�����ڵڼ���ı��,namely,������ı��,Ԫ�ػ���origion arrangement
        for j=1:10
            for i=1:size(a,1)
                if a(i,j)>0
                   t=a(i,j);
                   b(i,j)=y(t);
                else
                   continue;
                end;
            end;
        end;
        c=mean(b,1);%require the ��ֵ
        fname.test=c;
        hFig=figure(2);
        set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        plot(c);%now finished Լ������
        pause(0.5);
        close(hFig);
       %***************
       % initial=struct('name','','wav','','test','');
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
   %      end;% now finished ����ģ��
     %    modelCallback;
         pause(0.5);
         close(wb);   
         h=msgbox('��ģ�ɹ�,ye!�Ƿ�Ҫ����ģ���Model?');
         waitfor(h);
        disp(fname.name);
        disp(fname.wav);
        disp(size(fname.feature));
        disp(size(fname.test));
 catch
       h=msgbox('��ģʧ��,���˳�!');
       waitfor(h);
       
       %success = 0;
 end;

 %if success==0, close(wb); end;%if error,should how to do
 xl=fname.feature
 x2=fname.test