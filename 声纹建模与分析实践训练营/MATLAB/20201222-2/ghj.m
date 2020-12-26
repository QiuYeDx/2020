function varargout = ghj(varargin)
global fname
global fname
global Model
global data0
global data1
global data2
global data3
global data4
global data5
global hFig
% GHJ M-file for ghj.fig
%      GHJ, by itself, creates a new GHJ or raises the existing
%      singleton*.
%
%      H = GHJ returns the handle to a new GHJ or the handle to
%      the existing singleton*.
%
%      GHJ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GHJ.M with the given input arguments.
%
%      GHJ('Property','Value',...) creates a new GHJ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ghj_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ghj_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ghj

% Last Modified by GUIDE v2.5 25-Apr-2006 11:30:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ghj_OpeningFcn, ...
                   'gui_OutputFcn',  @ghj_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
%--------------------{
%if nargin == 0  % LAUNCH GUI

	%fig = openfig(mfilename,'reuse');

	% Use system color scheme for figure:
	%set(fig,'Color',get(0,'defaultUicontrolBackgroundColor'));

	% Generate a structure of handles to pass to callbacks, and store it. 
	%handles = guihandles(fig);
	%guidata(fig, handles);

	%if nargout > 0
	%	varargout{1} = fig;
	%end

%elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK

%	try
	%	if (nargout)
		%	[varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
		%else
			%feval(varargin{:}); % FEVAL switchyard
		%end
	%catch
%		disp(lasterr);
	%end

    %end;

%--------------------------}
%---------------------------------------------
%img = imread('background.bmp');
%imagesc(img);
%set(gca,'visible','off');


%---------------------------------------------------
% --- Executes just before ghj is made visible.
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ghj (see VARARGIN)

% Choose default command line output for ghj;
function ghj_OpeningFcn(hObject,eventdata,handles,varargin)
img = imread('background.bmp');
imagesc(img);
set(gca,'visible','off');

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ghj wait for user response (see UIRESUME)
% uiwait(handles.figure);

%------------------------------------------------------------
% --- Outputs from this function are returned to the command line.
function varargout = ghj_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%------------------------------------------------------------
% --- Executes on button press in pushbutton1.
%function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%------------------------------------------------------------
% --- Executes on button press in pushbutton2.
%function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%------------------------------------------------------------
% --- Executes on button press in record.
function record_Callback(hObject, eventdata, handles)
recordCallback;

%------------------------------------------------------------
% --- Executes on button press in build.
function build_Callback(h, eventdata, handles, varargin)
global fname
buildCallback;
 %*********************************************************************


%------------------------------------------------------------
% --- Executes on button press in seeing.
function seeing_Callback(hObject, eventdata, handles)
global fname
fs=8000;
% hObject    handle to seeing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFig=figure(2);
set(hFig,'Position',[10 40 360 480],'Color',[0.2 0.6 0.5]);
y=wavread(fname.wav);
%wavwrite(y',fs,'shiyan1.wav');
appear(y);
pause(1);
close(hFig);





%----------------------------------------------------------
% --- Executes on button press in listening.
function listening_Callback(hObject, eventdata, handles)
global fname
% hObject    handle to listening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=8000;
y=wavread(fname.wav);
wavwrite(y',fs,'shiyan.wav');
%wavplay(y,fs);
soundview('shiyan.wav');

%---------------------------------------------------------------
% --- Executes on button press in model.
function model_Callback(hObject, eventdata, handles)
%global model
global fname
global Model
model2Callback;
% hObject    handle to model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

      
       
  

%-----------------------------------------------------------------
% --- Executes on button press in fre_rec.
function fre_rec_Callback(hObject, eventdata, handles)
% hObject    handle to fre_rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%-------------------------------------------------------------
% --- Executes on button press in recognize.
function recognize_Callback(hObject, eventdata, handles)
global fname
global Model
% hObject    handle to recognize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global model
%global fname
recognizeCallback
%=============================================
   
    %the following is SR's recognization
%n = [];
%fid = fopen('global.txt','r');
%if fid~=-1,
    %try
        %while feof(fid)==0,
            %a = fscanf(fid,'%d,');
           % un = fscanf(fid,'%s,');
           % un = un(1:end-1);
           % un = char(un(1:2:end)*256+un(2:2:end));
          %  if length(n)<1,
         %       n = {un};
        %    else
           %     n = {n{1},un};
         %   end;
          %  aname = sprintf('temp%d.txt',a);
         %   arr = csvread(aname);
        %    t = [t,compare(data3,arr)];
       % end;
   % catch
      %  msgbox('模版不齐全','错误','error');
     %   fclose(fid);
    %    return;
   % end;
  %  fclose(fid);
  %  [p,q]=max(t);
 %   msgbox(sprintf('%50.49f',p),sprintf('you are %s',n{q}));
%end;

%close(hFig);
%waitbar(1,wb);
%close(wb);

%------------------------------------------------------------
% --- Executes on button press in gender.
%function gender_Callback(hObject, eventdata, handles)
% hObject    handle to gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%------------------------------------------------------------
% --- Executes on button press in over.
%function over_Callback(hObject, eventdata, handles)
% hObject    handle to over (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in gender.
function gender_Callback(hObject, eventdata, handles)
global fname
% hObject    handle to gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g = gender(fname.wav);
Data = [];
if strcmp(g,'boy')~=0,
    Data = imread('boy.bmp');
else
    Data = imread('girl.bmp');
end;
msgbox(g,'你是:','custom',Data,hot(64));




% --- Executes on button press in over.
function over_Callback(hObject, eventdata, handles)
% hObject    handle to over (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global model
prompt={'te be deleted the name is:'};
title='eliminate';
answer=inputdlg(prompt,title);


len=length(model);
for i=1:2:len-2
    if strcmp(answer,model(i).name)==1
        if i==len
            len=len-2;
        else
            for j=i:2:len-2
                model(i).name=model(i+2).name;
                model(i).wav=model(i+2).wav;
                model(i).test=model(i+2).test;
            end;
            len=len-2;
        end;
    end;
end;
len