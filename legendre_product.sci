clc
clf
clear
clf(1)
function y=legendre_product(x,n,m)
    Pn=legendre(n,0,x);
    Pm=legendre(m,0,x);
    y=Pn*Pm;
endfunction
n=2
m=2
result=intg(-1,1,legendre_product)
printf("Integral of P%d*P%d is: %f\n",n,m,result)
if n==m then
    theoretical=2/(2*n+1)
else
    theoretical=0
end
