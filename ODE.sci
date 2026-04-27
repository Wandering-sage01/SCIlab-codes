// ODE dy/dt = e^(-x)

clc
clf
clear
scf(0)
function dydx=f(x,y)
    dydx= exp(-x)
endfunction
y0=0
x0=0
scf(0)
x=linspace(0,5,100)
Y=ode(y0,x0,x,f)
plot(x,Y)
xlabel("x")
ylabel("Y")
title("solution of dy/dx = e^-x")

// ODE ds/dt = s^2 - e^(-x)*t

scf(1)
function dqdr=f2(s,t)
    dqdr=s^2-exp(-s)*t
endfunction
s0=0
t0=0
s=0:0.1:5
t=ode(t0,s0,s,f2)
plot(s,t)
xlabel("s")
ylabel("t")
title("solution of [ ds/dt = s^2-e^(-s)*t ]")
