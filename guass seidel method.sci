A = [10, -2, -1;
     -2, 10, -2;
     -1, -2, 10];
// Define the constant vector b
b = [44; 51; 61];
// Get the size of the system
n = size(A, 'r');
//..Set initial parameters
// Set an initial guess for the solution vector x
x = zeros(n, 1);
// Define convergence parameters
tol = 1e-6;   // Tolerance for convergence (e.g., 10^-6)
max_iter = 100; // Maximum number of iterations to prevent infinite loops
// Initialize new_x for the iterative calculations
new_x = zeros(n, 1);
//Implement the Gauss-Seidel iterative loop
disp("Starting Gauss-Seidel iterations...");
for iter = 1:max_iter
    // Store the solution from the previous iteration for convergence checking
    x_old = new_x;

    // Loop through each equation to update the variables
    for i = 1:n
        sum_of_terms = 0;
        
        // Loop through all off-diagonal elements
        for j = 1:n
            if i ~= j then
                // Use the most recently updated values for other variables
                sum_of_terms = sum_of_terms + A(i, j) * new_x(j);
            end
        end
        
        // Check for division by zero
        if A(i, i) == 0 then
            error('Division by zero encountered. Pivoting may be needed.');
        end
        
        // Calculate the new value for x_i
        new_x(i) = (b(i) - sum_of_terms) / A(i, i);
    end

    // Check for convergence using the infinity norm (max absolute difference)
    if norm(new_x - x_old, "inf") < tol then
        disp(sprintf("Converged in %d iterations.", iter));
        break;
    end
end
// 4. Display the final result
// Display a warning if the maximum iterations were reached
if iter == max_iter then
    disp("Warning: Maximum number of iterations reached without convergence.");
end
// Display the final solution vector
disp("Solution x:");
disp(new_x);





System Definition: The code defines the coefficient matrix A and the constant vector b. The example used is a diagonally dominant system, which guarantees convergence.
Initial Parameters: An initial guess for the solution, x, is set to a vector of zeros. A tolerance (tol) for the desired accuracy and a maximum number of iterations (max_iter) are defined to prevent infinite loops for systems that do not converge.
Iterative Loop (for iter = 1:max_iter): This is the main part of the algorithm.
x_old = new_x: Before starting a new iteration, the current solution (new_x) is saved to x_old. This is used later to check if the solution has converged by comparing it with the solution of the new iteration.
Nested Loops (for i = 1:n and for j = 1:n): This structure iterates through each equation (i) and calculates the updated value for each variable.
Update Calculation (new_x(i) = ...): Inside the inner loop, the new value for new_x(i) is computed. When computing new_x(i), any previously updated variables in the same iteration (e.g., new_x(1), new_x(2) for new_x(3)) are used immediately.
Convergence Check (if norm(...) < tol): After each iteration, the infinity norm of the difference between the old and new solution vectors is calculated. If this value is less than the specified tolerance, the loop breaks, as convergence has been achieved.
Output: The final solution vector new_x is displayed along with a message indicating whether the method converged successfully or reached the maximum number of iterations. 
AI responses may include mistakes. Learn more



