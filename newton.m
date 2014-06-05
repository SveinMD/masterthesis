function [x, xv, i] = newton(x0,f,df,tol)

x = x0;
i = 0;
imax = 20;
xv = x;
while(abs(f(x)) > tol && i < imax)
    dx = -f(x)/df(x);
    %x = max(min(x + dx,1),0)
    x = x + dx;
    xv = [xv, x];
    %sprintf('(%0.5g,%0.5g)',x,f(x))
    i = i + 1;
end