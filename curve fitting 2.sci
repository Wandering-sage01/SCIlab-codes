// Least Squares Fitting without weightage to error
// Model: y = a + b*x
clc;
clear;
clf;
scf(0)
// Input data
x = [1 2 3 4 5];
y = [2 4 5 4 5];
n = length(x);
// Calculate required summations
sumx = sum(x);
sumy = sum(y);
sumxy = sum(x .* y);
sumx2 = sum(x .* x);
// Calculate slope (b)
b = (n*sumxy - sumx*sumy) / (n*sumx2 - sumx^2);
// Calculate intercept (a)
a = (sumy - b*sumx) / n;
// Display equation
disp("Fitted Line Equation:");
disp("y = a + b*x");
disp("a (intercept) = " + string(a));
disp("b (slope) = " + string(b));
// Predicted values
y_fit = a + b*x;
// Error calculation
error = y - y_fit;
// Sum of squared error
SSE = sum(error.^2);
// Display confirmation values
disp("Predicted values:");
disp(y_fit);
disp("Errors:");
disp(error);
disp("Sum of Squared Errors (SSE):");
disp(SSE);
// Plot confirmation
scf(0);
plot(x,y,'r-*');
plot(x,y_fit,'b-*');
legend("Original Data","Least Square Fit");
xlabel("x");
ylabel("y");
title("Least Squares Fitting");
