  function varargout = AirWriting(varargin)
% AirWriting M-file for AirWriting.fig
%      AirWriting, by itself, creates a new AirWriting or raises the existing
%      singleton*.
%
%      H = AirWriting returns the handle to a new AirWriting or the handle to
%      the existing singleton*.
%
%      AirWriting('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AirWriting.M with the given input arguments.
%
%      AirWriting('Property','Value',...) creates a new AirWriting or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AirWriting_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AirWriting_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% editword the above text to modify the response to help AirWriting

% Last Modified by GUIDE v2.5 24-Feb-2018 13:52:58

% Begin initialization code - DO NOT EDITWORD
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AirWriting_OpeningFcn, ...
                   'gui_OutputFcn',  @AirWriting_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDITWORD


% --- Executes just before AirWriting is made visible.
function AirWriting_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AirWriting (see VARARGIN)
global SV
SV=actxserver('SAPI.SpVoice');
% Choose default command line output for AirWriting
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AirWriting wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AirWriting_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editword_Callback(hObject, eventdata, handles)
% hObject    handle to editword (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editword as text
%        str2double(get(hObject,'String')) returns contents of editword as a double


% --- Executes during object creation, after setting all properties.
function editword_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editword (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: editword controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% --- Executes on selection change in VOICE.
function VOICE_Callback(hObject, eventdata, handles)
% hObject    handle to VOICE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns VOICE contents as cell array
%        contents{get(hObject,'Value')} returns selected item from VOICE


% --- Executes during object creation, after setting all properties.
function VOICE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VOICE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function RATE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RATE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function VOLUME_Callback(hObject, eventdata, handles)
% hObject    handle to VOLUME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SV
volume=get(hObject,'Value')% Hints:  returns position of slider
SV.Volume=volume;

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function VOLUME_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VOLUME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in PAUSE.
function PAUSE_Callback(hObject, eventdata, handles)
% hObject    handle to PAUSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SV
  global TK
if strcmp(get(hObject,'String'),'PAUSE')
    set(hObject,'String','RESUME')
    invoke(SV,'Pause');
else
   set(hObject,'String','PAUSE') 
   invoke(SV,'Resume');
end


% --- Executes on button press in SPEAK.
function SPEAK_Callback(hObject, eventdata, handles)
% hObject    handle to SPEAK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SV
global TK
SV = actxserver('SAPI.SpVoice'); % Create COM server
  TK = invoke(SV,'GetVoices'); % token
set(handles.PAUSE,'Enable','on');
set(handles.PAUSE,'String','PAUSE');
SV.Volume=get(handles.VOLUME,'Value');
SV.Rate=get(handles.RATE,'Value');
SV.Voice = TK.Item(get(handles.VOICE,'Value')-1);
%'string in speak'
 s=get(handles.editword,'String');% Query object properties
 s=s';
 
 ismethod(SV,'Speak')
invoke(SV,'Speak',s,1);


% --- Executes on button press in startbutton.
function startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SV
global TK
global red
global prev
global ref
ref=1;
vid=webcam(2);
preview(vid);
prev=0;
word=' ';
prevword=' ';
spacecount=0;
while ref==1
    img=snapshot(vid);
    % Now to track red objects in real time
    % we have to subtract the red component
    % from the grayscale image to extract the red components in the image.
    %extract red component  
    red= imsubtract(img(:,:,1), rgb2gray(img));
    %extract blue component
    blue= imsubtract(img(:,:,3), rgb2gray(img));
    %Use a median filter to filter out noise
    red = medfilt2(red, [3 3]);
    blue = medfilt2(blue, [3 3]);
    % Convert the resultisng grayscale image into a binary image.
    red = im2bw(red,0.27);
    red = bwareaopen(red,266);
    red = logical(red);
    red=fliplr(red);
%     subplot(1,3,1),
%     imshow(red);
    
    
    blue = im2bw(blue,0.32);
    blue = bwareaopen(blue,266);
    blue = logical(blue);
    blue=fliplr(blue);
    
    [B,L,N]= bwboundaries(red,'noholes');
    a = regionprops(L,'centroid');
    [P,Q,R]=bwboundaries(blue,'noholes');
    b=regionprops(Q,'centroid');
    R
    N
    if R>=1 && N>=1

        a(1).Centroid(1,1)-b(1).Centroid(1,1)
        if (a(1).Centroid(1,1)-b(1).Centroid(1,1)>10)
            red=red|prev;
            outval=ocr(red,'TextLayout', 'Word');
            outwords=outval.Words
             set(handles.editletter,'String',outwords);
             if spacecount==0
                if(strfind(outwords{:},'A'))
                    outval2='A';
                    word=strcat(word,outval2);
                elseif(strfind(outwords{:},'B'))
                outval2='B';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'C'))
                outval2='C';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'D'))
                outval2='D';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'E'))
                outval2='E';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'F'))
                outval2='F';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'G'))
                outval2='G';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'H'))
                outval2='H';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'I'))
                outval2='I';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'J'))
                outval2='J';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'K'))
                outval2='K';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'L'))
                outval2='L';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'M'))
                outval2='M';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'N'))
                outval2='N';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'O'))
                outval2='O';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'P'))
                outval2='P';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'Q'))
                outval2='Q';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'R'))
                outval2='R';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'S'))
                outval2='S';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'T'))
                outval2='T';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'U'))
                outval2='U';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'V'))
                outval2='V';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'W'))
                outval2='W';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'X'))
                outval2='X';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'Y'))
                outval2='Y';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'Z'))
                outval2='Z';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'a'))
                    outval2='A';
                    word=strcat(word,outval2);
                elseif(strfind(outwords{:},'b'))
                outval2='B';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'c'))
                outval2='C';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'d'))
                outval2='D';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'e'))
                outval2='E';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'f'))
                outval2='F';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'g'))
                outval2='G';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'h'))
                outval2='H';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'i'))
                outval2='I';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'j'))
                outval2='J';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'k'))
                outval2='K';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'l'))
                outval2='L';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'m'))
                outval2='M';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'n'))
                outval2='N';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'o'))
                outval2='O';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'p'))
                outval2='P';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'q'))
                outval2='Q';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'r'))
                outval2='R';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'s'))
                outval2='S';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'t'))
                outval2='T';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'u'))
                outval2='U';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'v'))
                outval2='V';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'w'))
                outval2='W';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'x'))
                outval2='X';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'y'))
                outval2='Y';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'z'))
                outval2='Z';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'1'))
                    outval2='1';
                    word=strcat(word,outval2);
                elseif(strfind(outwords{:},'2'))
                outval2='2';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'3'))
                outval2='3';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'4'))
                outval2='4';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'5'))
                outval2='5';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'6'))
                outval2='6';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'7'))
                outval2='7';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'8'))
                outval2='8';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'9'))
                outval2='9';
                word=strcat(word,outval2);
                elseif(strfind(outwords{:},'0'))
                outval2='0';
                word=strcat(word,outval2);
                end
             end
            set(handles.editword,'String',word);
            pause(1);
            spacecount=spacecount+1;
            if spacecount==2
                SV = actxserver('SAPI.SpVoice'); % Create COM server
                TK = invoke(SV,'GetVoices'); % token
                set(handles.PAUSE,'Enable','on');
                set(handles.PAUSE,'String','PAUSE');
                SV.Volume=get(handles.VOLUME,'Value');
                SV.Rate=get(handles.RATE,'Value');
                SV.Voice = TK.Item(get(handles.VOICE,'Value')-1);
                kk=get(handles.editword,'String');
                kk=kk'
                invoke(SV,'Speak',kk,1);
                word=' ';
            end

        prev=0;
        red=0;
        elseif(a(1).Centroid(1,1)-b(1).Centroid(1,1)<-10)

            red=red|prev;
            spacecount=0;
        end
        prev=red;
    end
    axes(handles.axes1);
    imshow(red);
%     subplot(1,3,3),
%     imshow(blue);
     pause(0.08);
     
     
 
end
                 



function editletter_Callback(hObject, eventdata, handles)
% hObject    handle to editletter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editletter as text
%        str2double(get(hObject,'String')) returns contents of editletter as a double


% --- Executes during object creation, after setting all properties.
function editletter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editletter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clearbutton.
function clearbutton_Callback(hObject, eventdata, handles)
% hObject    handle to clearbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global red
global prev
prev=0;
red=0;


% --- Executes on button press in stopbutton.
function stopbutton_Callback(hObject, eventdata, handles)
% hObject    handle to stopbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ref
ref=0;

