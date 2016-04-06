function varargout = population_new(varargin)
% POPULATION_NEW MATLAB code for population_new.fig
%      POPULATION_NEW, by itself, creates a new POPULATION_NEW or raises the existing
%      singleton*.
%
%      H = POPULATION_NEW returns the handle to a new POPULATION_NEW or the handle to
%      the existing singleton*.
%
%      POPULATION_NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POPULATION_NEW.M with the given input arguments.
%
%      POPULATION_NEW('Property','Value',...) creates a new POPULATION_NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before population_new_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to population_new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help population_new

% Last Modified by GUIDE v2.5 31-Mar-2016 22:48:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @population_new_OpeningFcn, ...
                   'gui_OutputFcn',  @population_new_OutputFcn, ...
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


% --- Executes just before population_new is made visible.
function population_new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to population_new (see VARARGIN)

% Choose default command line output for population_new
handles.output = hObject;
global AA Aa aa Generation pop  popold strike pref
AA = 10; Aa = 30; aa = 10;
pop = zeros(1,50);
pop(1:AA) = 2;
if Aa ~=0
        pop(AA+1:AA+Aa) =1;
end
Generation = 0;
strike = 25;
pref = 0.5;

myplot(Generation, AA, 'S',3); hold on
myplot(Generation+0.1, Aa, 'S',4); hold on
myplot(Generation+0.2, aa, 'S',5); hold on
axis([0 15 0 50])
legend('AA', 'Aa', 'aa')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes population_new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = population_new_OutputFcn(hObject, eventdata, handles) 
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
global AA Aa aa Generation pop  popold strike pref
        popold = pop;
Generation = Generation + 1;
%pop = zeros(1,50);
%pop(1:AA) = 2;
%if Aa ~=0
%        pop(AA+1:AA+Aa) =1;
%end
% get data
pref =  str2double(get(handles.edit2,'String')) ;
strike =  str2double(get(handles.edit1,'String')) ;
        preference = [pref, pref, 1-pref];
surviver = sort(kill_population(pop,  strike , preference),'descend'); 
pop = repmat(surviver, 1, length(pop)/length(surviver));
        AA = sum(pop==2);
        Aa = sum(pop==1);
        aa  = sum(pop==0);
myplot(Generation, AA, 'S', 3); hold on
myplot(Generation + 0.1, Aa, 'S', 4); hold on
myplot(Generation + 0.2, aa, 'S', 5); hold on
myplot([Generation-1, Generation], [sum(popold)/2, sum(pop)/2], 'L', 1);
text(Generation, sum(pop)/2 + 5, [num2str(sum(pop)) ' %'], 'fontsize',12)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global AA Aa aa Generation pop  popold strike pref
AA = 10; Aa = 30; aa = 10;
pop = zeros(1,50);
pop(1:AA) = 2;
if Aa ~=0
        pop(AA+1:AA+Aa) =1;
end
Generation = 0;
strike = 25;
pref = 0.5;
axes(handles.axes1)
cla
myplot(Generation, AA, 'S',3); hold on
myplot(Generation+0.1, Aa, 'S',4); hold on
myplot(Generation+0.2, aa, 'S',5); hold on
axis([0 20 0 50])
legend('AA', 'Aa', 'aa')


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
strike =  str2double(get(handles.edit1,'String')) ;

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
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
pref =  str2double(get(handles.edit2,'String')) ;

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
