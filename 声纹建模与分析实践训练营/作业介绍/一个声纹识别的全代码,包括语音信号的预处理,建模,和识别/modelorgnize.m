function c=modelorgnize(data5)
global fname
%try     
        y=data5';
        wb=waitbar(1,'����Լ��,����ģ��...');
        
        %pause(0.5);
        %close(wb);
        
        Y=pdist(y);
        Z=linkage(Y,'average');
        %h=dendrogram(Z);
        c=cophenet(Z,Y);
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
        c=mean(b,1)%require the ��ֵ
        fname.test=int2str(c);
        hFig=figure(2);
        set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
        plot(c);%now finished Լ������
        pause(0.5);
        close(hFig);
       %***************
        initial=struct('name','','wav','','test','');
        model=[];
        model=[model,initial];
        if strcmp(model(1).name,'')==1
           model=[model,fname];
        else 
            n=length(model);
            for i=2:n
                if strcmp(model(i).name,fname.name)==1
                    h=msgbox('model has finished');
                    waitfor(h);
                    break;
                 else
                    model=[model,fname];
                 end;  
             end;  
         end;% now finished ����ģ��
         pause(0.5);
         close(wb);   
         h=msgbox('��ģ�ɹ�,ye!');
         waitfor(h);
   
         %catch
      % h=msgbox('��ģʧ��,���˳�!');
       %waitfor(h);
       
       %success = 0;
       %end;
