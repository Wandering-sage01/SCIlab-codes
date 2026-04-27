// --- Step 1: Initialization ---
clc; // Clear the console
clear; // Clear all variables
disp('*** Gaussian Elimination Method in Scilab ***');

// Define the coefficient matrix A and the constant vector B
A = [1, 1, 1; 1, 2, 3; 1, 3, 2];
B = [3; 1; 3];

// Display the initial matrices
disp('The coefficient matrix (A) is:');
disp(A);
disp('The constant vector (B) is:');
disp(B);
// --- Step 2: Forward Elimination ---
// Create the augmented matrix [A|B]
Aug = [A, B];
n = size(A, 'r'); // Get the number of rows (n)

disp(' ');
disp('Forward elimination to get an upper triangular matrix...');

// Loop through each row to eliminate elements below the pivot
for k = 1:n-1
    // Loop through the rows below the pivot row
    for i = k+1:n
        // Calculate the factor to eliminate the element at Aug(i, k)
        if Aug(k,k) == 0 then
            error('Division by zero: A zero pivot was encountered.');
        end
        factor = Aug(i,k) / Aug(k,k);
        
        // Subtract a multiple of the pivot row from the current row
        Aug(i,:) = Aug(i,:) - factor * Aug(k,:);
    end
end

disp(' ');
disp('Matrix after forward elimination (upper triangular form):');
disp(Aug);
// --- Step 3: Back Substitution ---
disp(' ');
disp('Back substitution to find the solution vector (x)...');

// Initialize the solution vector 'x'
x = zeros(n, 1);

// Solve for the last variable first
x(n) = Aug(n, n+1) / Aug(n, n);

// Loop backward from the second-to-last row to the first row
for i = n-1:-1:1
    sum_of_knowns = 0;
    // Calculate the sum of terms with already known variables
    for j = i+1:n
        sum_of_knowns = sum_of_knowns + Aug(i, j) * x(j);
    end
    // Solve for the current variable
    x(i) = (Aug(i, n+1) - sum_of_knowns) / Aug(i, i);
end

// --- Step 4: Display the solution ---
disp(' ');
disp('The solution vector (x) is:');
disp(x);
// --- Step 3: Back Substitution ---
disp(' ');
disp('Back substitution to find the solution vector (x)...');

// Initialize the solution vector 'x'
x = zeros(n, 1);

// Solve for the last variable first
x(n) = Aug(n, n+1) / Aug(n, n);

// Loop backward from the second-to-last row to the first row
for i = n-1:-1:1
    sum_of_knowns = 0;
    // Calculate the sum of terms with already known variables
    for j = i+1:n
        sum_of_knowns = sum_of_knowns + Aug(i, j) * x(j);
    end
    // Solve for the current variable
    x(i) = (Aug(i, n+1) - sum_of_knowns) / Aug(i, i);
end

// --- Step 4: Display the solution ---
disp(' ');
disp('The solution vector (x) is:');
disp(x);
// --- Step 3: Back Substitution ---
disp(' ');
disp('Back substitution to find the solution vector (x)...');

// Initialize the solution vector 'x'
x = zeros(n, 1);

// Solve for the last variable first
x(n) = Aug(n, n+1) / Aug(n, n);

// Loop backward from the second-to-last row to the first row
for i = n-1:-1:1
    sum_of_knowns = 0;
    // Calculate the sum of terms with already known variables
    for j = i+1:n
        sum_of_knowns = sum_of_knowns + Aug(i, j) * x(j);
    end
    // Solve for the current variable
    x(i) = (Aug(i, n+1) - sum_of_knowns) / Aug(i, i);
end

// --- Step 4: Display the solution ---
disp(' ');
disp('The solution vector (x) is:');
disp(x);
