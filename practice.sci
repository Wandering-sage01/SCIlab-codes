clc
clf
clear
clc;
clear;

A = [3, 2, 1;
     2, 3, 2;
     1, 2, 3];
b = [10; 14; 14];

// Solve the system using the linsolve function
// The 'lu' argument specifies using LU decomposition method, which is standard
x =- linsolve(A,b);

// Display the solution
disp("The solution vector x is:");
disp(x);
