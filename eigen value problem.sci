clc
clear
// Define a matrix
A = [4 1 0;
     1 4 1;
     0 1 4];

// Eigenvalues only
lambda = spec(A);
disp(lambda, "Eigenvalues of A:");

// Eigenvectors + eigenvalues
[V, D] = spec(A);  // V = eigenvectors, D = diagonal matrix of eigenvalues
disp(D, "Diagonal eigenvalue matrix:");
disp(V, "Eigenvectors (columns):");

// Verify A*V ≈ V*D
check = A*V - V*D;
disp(check, "Should be close to zero:");
