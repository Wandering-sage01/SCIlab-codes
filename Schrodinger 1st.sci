clc;
clear;

e = 3.795;
e2 = e*e;

hbarc = 1973;
m = 0.511e6;

K = (hbarc*hbarc)/(2*m);

disp("e2 = " + string(e2) + " eV-Angstrom");
disp("hbarc = " + string(hbarc) + " eV-Angstrom");
disp("hbar^2/(2m) = " + string(K) + " eV-Angstrom^2");

rmax = 40;
N = 300;

dr = rmax/(N+1);

r = (1:N)'*dr;

V = -e2 ./ r;

H = zeros(N,N);

for i = 1:N

    H(i,i) = 2*K/(dr*dr) + V(i);

    if i > 1 then
        H(i,i-1) = -K/(dr*dr);
    end

    if i < N then
        H(i,i+1) = -K/(dr*dr);
    end

end

[U,D] = spec(H);

energy = real(diag(D));

[energy,index] = gsort(energy,"g","i");

U = U(:,index);

E1 = energy(1);
E2 = energy(2);

u1 = real(U(:,1));
u2 = real(U(:,2));

norm1 = sqrt(sum(u1.*u1)*dr);
u1 = u1/norm1;

norm2 = sqrt(sum(u2.*u2)*dr);
u2 = u2/norm2;

if u1(1) < 0 then
    u1 = -u1;
end

if u2(1) < 0 then
    u2 = -u2;
end

disp(" ");
disp("GROUND STATE ENERGY = " + string(E1) + " eV");
disp("FIRST EXCITED ENERGY = " + string(E2) + " eV");

disp(" ");
disp("EXACT GROUND STATE = -13.6 eV");
disp("EXACT FIRST EXCITED STATE = -3.4 eV");

scf(1);
clf();
plot2d(r,u1);
xtitle("Hydrogen Ground State 1s","r (Angstrom)","u(r)");
xgrid();

scf(2);
clf();
plot2d(r,u2);
xtitle("Hydrogen First Excited State 2s","r (Angstrom)","u(r)");
xgrid();

scf(3);
clf();
plot2d(r,[u1 u2]);
xtitle("Hydrogen 1s and 2s Wave Functions","r (Angstrom)","u(r)");
xgrid();
