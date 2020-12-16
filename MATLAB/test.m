clear;clc
% Doc:
% https://github.com/Baidu-AIP/speech-demo
% https://ai.baidu.com/ai-doc/SPEECH/Vk38lxily
% code: 
% client_id = 'your id';
% client_secret = 'your secret';
Host = webread( 'https://openapi.baidu.com/oauth/2.0/token?grant_type=client_credentials&client_id=Nmz5EO4FYF3qcauYNi7fyLXx&client_secret=Cxv6Z1W7PwU8i5HjdTNgHMfCGY7jlagz' );
Access_Token = Host.access_token;
request_url = 'http://vop.baidu.com/server_api';
 
[ Data, Freq] = audioread('cse.mp3');
newFreq = 16000;
[ P, Q ] = rat( newFreq/Freq );
Data = resample( Data, P, Q );
 
wavFilename = 'e.wav';
audiowrite(wavFilename, Data, newFreq);
 
[base64string, base64len]= base64file('e.wav');
options = weboptions('RequestMethod', 'post','HeaderFields',{ 'Content-Type','application/json'});
options.Timeout = 10;
Webpar = struct;
Webpar.format = 'wav';
Webpar.token = Access_Token;
Webpar.len = base64len;
Webpar.rate = 16000;
Webpar.speech = base64string;
Webpar.cuid = 'CUID';
Webpar.channel = 1;
Content = webwrite(request_url,Webpar,options);
disp(Content.result{:})
 
 