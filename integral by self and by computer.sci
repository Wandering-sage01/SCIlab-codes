clc;
clear;
clc;
// Function definition
deff('y=f(x)', 'y = 1/(x^2 + 2)');
// Limits
a = 0;
b = 2;
// Number of intervals
n = 10;
h = (b - a)/n;
// Trapezoidal Rule
sum = f(a) + f(b);
for i = 1:n-1
    x = a + i*h;
    sum = sum + 2*f(x);
end
I_trap = (h/2)*sum;
disp("Trapezoidal Integration Value:");
disp(I_trap);
// Built-in numerical integration
I_exact = intg(a, b, f);
disp("Built-in Integration Value:");
disp(I_exact);
