function buildCallback(h, eventdata, handles, varargin)
global fname
fname=recordCallback;
%function build_Callback(hObject, eventdata, handles)
% hObject    handle to build (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%w=lpcf(fname.wav);



%if (strcmp(fname.name,'')==1),msgbox('请先录音','错误','error');return;end;
success = 1;
%pTime = 1.5;

 %************************************************************************


if (strcmp(fname.name,'')==0)
    try
        wb = waitbar(0,'数据处理中');
        pause(0.1);
        close(wb);
        %set(wb,'name','高频提升...');
        wb=waitbar(0.1,'高频提升...');
        %[y,fs,bits]=wavread(fname.wav);
        %hFig = figure(2);
        %set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data0 = f_risen(fname.wav);
        %pause(0.5);
        %close(hFig);% now finished 'f_risen'
        pause(0.5);
        close(wb);
        h=msgbox('高频提升成功,ye!');
        waitfor(h);
    catch
        h=msgbox('高频提升失败!');
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
         %set(wb,'name','滤波...');
    try
        wb=waitbar(0.2,'滤波');
        %hFig = figure(2);
        %set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data1 = lubo(data0);
        %pause(0.5);
        %close(hFig);% now finished 'lubo'
        pause(0.5);
        close(wb);
        h=msgbox('滤波成功,ye!');
        waitfor(h);
    catch
        h=msgbox('滤波失败!');
        waitfor(h);
        close(wb);
       
       % success = 0;
    end;
     %if success==0, close(wb);close(hFig);end;%if error,should how to do
   %************************************************************************      
         %set(wb,'visible','on');
         %waitbar(0.4,wb);
         %set(wb,'name','分词...');
        
    try 
        wb=waitbar(0.4,'分词...');
        hFig = figure(2);
        set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data2 = fenci(data1);
        data3=msound(data2,data1);
        pause(0.5);
        close(hFig);% now finished 'fenci'
        pause(0.5);
        close(wb);
        h=msgbox('分词成功,ye!');
        waitfor(h);
    catch
       h=msgbox('分词失败,sorry!');
       waitfor(h);
       %success = 0;
       close(wb);
      
    end;
     %if success==0, close(wb);close(hFig); end;%if error,should how to do
 %************************************************************************          
      %set(wb,'visible','on');
      %pause(pTime);
      %waitbar(0.6,wb);
      %et(wb,'name','分帧...');
      
    try
        wb=waitbar(0.6,'分帧...');
        hFig = figure(2);
        set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data4 = enframe(data3,256,80);
        pause(0.5);
        close(hFig);% now finished 'enframe'
        pause(0.5);
        close(wb);
        h=msgbox('分帧成功,ye!');
        waitfor(h);
    catch
       h=msgbox('分帧失败,请退出!');
       waitfor(h);
       close(wb);
       %success = 0;
    end;
     %if success==0,close(wb); close(hFig);end;%if error,should how to do
   %************************************************************************      
      %set(wb,'visible','on');
      %pause(pTime);
      %waitbar(0.9,wb);
      %set(wb,'name','加窗并提取特征...');
      
    try
        wb=waitbar(0.8,'加窗并提取特征...');
        hFig = figure(2);
        set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        data5=addwinlpc(data4);
        fname.feature=data5;
        sprintf('fname.feature is %d %d',size(fname.feature,1),size(fname.feature,2));
        pause(0.5);
        close(hFig);% now finished 'lubo'
        pause(0.5);
        close(wb);
        h=msgbox('初始特征提取成功,ye!');
        waitfor(h);
    catch
       h=msgbox('初始特征提取失败,请退出!');
       waitfor(h);
       %success = 0;
       close(wb);
     
   end;
    % if success==0, close(hFig);close(wb);end;%if error,should how to do
    %************************************************************************     
      %set(wb,'visible','on');
      %pause(pTime);
      %waitbar(1,wb);
      %set(wb,'name','特征约简,建立模型...');
      
    try
        wb=waitbar(1,'特征约简,建立模型...');
        
        %pause(0.5);
        %close(wb);
        y=data5';
        Y=pdist(y);
        Z=linkage(Y,'average');
        %h=dendrogram(Z);
        c=cophenet(Z,Y);%越接近1越好
        g=num2str(c);
        h=msgbox(g);
        waitfor(h);%only press the waitfor(h),you can perform the after
        T=cluster(Z,'maxclust',10);% now finished 聚类
        for j=1:10
            rr=find(T==j);%结果是属于j类元素编号,notice跟T描述的不一样,T is 元素对应的类编号,find(T==j)的结果是元素的编号
            ee=length(rr);
            for i=1:ee
               a(i,j)=rr(i);%make T to a mxtrix,the difficulty is the column is not same,I take it
            end;
        end;%T是所有y中元素属于第几类的编号,namely,就是类的编号,元素还按origion arrangement
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
        c=mean(b,1);%require the 均值
        fname.test=c;
        hFig=figure(2);
        set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        plot(c);%now finished 约简特征
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
   %      end;% now finished 加入模板
     %    modelCallback;
         pause(0.5);
         close(wb);   
         h=msgbox('建模成功,ye!是否要加入模板库Model?');
         waitfor(h);
        disp(fname.name);
        disp(fname.wav);
        disp(size(fname.feature));
        disp(size(fname.test));
 catch
       h=msgbox('建模失败,请退出!');
       waitfor(h);
       
       %success = 0;
 end;

 %if success==0, close(wb); end;%if error,should how to do
 xl=fname.feature
 x2=fname.test