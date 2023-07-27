% =================================================
%       Foad Moslem (foad.moslem@gmail.com) - Researcher | Aerodynamics
%       Using MATLAB R2022a
% =================================================
clc
clear
close all

% =================================================
tic
global numFunc
numFunc = 0;

% Curve Ploting ======================================
a = 0;
b = 4;
NumOfNodes = 200;
x = linspace(a,b,NumOfNodes);
y = ObjFun(x);
plot(x,y)
hold on

% Main Code - Interval Halving ==========================
a1 = a;
b1 = b;
epsilon = 1e-3;

l = abs(a1-b1);
xm = (a1+b1)/2;
x1 = a1 + l/4;
x2 =b1 - l/4;
fxm = ObjFun (xm);
fx1 = ObjFun (x1);
fx2 = ObjFun (x2);

while l > epsilon
    l = abs(a1-b1);
    x1 = a1 + l/4;
    x2 =b1 - l/4;
    fx1 = ObjFun (x1);
    fx2 = ObjFun (x2);
    
    if fx2 > fxm && fxm > fx1
        b1 = xm;
        xm = x1;
        fxm = fx1;
    elseif fx1 > fxm && fxm > fx2
        a1 = xm;
        xm = x2;
        fxm = fx2;
    elseif fx1 > fxm && fx2 > fxm
        a1 = x1;
        b1 = x2;
    end
end
%}
% =================================================
fprintf('Number of CallFunction: %6.f\n',numFunc)
fprintf('CPU time: %6.4f\n',toc)
fprintf('X Value of Optimum Point: %6.4f\n',xm)
fprintf('Y Value of Optimum Point: %6.4f\n',fxm)
plot(xm,fxm,'kx')

