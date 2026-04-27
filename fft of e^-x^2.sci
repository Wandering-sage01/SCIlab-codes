clc
clf
clear
// Number of sample points
N = 1024;
// Define the domain
x_min = -10;
x_max = 10;
x = linspace(x_min, x_max, N);
// Define the function f(x) = exp(-x^2)
f = exp(-x.^2);
// Compute FFT
F = fft(f);
// Shift zero frequency to center
F_shifted = fftshift(F);
// Frequency axis
dx = x(2) - x(1);
dk = 2 * %pi / (N * dx);
k = (-N/2 : N/2 - 1) * dk;
// Plot original function
scf(1);
plot(x, f);
xlabel("x");
ylabel("f(x)");
title("f(x) = exp(-x^2)");
// Plot magnitude of FFT
scf(2);
plot(k, abs(F_shifted));
xlabel("k");
ylabel("|F(k)|");
title("FFT of exp(-x^2)");
