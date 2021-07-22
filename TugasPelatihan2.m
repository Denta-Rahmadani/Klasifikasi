function varargout = TugasPelatihan2(varargin)
% COBA3 MATLAB code for coba3.fig
%      COBA3, by itself, creates a new COBA3 or raises the existing
%      singleton*.
%
%      H = COBA3 returns the handle to a new COBA3 or the handle to
%      the existing singleton*.
%
%      COBA3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COBA3.M with the given input arguments.
%
%      COBA3('Property','Value',...) creates a new COBA3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before coba3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to coba3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help coba3

% Last Modified by GUIDE v2.5 10-Mar-2021 21:24:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @coba3_OpeningFcn, ...
                   'gui_OutputFcn',  @coba3_OutputFcn, ...
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


% --- Executes just before coba3 is made visible.
function coba3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to coba3 (see VARARGIN)

% Choose default command line output for coba3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes coba3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = coba3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
%BROWSE
function pushbutton1_Callback(hObject, eventdata, handles)
global a
[filename pathname]=uigetfile('*.jpg;*.png;*.bmp','Pick any file');
a= imread ([pathname,filename]);
axes(handles.axes1);
imshow(a);

% --- Executes on button press in pushbutton2.
%GRAYSCALE
function pushbutton2_Callback(hObject, eventdata, handles)
global a a_gray
a_gray=rgb2gray(a);
axes(handles.axes2);
imshow(a_gray);


%global a a_red
%a_red=a
%a_red(:,:,2:3)=0;
%axes(handles.axes2);
%imshow(a_red);

%global a a_blue
%a_blue=a
%a_blue(:,:,1)=0;
%a_blue(:,:,2)=0;
%axes(handles.axes2);
%imshow(a_blue);

%global a a_green
%a_green=a
%a_green(:,:,1)=0;
%a_green(:,:,2)=0;
%axes(handles.axes2);
%imshow(a_green);


% --- Executes on button press in pushbutton3.
%CROP
function pushbutton3_Callback(hObject, eventdata, handles)
global a
Icropped = imcrop(a);
axes(handles.axes2);
imshow(Icropped)


% --- Executes on button press in pushbutton4.
%RESIZE
function pushbutton4_Callback(hObject, eventdata, handles)
global a;
S=imresize(a,[100,500]);
axes(handles.axes2);
imshow(S)


% --- Executes on button press in pushbutton5.
%EDGE
function pushbutton5_Callback(hObject, eventdata, handles)
global a
axes(handles.axes2);
a_gray=rgb2gray(a);
BW=edge(a_gray,'canny');
imshow(BW);


% --- Executes on button press in pushbutton6.
%IMHIST
function pushbutton6_Callback(hObject, eventdata, handles)
global a
axes(handles.axes3);
imhist(a)


% --- Executes on button press in pushbutton7.
%Reset
function pushbutton7_Callback(hObject, eventdata, handles)
global a
axes(handles.axes2);
imshow(a);


% --- Executes on button press in pushbutton8.
%salt & pepper
function pushbutton8_Callback(hObject, eventdata, handles)
global a
p = imnoise(a,'canny');
imshow(p);
axes(handles.axes2);


% --- Executes on slider movement.
%Contras
function slider1_Callback(hObject, eventdata, handles)
global a
val=0.5*get(hObject,'value')-0.5;
imcontrast=a+val;
axes(handles.axes2);
imshow(imcontrast);
impixelinfo

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
