function [x, xv, i] = newtonJTR(x0,xi,f,df,tol)

x = x0;
i = 0;
imax = 20;
xv = x;
while(abs(f(x)) > tol && i < imax)
    dx = -f(x)/df(x);
    if((x-xi)*(x+dx-xi) < 0)
        x = xi;
    else
        x = x + dx;
    end
    x = max(min(x,1),0);
    xv = [xv,x];
    %sprintf('(%0.5g,%0.5g)',x,f(x))
    i = i + 1;
end