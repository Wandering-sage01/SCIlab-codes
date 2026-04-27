// Define the differential equation function for Newton's Law of Cooling
// The function signature for 'ode' is f(t, y), where t is time and y is the state vector.
function T_prime = newtoncooling(t, T)
    Ts = 20; // Surrounding temperature
    k = 0.1; // Cooling constant
    T_prime = -k * (T - Ts);
endfunction

// Initial conditions and time vector
T0 = 100; // Initial temperature of the object
t_points = 0:1:100; // Vector of time points for the solution with initial time 0 and end time 100

// Use the ode() function to solve the differential equation
T_solution = ode(T0, t0, t_points, newtoncooling);

// Plotting the results
plot(t_points, T_solution);
xlabel("Time (minutes)");
ylabel("Temperature (C)");
title("Newton''s Law of Cooling");
xgrid

