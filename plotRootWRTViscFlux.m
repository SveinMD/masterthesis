root_guess_p = @(Rq,M) 1./(1+Rq./M).*(1+sqrt(abs(Rq)./M));
root_guess_m = @(Rq,M) 1./(1+Rq./M).*(1-sqrt(abs(Rq)./M));

M = [linspace(1,300,500),linspace(300,10000,50)];
Rq = linspace(-100,-1,100);

root = [];
for i = 1:length(M)
    root = [root; root_guess_m(Rq,M(i))];
end

surf(Rq,M,root); shading flat;