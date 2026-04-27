clc;
clear;

x = linspace(-1, 1, 1000);

sigma1 = 0.1;
sigma2 = 0.05;
sigma3 = 0.02;

d1 = (1/(sqrt(2*%pi)*sigma1)) * exp(-(x.^2)/(2*sigma1^2));
d2 = (1/(sqrt(2*%pi)*sigma2)) * exp(-(x.^2)/(2*sigma2^2));
d3 = (1/(sqrt(2*%pi)*sigma3)) * exp(-(x.^2)/(2*sigma3^2));

plot(x, d1, 'r', x, d2, 'k', x, d3, 'b');
legend("σ = 0.1", "σ = 0.05", "σ = 0.02");
title("Gaussian Approximations Approaching Dirac Delta");

