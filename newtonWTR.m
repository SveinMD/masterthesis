function [x, xv, i] = newtonWTR(x0,xi1,xi2,xs,f,df,tol)

x = x0;
i = 0;
imax = 20;
xv = x0;
unitycut = false;
zerocut = false;
while(abs(f(x)) > tol && i < imax)
    dx = -f(x)/df(x);
    if((x-xi1)*(x+dx-xi1) < 0)
        x = xi1;
    elseif((x-xs)*(x+dx-xs) < 0)
        x = xs;
    elseif((x-xi2)*(x+dx-xi2) < 0)
        x = xi2;
    else
        x = x + dx;
    end
    %x = max(min(x,1),0);
    if(x > 1 && ~unitycut)
        x = 1;
        unitycut = true;
    elseif(x > 1)
        x = xi1;
        unitycut = false;
    end
    if(x < 0 && ~zerocut)
        x = 0;
        zerocut = true;
    elseif(x < 0)
        x = xi1;
        zerocut = false;
    end
    
    %sprintf('(%0.5g,%0.5g)',x,f(x))
    
    i = i + 1;
    xv = [xv, x];
end