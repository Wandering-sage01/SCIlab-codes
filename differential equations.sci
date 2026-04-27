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
t = 0:0.1:10;

// Solve the system
y = ode(y0, t0, t, f);

// Plot y(t)
plot(t, y(1,:))
xlabel("t")
ylabel("y(t)")
title("Solution of d^2y/dt^2 + e^{-t} dy/dt = -y")
