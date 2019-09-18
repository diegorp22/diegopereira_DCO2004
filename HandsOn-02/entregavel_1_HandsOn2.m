function varargout = entregavel_1_HandsOn2(varargin)
% HO_2 MATLAB code for HO_2.fig
%      HO_2, by itself, creates a new HO_2 or raises the existing
%      singleton*.
%
%      H = HO_2 returns the handle to a new HO_2 or the handle to
%      the existing singleton*.
%
%      HO_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HO_2.M with the given input arguments.
%
%      HO_2('Property','Value',...) creates a new HO_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HO_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HO_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HO_2

% Last Modified by GUIDE v2.5 04-Sep-2019 16:31:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HO_2_OpeningFcn, ...
                   'gui_OutputFcn',  @HO_2_OutputFcn, ...
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



% --- Executes just before HO_2 is made visible.
function entregavel_1_HandsOn2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HO_2 (see VARARGIN)

% Choose default command line output for HO_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HO_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HO_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function ger_sinal(fc)
tf = 2;                   % Tempo de duração da nota
fs = 100*fc;              % Frequência de amostragem da nota. 
t = 0:1/fs:tf;            % Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1;                    % Amplitude do sinal
y=A*cos(2*(9/8)*pi*fc*t); % Sinal senoidal
p = audioplayer(y, fs);   % Reproduzir o sinal gerado
play(p);                  % Reproduzir o sinal gerado
pause(tf);                % Forçar uma pausa com a duração do som a ser escutado
plot(t,y);                % Visualizar o sinal gerado  
axis([0 0.02 -2 2 ]);     % Zoom para melhor visualização

% --- Executes on button press in do.
function do_Callback(hObject, eventdata, handles)
% hObject    handle to do (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fc1 = 512;                 % Frequência da nota Dó
ger_sinal(fc1)             % Chamando a função para gerar sinal, plotar e reprozudir

% --- Executes on button press in re.
function re_Callback(hObject, eventdata, handles)
% hObject    handle to re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fc1 = 576;                 % Frequência da nota Ré
ger_sinal(fc1)             % Chamando a função para gerar sinal, plotar e reprozudir


% --- Executes on button press in mi.
function mi_Callback(hObject, eventdata, handles)
% hObject    handle to mi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fc1 = 640;                 % Frequência da nota Mi
ger_sinal(fc1)             % Chamando a função para gerar sinal, plotar e reprozudir


% --- Executes on button press in fa.
function fa_Callback(hObject, eventdata, handles)
% hObject    handle to fa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fc1 = 682.67;                 % Frequência da nota Fá
ger_sinal(fc1)             % Chamando a função para gerar sinal, plotar e reprozudir


% --- Executes on button press in sol.
function sol_Callback(hObject, eventdata, handles)
% hObject    handle to sol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fc1 = 768;                 % Frequência da nota Sol
ger_sinal(fc1)             % Chamando a função para gerar sinal, plotar e reprozudir


% --- Executes on button press in la.
function la_Callback(hObject, eventdata, handles)
% hObject    handle to la (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fc1 = 853.3;                 % Frequência da nota Lá
ger_sinal(fc1)             % Chamando a função para gerar sinal, plotar e reprozudir


% --- Executes on button press in si.
function si_Callback(hObject, eventdata, handles)
% hObject    handle to si (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fc1 = 960;                 % Frequência da nota Sí
ger_sinal(fc1)             % Chamando a função para gerar sinal, plotar e reprozudir

