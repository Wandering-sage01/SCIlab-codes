
// =====================================================
// PRACTICAL 2
// S-WAVE RADIAL SCHRODINGER EQUATION
// SCREENED COULOMB POTENTIAL
// =====================================================

clc;
clear;
close;

// -------- Constants --------
hbarc = 1973;          // hbar*c in eV Angstrom
mcsq  = 0.511e6;       // m*c^2 in eV
e     = 3.795;         // (eV Angstrom)^(1/2)

// -------- Numerical parameters --------
rmin = 0.001;          // Angstrom
rmax = 20;             // Angstrom
N    = 800;

dr = (rmax-rmin)/N;

// Kinetic-energy coefficient
K = (hbarc^2)/(2*mcsq*dr^2);

// Values of screening length
avec = [3 5 7];

// =====================================================
// Calculate for a = 3, 5 and 7 Angstrom
// =====================================================

for aa = 1:length(avec)

    a = avec(aa);

    // Radial grid
    r = zeros(N-1,1);

    for i = 1:N-1
        r(i) = rmin + i*dr;
    end

    // -------- Kinetic energy matrix --------
    T = zeros(N-1,N-1);

    for i = 1:N-1
        T(i,i) = 2*K;

        if i < N-1 then
            T(i,i+1) = -K;
            T(i+1,i) = -K;
        end
    end

    // -------- Screened Coulomb potential --------
    V = zeros(N-1,1);

    for i = 1:N-1
        V(i) = -(e^2/r(i))*exp(-r(i)/a);
    end

    Vmat = diag(V);

    // -------- Hamiltonian --------
    H = T + Vmat;

    // -------- Eigenvalues and eigenvectors --------
    [U,D] = spec(H);

    energy = diag(D);

    // Ground-state energy
    [E0,index] = min(energy);

    // Ground-state radial wavefunction u(r)
    u = U(:,index);

    // Normalize
    u = u / sqrt(sum(u.^2)*dr);

    // Radial wavefunction R(r) = u(r)/r
    R = u ./ r;

    // Fix arbitrary sign for plotting
    if R(1) < 0 then
        R = -R;
        u = -u;
    end

    // -------- Display result --------
    mprintf("\n====================================\n");
    mprintf("Screening length a = %g Angstrom\n",a);
    mprintf("Ground state energy = %.6f eV\n",E0);
    mprintf("Ground state energy (3 s.f.) = %.3f eV\n",E0);
    mprintf("====================================\n");

    // -------- Plot potential --------
    scf(aa);
    subplot(2,1,1);
    plot(r,V);
    xlabel("r (Angstrom)");
    ylabel("V(r) (eV)");
    title("Screened Coulomb Potential, a = "+string(a)+" Angstrom");

    // -------- Plot wavefunction --------
    subplot(2,1,2);
    plot(r,R);
    xlabel("r (Angstrom)");
    ylabel("R(r)");
    title("Ground State Wavefunction, a = "+string(a)+" Angstrom");

end
