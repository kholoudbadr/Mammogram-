function varargout = GP(varargin)
% GP MATLAB code for GP.fig
%      GP, by itself, creates a new GP or raises the existing
%      singleton*.
%
%      H = GP returns the handle to a new GP or the handle to
%      the existing singleton*.
%
%      GP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GP.M with the given input arguments.
%
%      GP('Property','Value',...) creates a new GP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI original GP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GP

% Last Modified by GUIDE v2.5 27-May-2017 13:55:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GP_OpeningFcn, ...
                   'gui_OutputFcn',  @GP_OutputFcn, ...
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


% --- Executes just original GP is made visible.
function GP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GP (see VARARGIN)

% Choose default command line output for GP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GP wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = GP_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('mm.png'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

function input=FillImage(i)
input=imread(i);
input = imresize(input, [512 512]);
if size(input, 3) == 3
input = rgb2gray(input);
 
end

function [bw,level]=fcmthresh(IM,sw)
%FCMTHRESH Thresholding by 3-class fuzzy c-means clustering
%  [bw,level]=fcmthresh(IM,sw) outputs the binary image bw and threshold level of
%  image IM using a 3-class fuzzy c-means clustering. It often works better
%  than Otsu's methold which outputs larger or smaller threshold on
%  fluorescence images.
%  sw is 0 or 1, a switch of cut-off position.
%  sw=0, cut between the small and middle class
%  sw=1, cut between the middle and large class
%
%  Contributed by Guanglei Xiong (xgl99@mails.tsinghua.edu.cn)
%  at Tsinghua University, Beijing, China.

% check the parameters

if (nargin<1)
    error('You must provide an image.');
elseif (nargin==1)
    sw=0;
elseif (sw~=0 && sw~=1)
    error('sw must be 0 or 1.');
end

data=reshape(IM,[],1);
[center,member]=fcm(data,3);
[center,cidx]=sort(center);
member=member';
member=member(:,cidx);
[maxmember,label]=max(member,[],2);
if sw==0
    level=(max(data(label==1))+min(data(label==2)))/2;
else
    level=(max(data(label==2))+min(data(label==3)))/2;
end
bw=im2bw(IM,level); 

function setGlobalx(val)
global x
x = val;

function r = getGlobalx
global x
r = x;


FileID = fopen('Classify\CALC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
CALC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\ASYM_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
ASYM_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\CIRC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
CIRC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\MISC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
MISC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\SPIC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
SPIC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\ARCH_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
ARCH_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\NORM_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
NORM_class_core_vector = complex(Features_real, Features_imag);

function togglebutton1_Callback(hObject, eventdata, handles)
i=imgetfile();
original=FillImage(i);
setGlobalx(original)
axes(handles.Original)
imshow(original);
% original=set(handles.original)


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% Read Image
% i=imgetfile();
% input=imread(i);
% input = imresize(input, [512 512]);
% if size(input, 3) == 3
% input = rgb2gray(input);
% end
input=getGlobalx;
%% PreProcess

preprocessed= preprocess(input);

%% Morphological Operations

morph= enhanced_log(preprocessed);

axes(handles.axes7)
imshow(morph);
%% Wavelet denoising

denoisedImage=waveletDenoise(morph);
axes(handles.axes8)
imshow(denoisedImage);
%% CLAHE

value = adapthisteq(denoisedImage,'clipLimit',0.01,'Distribution','exponential', 'Alpha', 0.2, 'NBins', 128);
axes(handles.axes9)
imshow(value);
%% Guided Image Filtering

FinalImage=guided(value);
axes(handles.axes10)
imshow(FinalImage);

% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
im=getGlobalx;
fim=mat2gray(im);
% level=graythresh(fim);
% bwfim=im2bw(fim,level);
% [bwfim0,level0]=fcmthresh(fim,0);
[bwfim1,level1]=fcmthresh(fim,1);
axes(handles.axes12)

imshow(bwfim1);

% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
% handles.classif
clss=getGlobalx;

FileID = fopen('Classify\CALC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
CALC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\ASYM_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
ASYM_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\CIRC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
CIRC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\MISC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
MISC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\SPIC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
SPIC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\ARCH_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
ARCH_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('Classify\NORM_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
NORM_class_core_vector = complex(Features_real, Features_imag);

feature_vector_test=Perform_Feature_vector(clss);
ret = Classify(feature_vector_test , CALC_class_core_vector, ASYM_class_core_vector, CIRC_class_core_vector, MISC_class_core_vector, SPIC_class_core_vector, ARCH_class_core_vector, NORM_class_core_vector);

set(handles.classif,'string',ret)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

function classif_CreateFcn(hObject, eventdata, handles)
% hObject    handle to classif (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
