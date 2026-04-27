clc; // Clear the console
clear; // Clear all variables
// Define the coefficient matrix A
A = [3, 2, 1;
     2, 3, 2;
     1, 2, 3];
// Define the constant vector b
b = [10; 14; 14];
// Get the size of the matrix
n = size(A, 'r');
// Create the augmented matrix
Aug = [A, b];
// Forward elimination to create the upper triangular matrix
for k = 1:n-1
    for i = k+1:n
        // Calculate the ratio to eliminate the entry below the pivot
        factor = Aug(i, k) / Aug(k, k);
        
        // Subtract a multiple of the pivot row from the current row
        Aug(i, :) = Aug(i, :) - factor * Aug(k, :);
    end
end
// Initialize the solution vector
x = zeros(n, 1);
// Solve for the last variable
x(n) = Aug(n, n+1) / Aug(n, n);
// Perform back substitution for the remaining variables
for i = n-1:-1:1
    sum_vals = 0;
    for j = i+1:n
        sum_vals = sum_vals + Aug(i, j) * x(j);
    end
    x(i) = (Aug(i, n+1) - sum_vals) / Aug(i, i);
end
// Display the final solution
disp("The solution vector x is:");
disp(x);
