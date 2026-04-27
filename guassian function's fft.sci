clc;
clear;
clf
scf

// Parameters
N = 1024;              // number of points
L = 20;                // domain size
x = linspace(-L/2, L/2, N);
dx = x(2) - x(1);

sigma = 0.5;           // try changing this!

// Gaussian
f = exp(-(x.^2)/(2*sigma^2));

// Fourier transform using FFT
F = fftshift(fft(f));
F = abs(F);            // magnitude

// Frequency axis
dk = 2*%pi/(N*dx);
k = (-N/2:N/2-1)*dk;

// Plot original Gaussian
subplot(2,1,1);
plot(x, f);
xlabel("x");
ylabel("f(x)");
title("Gaussian in Time/Space Domain");

// Plot Fourier transform
subplot(2,1,2);
plot(k, F);
xlabel("k");
ylabel("|F(k)|");
title("Fourier Transform (Frequency Domain)");
