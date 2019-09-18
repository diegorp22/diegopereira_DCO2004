function varargout = exemplo(varargin)
% EXEMPLO MATLAB code for exemplo.fig
%      EXEMPLO, by itself, creates a new EXEMPLO or raises the existing
%      singleton*.
%
%      H = EXEMPLO returns the handle to a new EXEMPLO or the handle to
%      the existing singleton*.
%
%      EXEMPLO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXEMPLO.M with the given input arguments.
%
%      EXEMPLO('Property','Value',...) creates a new EXEMPLO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exemplo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exemplo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exemplo

% Last Modified by GUIDE v2.5 04-Sep-2019 15:06:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exemplo_OpeningFcn, ...
                   'gui_OutputFcn',  @exemplo_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before exemplo is made visible.
function exemplo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exemplo (see VARARGIN)

% Choose default command line output for exemplo
handles.output = hObject;

% Update handles structure
handles.tempo = 0:0.1:6;
guidata(hObject, handles);
% UIWAIT makes exemplo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = exemplo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function Amplitude_Callback(hObject, eventdata, handles)
axes(handles.dom_tempo);
y = get(handles.Amplitude,'Value').*sin(get(handles.Frequencia,'Value')*handles.tempo);
plot(handles.tempo,y);

axes(handles.dom_frequencia)
Y = fft(y);
Y(1) = [];
Y_mag = abs(Y);
plot(Y_mag);

% hObject    handle to Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Amplitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Frequencia_Callback(hObject, eventdata, handles)
axes(handles.dom_tempo);
y = get(handles.Amplitude,'Value').*sin(get(handles.Frequencia,'Value')*handles.tempo);
plot(handles.tempo,y);

axes(handles.dom_freq)
Y = fft(y);
Y(1) = [];
Y_mag = abs(Y);
plot(Y_mag);
% hObject    handle to Frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Frequencia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frequencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
