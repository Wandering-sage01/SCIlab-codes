// Scilab code for a simple harmonic oscillator
clc
clf
clear
// --- Define the system of differential equations ---
function dy = harmonic_oscillator(t, y)
    // Parameters
    omega = 1.0; // Angular frequency (rad/s)
    
    // System of first-order equations
    dy(1) = y(2);            // dx/dt = v
    dy(2) = -omega^2 * y(1); // dv/dt = -omega^2 * x
endfunction

// --- Set up the simulation parameters ---
// Time range for the simulation
t0 = 0;              // Start time
tf = 20;             // End time
t_steps = 1000;      // Number of time steps
t = linspace(t0, tf, t_steps);

// Initial conditions: [initial displacement, initial velocity]
x0 = 1.0;            // Initial displacement
v0 = 0.0;            // Initial velocity
y0 = [x0; v0];       // Initial state vector

// --- Solve the ODE using the 'ode' function ---
// ode(y0, t0, t, f) solves the system defined by function f
// with initial conditions y0 at time t0, for the time points in vector t.
y = ode(y0, t0, t, harmonic_oscillator);

// --- Extract and plot the results ---
x_solution = y(1,:); // Displacement (first row of y)
v_solution = y(2,:); // Velocity (second row of y)

// Plot the displacement and velocity versus time
scf(0); // Create a new plot window
plot(t, x_solution, 'r-');
plot(t, v_solution, 'b-');
xlabel("Time (s)");
ylabel("Displacement (m) / Velocity (m/s)");
title("Simple Harmonic Oscillator Solution");
legend(['Displacement (x)', 'Velocity (v)']);
xgrid();

// Plot the phase-space trajectory (velocity vs. displacement)
scf(1); // Create another plot window
plot(x_solution, v_solution, 'k-');
xlabel("Displacement (x)");
ylabel("Velocity (v)");
title("Phase-space Trajectory");
xgrid();
