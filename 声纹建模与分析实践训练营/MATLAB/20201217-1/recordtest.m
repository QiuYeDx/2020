function recordtest(t,n)    %周期,周期数量
H = audiorecorder(16000,16,2);      
H.record;
pause(t); 
Hm=H.getaudiodata('double');
H1=Hm(:,1);
audiowrite('ls.wav',Hm,16000);

figure(1);
plot(H1);
title('原始语音信号');
grid on;
figure(2);
spectrogram(H1,256,128,256,16000,'yaxis');
xlabel('时间(s)');
ylabel('频率(Hz)');
title('语谱图');

 while n>0
H.resume;
pause(t); 
H.pause;
audiowrite('ls.wav',H1,16000);
Hm=H.getaudiodata('double');
H1=Hm(:,1);

figure(1);
plot(H1);
title('原始语音信号');
grid on;
figure(2);
spectrogram(H1,256,128,256,16000,'yaxis');
xlabel('时间(s)');
ylabel('频率(Hz)');
title('语谱图');
   drawnow;   
    HaoAudioTxt('ls.wav');
 see(ans);
   n=n-1;
 end
 HaoAudioTxt('ls.wav');
 see(ans);
 pause(t*n);
end
