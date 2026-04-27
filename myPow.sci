clf
subplot(2,2,1)         // sin() is a builtin
plot(1:0.1:10, sin)    // <=> plot(1:0.1:10, sin(1:0.1:10))
title("plot(x, sin)", "fontsize",3)

// with a macro:
deff('y = myFun(x)','y = x + rand(x)')
subplot(2,2,2)
plot(-3:0.1:5, myFun)
title("plot(x, myFun)", "fontsize",3)

// With functions with parameters:
subplot(2,2,3)
plot(1:0.05:7, list(delip, -0.4))  // <=> plot(1:0.05:7, delip(1:0.05:7,-0.4) )
title("plot(x, list(delip,-0.4))", "fontsize",3)

function Y=myPow(x, p)
    [X,P] = ndgrid(x,p);
    Y = X.^P;
    m = max(abs(Y),"r");
    for i = 1:size(Y,2)
        Y(:,i) = Y(:,i)/m(i);
    end
endfunction
x = -5:0.1:6;
subplot(2,2,4)
plot(x, list(myPow,1:5))
title("plot(x, list(myPow,1:5))", "fontsize",3)

