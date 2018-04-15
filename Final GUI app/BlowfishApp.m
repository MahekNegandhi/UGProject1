function varargout = BlowfishApp(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BlowfishApp_OpeningFcn, ...
                   'gui_OutputFcn',  @BlowfishApp_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

function BlowfishApp_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


function varargout = BlowfishApp_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function InputText_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function InputText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object deletion, before destroying properties.
function InputText_DeleteFcn(hObject, eventdata, handles)



function Key_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function Key_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
objBF = Blowfish();
tic
keyString = get(handles.Key,'String');
key = double(keyString);
objBF = objBF.InitializeBlowfish(key,length(key));
KeyTime = toc;
tic
dataString = get(handles.InputText,'String');
len = length(dataString);
if mod(len,6) ~= 0
    for i = len+1:len+6-mod(len,6)
        dataString(i) = ' ';
    end
end
dec32 = convertString(dataString,1);
for i = 1:2:length(dec32)-1
    [dec32(i),dec32(i+1)]= objBF.Blowfish_encipher(dec32(i),dec32(i+1));
end
ciphered = convertint32(dec32,1);
encipherTime = toc;
set(handles.edit5,'String',ciphered);
set(handles.KeyTime,'String',KeyTime);
set(handles.EncipherTime,'String',encipherTime);
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, ~, handles)
objBF = Blowfish();
tic
keyString = get(handles.Key,'String');
key = double(keyString);
objBF = objBF.InitializeBlowfish(key,length(key));
KeyTime = toc;
tic
dataString = get(handles.InputText,'String');
dec32 = convertString(dataString,2);
for i = 1:2:length(dec32)-1
    [dec32(i),dec32(i+1)]= objBF.Blowfish_decipher(dec32(i),dec32(i+1));
end
ciphered = convertint32(dec32,2);
decipherTime = toc;
set(handles.edit5,'String',ciphered);
set(handles.KeyTime,'String',KeyTime);
set(handles.DecipherTime,'String',decipherTime);

function edit5_Callback(~, ~, ~)

function edit5_CreateFcn(hObject, ~, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function KeyTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to KeyTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function EncipherTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EncipherTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function DecipherTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DecipherTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
