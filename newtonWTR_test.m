% Newton driver
M = 10;

x = linspace(0,1,100);

mw = @(x) x.^2;
dmw = @(x) 2*x;
d2mw = @(x) 2;

mo = @(x) (1-x).^2;
dmo = @(x) 2*(x-1);
d2mo = @(x) 2;

m = @(x) mw(x) + M*mo(x);
dm = @(x) dmw(x) + M*dmo(x);
d2m = @(x) d2mw(x) + M*d2mo(x);

f = @(x) mw(x)./m(x);
df = @(x) dmw(x)./m(x) - mw(x).*dm(x)./m(x).^2;
d2f = @(x) d2mw(x)./m(x) - dmw(x).*dm(x)./m(x).^2 + 2*mw(x).*dm(x).^2./m(x).^3 - (dmw(x).*dm(x) + mw(x).*d2m(x))./m(x).^2;

ft = @(x,xp) f(xp) + df(xp).*(x-xp);

fg = @(x) f(x).*mo(x);
dfg = @(x) df(x).*mo(x) + dmo(x).*f(x);
d2fg = @(x) d2f(x).*mo(x) + 2*dmo(x).*df(x) + d2mo(x).*f(x);

x0 = 0.81;
qg = 1; %-3.87269e-10; % % -1.97e-9
dt = 10000;
pv = 500;
dtpv = dt./pv;
tol = 1e-8;

R_ = @(x,x0,dt) x - x0 + dt./pv.*qg.*fg(x);
dR_ = @(x,dt) 1 + dt./pv.*qg.*dfg(x);

R = @(x) R_(x,x0,dt);
dR = @(x) dR_(x,dt);

plot(x,R(x))
hold on; grid on;
%plot(x,dR(x));
%plot(x,fg(x));
%plot(x,dfg(x));
%plot(x,d2fg(x));
hold off

if(M == 1)
    mid = 0.5;
elseif(M < 1)
    mid = binarySearch(0,0.5,-1,d2fg);
else
    mid = binarySearch(0.5,1,-1,d2fg);
end
[xi1] = bisection(0,mid,d2fg,1e-6,20);
[xi2] = bisection(mid,1,d2fg,1e-6,20);

mid = 0.5;
left = binarySearch(0,mid,1,dfg);
right = binarySearch(mid,1,-1,dfg);
[xs] = bisection(left,right,dfg,1e-6,20);

[xwtr, xwtrv, iwtr] = newtonWTR(x0,xi1,xi2,xs,R,dR,tol);
iwtr
[xjtr, xjtrv, ijtr] = newtonJTR(x0,xi1,R,dR,tol);
ijtr
[xnr, xnrv, inr] = newton(x0,R,dR,tol);
inr