clc
clear
clf
x = linspace(-1, 1, 100);
P0 = ones(x);
P1 = x;
P2 = (3 * x.^2 - 1) / 2;
P3 = (5 * x.^3 - 3 * x) / 2;

plot(x, P0,"r")
plot(x, P1,"b")
plot(x, P2,"g")
plot(x, P3,"k")
