function varargout = wintervocationpractice(varargin)
% WINTERVOCATIONPRACTICE MATLAB code for wintervocationpractice.fig
%      WINTERVOCATIONPRACTICE, by itself, creates a new WINTERVOCATIONPRACTICE or raises the existing
%      singleton*.
%
%      H = WINTERVOCATIONPRACTICE returns the handle to a new WINTERVOCATIONPRACTICE or the handle to
%      the existing singleton*.
%
%      WINTERVOCATIONPRACTICE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WINTERVOCATIONPRACTICE.M with the given input arguments.
%
%      WINTERVOCATIONPRACTICE('Property','Value',...) creates a new WINTERVOCATIONPRACTICE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wintervocationpractice_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wintervocationpractice_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wintervocationpractice

% Last Modified by GUIDE v2.5 10-Jan-2019 16:12:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wintervocationpractice_OpeningFcn, ...
                   'gui_OutputFcn',  @wintervocationpractice_OutputFcn, ...
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


% --- Executes just before wintervocationpractice is made visible.
function wintervocationpractice_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wintervocationpractice (see VARARGIN)

% Choose default command line output for wintervocationpractice
warning off;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wintervocationpractice wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = wintervocationpractice_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
isrecording=getappdata(gcf,'isrecording');
if ~isrecording
setappdata(gcf,'isrecording',1);
recorder(gcf,handles);
else
setappdata(gcf,'isrecording',0);
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'bottom')
II=imread('1.jpg');
image(II)
colormap gray
set(ha,'handlevisibility','off','visible','off');
hold on;
hold off;
