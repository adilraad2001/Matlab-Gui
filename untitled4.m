function varargout = untitled4(varargin)
% UNTITLED4 MATLAB code for untitled4.fig
%      UNTITLED4, by itself, creates a new UNTITLED4 or raises the existing
%      singleton*.
%
%      H = UNTITLED4 returns the handle to a new UNTITLED4 or the handle to
%      the existing singleton*.
%
%      UNTITLED4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED4.M with the given input arguments.
%
%      UNTITLED4('Property','Value',...) creates a new UNTITLED4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled4

% Last Modified by GUIDE v2.5 15-Jun-2021 20:06:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled4_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled4_OutputFcn, ...
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


% --- Executes just before untitled4 is made visible.
function untitled4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled4 (see VARARGIN)

% Choose default command line output for untitled4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.g , 'Cdata' , []);


% UIWAIT makes untitled4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled4_OutputFcn(hObject, eventdata, handles) 
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
prompt = {'Enter la matrix A:','Enter la matrix b:'};
dlgtitle = 'Input';
dims = [1 35];
definput = {'',''};
matrix= inputdlg(prompt,dlgtitle,dims,definput);
A=str2num(matrix{1});
b=str2num(matrix{2});



function myGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for untitled
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% set the table size to be 2x2
set(handles.uitable1,'Data',cell(2,2));







%Gausse
function g_Callback(hObject, eventdata, handles)
global A b 
prompt = {'Enter la matrix A:','Enter la matrix b:'};
dlgtitle = 'Input';
dims = [1 35];
definput = {'',''};
matrix= inputdlg(prompt,dlgtitle,dims,definput);
A=str2num(matrix{1});
b=str2num(matrix{2});


%set(handles.j,'string',
x=GaussianElimination(A,b);
n =length(x);
for xc = 1:n
          third=get(handles.j, 'String');
          first=['X',num2str(xc),' = ',num2str(x(xc))];
          second=[third; {first}];
          set(handles.j, 'String', second);
 end
 

    
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%jacobi
% --- Executes on button press in ja.
function ja_Callback(hObject, eventdata, handles)
global A b 
prompt = {'Enter la matrix A:','Enter la matrix b:'};
dlgtitle = 'Input';
dims = [1 35];
definput = {'',''};
matrix= inputdlg(prompt,dlgtitle,dims,definput);
A=str2num(matrix{1});
b=str2num(matrix{2});

x=MyJacobiFun(A,b);
n =length(x);
for xc = 1:n
          third=get(handles.j, 'String');
          first=['X',num2str(xc),' = ',num2str(x(xc))];
          second=[third; {first}];
          set(handles.j, 'String', second);
 end






% --- Executes during object creation, after setting all properties.


%LU factorization
% --- Executes on button press in lu.
function lu_Callback(hObject, eventdata, handles)
% hObject    handle to lu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A b
prompt = {'Enter la matrix A:','Enter la matrix b:'};
dlgtitle = 'Input';
dims = [1 35];
definput = {'',''};
matrix= inputdlg(prompt,dlgtitle,dims,definput);
A=str2num(matrix{1});
b=str2num(matrix{2});
[L,U]=lu(A);
d=L\b;
x=U\d;
n =length(x);
for xc = 1:n
          third=get(handles.j, 'String');
          first=['X',num2str(xc),' = ',num2str(x(xc))];
          second=[third; {first}];
          set(handles.j, 'String', second);
 end

set(handles.j,'string',x);

function gs_Callback(hObject, eventdata, handles)
global A b t
prompt = {'Enter la matrix A:','Enter la matrix b:'};
dlgtitle = 'Input';
dims = [1 35];
definput = {'',''};
matrix= inputdlg(prompt,dlgtitle,dims,definput);
A=str2num(matrix{1});
b=str2num(matrix{2});
x=MyGaussSeidelFun(A,b);
n =length(x);
for xc = 1:n
          third=get(handles.j, 'String');
          first=['X',num2str(xc),' = ',num2str(x(xc))];
          second=[third; {first}];
          set(handles.j, 'String', second);
 end


% hObject    handle to gs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






% --- Executes on button press in in.
function in_Callback(hObject, eventdata, handles)
global A b
[n,m]=size(A);
if(n==0)
    prompt = {'Enter la matrix A:','Enter la matrix b:'};
    dlgtitle = 'Input';
    dims = [1 35];
    definput = {'',''};
    matrix= inputdlg(prompt,dlgtitle,dims,definput);
    A=str2num(matrix{1});
    b=str2num(matrix{2});
end
c=inv(A);
set(handles.az,'string',num2str(c))
function cr_Callback(hObject, eventdata, handles)
% hObject    handle to cr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 prompt = {'Enter la matrix A:','Enter la matrix b:'};
    dlgtitle = 'Input';
    dims = [1 35];
    definput = {'',''};
    matrix= inputdlg(prompt,dlgtitle,dims,definput);
    A=str2num(matrix{1});
    b=str2num(matrix{2});
n=length(b);
res=zeros(n,1);
D=det(A);
for i=1:n
    Aug=A;
    Aug(:,i)=b;
    res(i)=(det(Aug)/D);
end
x=res;
x=x(:);
n =length(x);
for xc = 1:n
          third=get(handles.j, 'String');
          first=['X',num2str(xc),' = ',num2str(x(xc))];
          second=[third; {first}];
          set(handles.j, 'String', second);
 end

    


% hObject    handle to in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Les methodes
%Gauss
function x=GaussianElimination(A,b);
    % x=GaussianElimination(A,b)
    % GaussianElimination solves system of linear equations Ax = b using
    % Gaussian Elimination method.
    % A = n x n square matrix with the coefficients of the system of equations
    % as the elements of matrix A
    % b = column matrix with length = n
    %%%%Check if A is square and not singular
    [n,n1] = size(A);
    if ~isequal(n,length(b))|| ~isequal(n,n1)
        h = msgbox('Error: Matrix must be square')
        x=[];
        return
    elseif abs(det(A))<=10e-16
        h = msgbox('Error: Matrix is Singular')
        x=[];
        return
    end
    x=A\b;
    
   
    %Gause_seidel
function  x= MyGaussSeidelFun(A,B)

D = det(A);
if D == 0
    h = msgbox('Pas de Solution,déterminat égale à zero!')
    return
end

[M, N] = size(A);
if M ~= N
    h = msgbox('Il faut inroduire une martrice carrée')
    return
end

for i = 1 : N
    SommeI = sum(abs(A(i , 1 : i-1))) + sum(abs(A(i , i+1:N )));
    if abs(A(i , i)) < SommeI
        h = msgbox ('la matrice n''est pas diagonale dominante !')
    end
end

x0=[0;0;0];
d=diag(diag(A));
M=tril(A,-1);
N=triu(A,1);
x1=1;
xi=x0;
while abs(x1-xi)>10^-6
    x1=-inv(d+M)*N*x0+inv(d+M)*B;
    xi=x0;
    x0=x1;
end
x=x1;

function x= MyJacobiFun(A,B)

[M, N] = size(A);
if M ~= N
    h = msgbox('Il faut introduire une martrice carrée!');
    return
end

D = det(A);
if D == 0
    h = msgbox('Pas de Solution, déterminant égale à zéro!')
    return
end

for i = 1 : N
    SommeI = sum(abs(A(i , 1 : i - 1))) + sum(abs(A(i , i + 1 : N )));
    SommeJ = sum(abs(A(1 : i - 1 , i))) + sum(abs(A(i + 1 : N  , i)));
    if abs(A(i , i)) < SommeI && abs(A(i , i)) < SommeJ
        h = msgbox('la matrice n''est pas à diagonale dominante !')
    end
end


x0=[0;0;0];
d=diag(diag(A));
M=tril(A,-1);
N=triu(A,1);
x1=1;
xi=x0;
while abs(x1-xi)>10^(-6)
    x1=-inv(d)*(M+N)*x0+inv(d)*B;
    xi=x0;
    x0=x1;
end
x=x1;



% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in rg.
function rg_Callback(hObject, eventdata, handles)
global A b 

[n,m]=size(A);
if(n==0)
    prompt = {'Enter la matrix A:','Enter la matrix b:'};
    dlgtitle = 'Input';
    dims = [1 35];
    definput = {'',''};
    matrix= inputdlg(prompt,dlgtitle,dims,definput);
    A=str2num(matrix{1});
    b=str2num(matrix{2});
end

set(handles.j,'string',num2str(A\b))

% if n==2
% y=(-5:0.1:5);
% z=(A(1,1)/b(1,1))-((A(1,2)*y)/b(1,1));
% w=(A(2,1)/b(2,1))-((A(2,2)*y)/b(2,1));
axes(handles.p);
plot(b,A,'DisplayName','A')
% plot(y,z,'r',y,w,'k');
 grid on;
 xlabel('X');
 ylabel('Y');
% end
% hObject    handle to rg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in clc.
function clc_Callback(hObject, eventdata, handles)
    
    set(handles.j,'string',"");
     set(handles.az,'string',"");
clear all
clc 
cla 
grid off
% hObject    handle to clc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in out.
function out_Callback(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes when uipanel3 is resized.
function uipanel3_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in tr.
function tr_Callback(hObject, eventdata, handles)
global A b
% hObject    handle to tr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,m]=size(A);
if(n==0)
    prompt = {'Enter la matrix A:','Enter la matrix b:'};
    dlgtitle = 'Input';
    dims = [1 35];
    definput = {'',''};
    matrix= inputdlg(prompt,dlgtitle,dims,definput);
    A=str2num(matrix{1});
    b=str2num(matrix{2});
end
c=A';
set(handles.az,'string',num2str(c))


% --- Executes on button press in de.
function de_Callback(hObject, eventdata, handles)
global A b
% hObject    handle to de (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,m]=size(A);
if(n==0)
    prompt = {'Enter la matrix A:','Enter la matrix b:'};
    dlgtitle = 'Input';
    dims = [1 35];
    definput = {'',''};
    matrix= inputdlg(prompt,dlgtitle,dims,definput);
    A=str2num(matrix{1});
    b=str2num(matrix{2});
end
c=det(A);
set(handles.az,'string',num2str(c))


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over in.
function in_ButtonDownFcn(hObject, eventdata, handles)
global A b
% hObject    handle to in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[n,m]=size(A);
if(n==0)
    prompt = {'Enter la matrix A:','Enter la matrix b:'};
    dlgtitle = 'Input';
    dims = [1 35];
    definput = {'',''};
    matrix= inputdlg(prompt,dlgtitle,dims,definput);
    A=str2num(matrix{1});
    b=str2num(matrix{2});
end
c=inv(A);
set(handles.az,'string',num2str(c))


% --- Executes on button press in cr.



% --- Executes on button press in cr.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to cr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
