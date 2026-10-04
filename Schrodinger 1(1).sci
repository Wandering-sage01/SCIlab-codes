// =========================================================
// Hydrogen Atom s-wave Schrodinger Equation Solver
// =========================================================
clc; clear; close;

// 1. Given Physical Constants
e = 3.795;               // sqrt(eV * Angstrom)
hc = 197.3;              // eV * Angstrom
mc2 = 0.51e6;            // eV
e2 = e^2;                // e^2 = 14.402 eV * Angstrom
k = (hc^2) / (2 * mc2);  // hbar^2 / (2m) in eV * Angstrom^2

// 2. Spatial Grid Setup (Proper Boundary: u(0)=0 and u(rmax)=0)
rmax = 20.0;             // Maximum radial distance in Angstroms
N = 1000;                // Interior grid points
h = rmax / (N + 1);      // Step size
r = linspace(h, rmax - h, N)'; // Grid starts at r = h to avoid 1/r singularity

// 3. Potential Energy V(r) = -e^2 / r
V = -e2 ./ r;

// 4. Kinetic Energy Operator Matrix (Finite Difference Method)
diag_T = (2 * k / (h^2)) * ones(1, N);
off_T = (-k / (h^2)) * ones(1, N-1);

// 5. Total Hamiltonian Matrix H = T + V
H = diag(diag_T) + diag(off_T, 1) + diag(off_T, -1) + diag(V);

// 6. Solve Eigenvalue Problem H * u = E * u
[U, D] = spec(H);
E = diag(D);             // Extract energy eigenvalues

// 7. Sort Eigenvalues in Ascending Order
[E_sorted, idx] = gsort(E, 'g', 'i');
U_sorted = U(:, idx);

// 8. Ground State (n=1) and First Excited State (n=2)
E_ground = E_sorted(1);
E_excited = E_sorted(2);
u_ground = U_sorted(:, 1);
u_excited = U_sorted(:, 2);

// 9. Wavefunction Sign Alignment (Standard Positive Peak Orientation)
if sum(u_ground) < 0 then
    u_ground = -u_ground;
end
if u_excited < 0 then
    u_excited = -u_excited;
end

// 10. Normalization: integral |u(r)|^2 dr = 1
u_ground = u_ground / sqrt(sum(u_ground.^2) * h);
u_excited = u_excited / sqrt(sum(u_excited.^2) * h);

// 11. Print Output in Scilab Console
mprintf("\n=========================================\n");
mprintf("Ground State Energy (E1) = %.2f eV\n", E_ground);
mprintf("First Excited State Energy (E2) = %.2f eV\n", E_excited);
mprintf("=========================================\n");

// 12. Plot Wavefunctions
figure(1);
plot(r, u_ground, 'b-', 'LineWidth', 2);
plot(r, u_excited, 'r--', 'LineWidth', 2);
xgrid(1);
xlabel("r (Angstrom)", "fontsize", 3);
ylabel("u(r)", "fontsize", 3);
title("s-wave Wavefunctions of Hydrogen Atom", "fontsize", 4);
legend(["Ground State (n=1)", "First Excited State (n=2)"]);
      
