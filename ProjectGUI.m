function varargout = ProjectGUI(varargin)
% PROJECTGUI MATLAB code for ProjectGUI.fig
%      PROJECTGUI, by itself, creates a new PROJECTGUI or raises the existing
%      singleton*.
%
%      H = PROJECTGUI returns the handle to a new PROJECTGUI or the handle to
%      the existing singleton*.
%
%      PROJECTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTGUI.M with the given input arguments.
%
%      PROJECTGUI('Property','Value',...) creates a new PROJECTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjectGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjectGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjectGUI

% Last Modified by GUIDE v2.5 16-Nov-2016 18:42:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjectGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjectGUI_OutputFcn, ...
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


% --- Executes just before ProjectGUI is made visible.
function ProjectGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjectGUI (see VARARGIN)
% Create the data to plot.

% Choose default command line output for ProjectGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjectGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProjectGUI_OutputFcn(hObject, eventdata, handles) 
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
% Display surf plot of the currently selected data.
k=0;
z=input('From which area is the data required? ','s');
N=40;
A1 = 30;
for ii = 1:N
    % Temp x
    xtemp = A1*rand(1,1);
    % Temp y
    ytemp = A1*rand(1,1);
    
    % Save values at respective position
    x(ii) = xtemp;
    y(ii) = ytemp;
    
    
end
nw=strcmp(z,'northwest');
ne=strcmp(z,'northeast');
sw=strcmp(z,'southwest');
se=strcmp(z,'southeast');
nor=strcmp(z,'north');
s=strcmp(z,'south');
e=strcmp(z,'east');
w=strcmp(z,'west');
all=strcmp(z,'all');

  
while 1
    n=0;
   if nw==1
       
          
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:N
      if x(ii)<15 && y(ii)>15
    text(x(ii)+0.5,y(ii),num2str(rand()*100));
      end
end
    drawnow
    pause(0.05);
    
    
       
end


if ne==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:N
      if x(ii)>15 && y(ii)>15
    text(x(ii)+0.5,y(ii),num2str(rand()*100));
      end
end
    drawnow
    pause(0.05);
    
end

if sw==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:N
      if x(ii)<15 && y(ii)<15
    text(x(ii)+0.5,y(ii),num2str(rand()*100));
      end
end
    drawnow
    pause(0.05);
    while n<1000000000
        n=n+1;
end
    
end

if se==1
     n=0;
    
    plot(x,y,'.');
    
    for ii=1:N
      if x(ii)>15 && y(ii)<15
    text(x(ii)+0.5,y(ii),num2str(rand()*100));
      end
end
    drawnow
    pause(0.05);
    
end

if nor==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:N
      if  y(ii)>15
    text(x(ii)+0.5,y(ii),num2str(rand()*100));
      end
end
    drawnow
    pause(0.05);
end

if s==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:N
      if  y(ii)<15
    text(x(ii)+0.5,y(ii),num2str(rand()*100));
      end
end
    drawnow
    pause(0.05);
end

if e==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:N
      if  x(ii)>15
    text(x(ii)+0.5,y(ii),num2str(rand()*100));
      end
end
    drawnow
    pause(0.05);
end

if w==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:N
      if  x(ii)<15
    text(x(ii)+0.5,y(ii),num2str(rand()*100));
      end
end
    drawnow
    pause(0.05);
end
if all==1
   n=0;
    
    plot(x,y,'.');
    
    for ii=1:N
     
    text(x(ii)+0.5,y(ii),num2str(rand()*100));
      end
end
    drawnow
    pause(0.05);
    
    

while n<1000000000
        n=n+1;
end
   clc;
   
end
    



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 % Display mesh plot of the currently selected data.
k=0;
z=input('From which area is the data required? ','s');
N=40;
A1 = 30;
y1=linspace(2,30,15); 
N =15 ; 
B1 = reshape(repmat(y1(:).',N,1),1,[]);
y1=B1;
x1=linspace(2,30,15);
x1=[x1 x1 x1 x1 x1 x1 x1 x1 x1 x1 x1 x1 x1 x1 x1];


nw=strcmp(z,'northwest');
ne=strcmp(z,'northeast');
sw=strcmp(z,'southwest');
se=strcmp(z,'southeast');
nor=strcmp(z,'north');
s=strcmp(z,'south');
e=strcmp(z,'east');
w=strcmp(z,'west');
all=strcmp(z,'all');

  
while 1
    n=0;
   if nw==1
       
          
    n=0;
    
    plot(x1,y1,'.');
    
    for ii=1:225
      if x1(ii)<15 && y1(ii)>15
    text(x1(ii)+0.5,y1(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    
    
       
end


if ne==1
    n=0;
    
    plot(x1,y1,'.');
    
    for ii=1:225
      if x1(ii)>15 && y1(ii)>15
    text(x1(ii)+0.5,y1(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    
end

if sw==1
    n=0;
    
    plot(x1,y1,'.');
    
    for ii=1:225
      if x1(ii)<15 && y1(ii)<15
    text(x1(ii)+0.5,y1(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    while n<1000000000
        n=n+1;
end
    
end

if se==1
     n=0;
    
    plot(x1,y1,'.');
    
    for ii=1:225
      if x1(ii)>15 && y1(ii)<15
    text(x1(ii)+0.5,y1(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    
end

if nor==1
    n=0;
    
    plot(x1,y1,'.');
    
    for ii=1:225
      if  y1(ii)>15
    text(x1(ii)+0.5,y1(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
end

if s==1
    n=0;
    
    plot(x1,y1,'.');
    
    for ii=1:225
      if  y1(ii)<15
    text(x1(ii)+0.5,y1(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
end

if e==1
    n=0;
    
    plot(x1,y1,'.');
    
    for ii=1:225
      if  x1(ii)>15
    text(x1(ii)+0.5,y1(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
end

if w==1
    n=0;
    
    plot(x1,y1,'.');
    
    for ii=1:225
      if  x1(ii)<15
    text(x1(ii)+0.5,y1(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
end
if all==1
   n=0;
    
    plot(x1,y1,'.');
    
    for ii=1:225
     
    text(x1(ii)+0.5,y1(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    
    

while n<1000000000
        n=n+1;
end
   clc;
   
end
    



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 % Display contour plot of the currently selected data.
z=input('From which area is the data required? ','s');
N=40;
A1 = 30;
x=[2,6,10,14,18,22,26,30,4,8,12,16,20,24,28];
x=[x x x x x x x];
y=[2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,8,8,8,8,8,8,8,8,10,10,10,10,10,10,10,12,12,12,12,12,12,12,12,14,14,14,14,14,14,14,16,16,16,16,16,16,16,16,18,18,18,18,18,18,18,20,20,20,20,20,20,20,20,22,22,22,22,22,22,24,24,24,24,24,24,24,24,26,26,26,26,26,26,26,28,28,28,28,28,28,28,28,30,30,30,30,30,30,30,30];
plot(x,y,'.');

nw=strcmp(z,'northwest');
ne=strcmp(z,'northeast');
sw=strcmp(z,'southwest');
se=strcmp(z,'southeast');
nor=strcmp(z,'north');
s=strcmp(z,'south');
e=strcmp(z,'east');
w=strcmp(z,'west');
all=strcmp(z,'all');

  
while 1
    n=0;
   if nw==1
       
          
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:105
      if x(ii)<15 && y(ii)>15
    text(x(ii)+0.5,y(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    
    
       
end


if ne==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:105
      if x(ii)>15 && y(ii)>15
    text(x(ii)+0.5,y(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    
end

if sw==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:105
      if x(ii)<15 && y(ii)<15
    text(x(ii)+0.5,y(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    while n<1000000000
        n=n+1;
end
    
end

if se==1
     n=0;
    
    plot(x,y,'.');
    
    for ii=1:105
      if x(ii)>15 && y(ii)<15
    text(x(ii)+0.5,y(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    
end

if nor==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:105
      if  y(ii)>15
    text(x(ii)+0.5,y(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
end

if s==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:105
      if  y(ii)<15
    text(x(ii)+0.5,y(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
end

if e==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:105
      if  x(ii)>15
    text(x(ii)+0.5,y(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
end

if w==1
    n=0;
    
    plot(x,y,'.');
    
    for ii=1:105
      if  x(ii)<15
    text(x(ii)+0.5,y(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
end
if all==1
   n=0;
    
    plot(x,y,'.');
    
    for ii=1:105
     
    text(x(ii)+0.5,y(ii),num2str(round(rand()*100)));
      end
end
    drawnow
    pause(0.05);
    
    

while n<1000000000
        n=n+1;
end
   clc;
   
end




% --- Executes on selection change in popupmenu1.

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
