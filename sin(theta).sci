clc
clear
clf
theta= linspace(0,2*%pi,100)
y= sin(theta)
scf(1)
plot(theta,y)
xtitle("sin(theta)","theta","sin(theta)")
xgrid()
 
 x=0:0.5:10
 J= besselj(0,x)
 xi= 4.25
 yi= interp1(x,J,xi)
 disp("interpolated value of bessel function at x =4.25:")
 disp(yi)
 scf(2)
 plot(x,J,'o-')
 plot(xi,yi,'r*')
 xtitle("bessel function J0(x) with interpolation","x","J0(x)")
 xgrid()
