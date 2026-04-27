clc
clf
clear
function R= resist(V,I)
    R=V/I
endfunction
V=linspace(1,100,200);
I=linspace(0.5,20,200);
plot(V,I,"k")
title("graph of resistance")
xlabel("Voltage V")
ylabel("Current I")
x=[1,3,5,8,10,25,34,62,67,78,94];
y=[2,4,5,7,9,10,11,13,15,17,18];
plot(x,y,"bo+")
