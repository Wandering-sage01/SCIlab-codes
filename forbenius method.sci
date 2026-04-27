// 1. Define the range for x from -1 to 1
clc
clf
clear
scf
x = -1:0.01:1;

// 2. Compute each order (n=0 to n=3)
// The (1,:) grabs the first row which is the standard polynomial
P0 = legendre(0, 0, x);
P1 = legendre(1, 0, x);
P2 = legendre(2, 0, x);
P3 = legendre(3, 0, x);

// 3. Plot all four lines at once
plot(x, [P0(1,:); P1(1,:); P2(1,:); P3(1,:)]);

// 4. Add labels and a grid
legend(["n=0"; "n=1"; "n=2"; "n=3"]);
xgrid();
