clf
clc
clear
// Define the system
function dydt = f(t, y)
    dydt = zeros(2,1);
    dydt(1) = y(2);                 // dy1/dt = y2
    dydt(2) = -exp(-t)*y(2) - y(1); // dy2/dt = -e^{-t}y2 - y1
endfunction

// Initial conditions
y0 = [1; 0];   // y(0)=1, y'(0)=0 (change if needed)
t0 = 0;
t = 0:0.1:80;

// Solve the system
y = ode(y0, t0, t, f);
scf
// Plot y(t)
plot(t, y(1,:))
xlabel("t")
ylabel("y(t)")
title("Solution of d^2y/dt^2 + e^{-t} dy/dt = -y")


scf(1)
function dYdT= f2(T,Y)
    dYdT=zeros(2,1)
    dYdT(1)=Y(2)
    dYdT(2)=-2*Y(2)-Y(1)
endfunction
Y0=[1;0]
T0=0;
T=linspace(0,10,100)
Y2=ode(Y0,T0,T,f2)
plot(T,Y2(1,:))
xlabel("t")
ylabel("y(t)")
title("Solution of dy^2/dt^2 + 2 dy/dt = -y")
