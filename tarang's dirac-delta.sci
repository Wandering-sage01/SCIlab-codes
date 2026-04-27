// Q2: Dirac Delta function — Gaussian approximation
x = -5:0.001:10;
sigma = [1, 0.1, 0.01];
colors = ['b', 'r', 'g'];

clf(); 
for i = 1:3
    s = sigma(i);
    delta_approx = (1/(sqrt(2*%pi*s^2)) * exp(-(x-2).^2/(2*s^2)));
    integrand = delta_approx .* (x + 3);
    result = inttrap(x, integrand);
    disp('sigma='+string(s)+' => integral = '+string(result));
    plot(x, delta_approx, colors(i));
end
legend('σ=1', 'σ=0.1', 'σ=0.01');
xlabel('x'); ylabel('δ(x-2)');
title('Dirac Delta approximation');
xgrid();
