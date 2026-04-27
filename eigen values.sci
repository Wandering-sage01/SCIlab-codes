// --- Step 1: Define the matrix A ---
A = [4, -2, 1;
     1, 1, 0;
     1, 0, 1];

// --- Step 2: Use spec() to find eigenvectors and eigenvalues ---
[R, D] = spec(A);

// --- Step 3: Display the results ---

// Display the eigenvectors
disp("Eigenvectors (stored in columns of matrix R):");
disp(R);

// Display the eigenvalues from the diagonal matrix D
disp("Eigenvalues (from the diagonal of matrix D):");
disp(D);

// Extract and display the eigenvalues as a vector for clarity
eigenvalues_vector = diag(D);
disp("Eigenvalues as a vector:");
disp(eigenvalues_vector);
