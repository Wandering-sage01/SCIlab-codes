// Q3a: Sum of geometric series Σ(0.2)^n
N = 50;
total = 0;
for n = 1:N
    total = total + 0.2^n;
end
disp('Partial sum (N=50): ' + string(total));
disp('Exact sum = 0.2/(1-0.2) = ' + string(0.2/0.8));

// Q3b: Fourier Series of square wave
x = -2*%pi:0.01:2*%pi;
f = zeros(1, length(x));
for k = 1:20   // 20 terms
    n = 2*k - 1;
    f = f + (4/%pi) * sin(n*x) / n;
end
plot(x, f, 'b-');
xlabel('x'); ylabel('f(x)');
title('Fourier Series — Square Wave (20 terms)');
xgrid();
