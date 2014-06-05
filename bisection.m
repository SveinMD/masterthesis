function [x,i] = bisection(a,b,f,tol,maxiter)

i = 0;
fa = f(a); fb = f(b);
if(fa*fb > 0)
    disp('Error: Invalid bracket!')
    return
end
x = a;
fx = f(x);
while(abs(a-b) > tol && abs(fx) > tol && i < maxiter)
    x = (a+b)/2;
    fx = f(x);
    if(fx*fa < 0)
        b = x;
        %fb = fx;
    else
        a = x;
        fa = fx;
    end
    i = i + 1;
end