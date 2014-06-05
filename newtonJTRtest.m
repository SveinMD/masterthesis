% Newton driver

M = 0.1;

f = @(x) x.^2./(x.^2+M*(1-x).^2);
df = @(x) 2*x*M.*(1-x)./(M*(x-1).^2+x.^2).^2;
ft = @(x,xp) f(xp) + df(xp).*(x-xp);

x0 = 0.02;
xi = 0.185990;
in = -0.16;
out = 0.16;
dt = 20000;
pv = 500;
dtpv = dt/pv;
tol = 1e-8;

R_ = @(x,x0,in,out,dtpv) x - x0 + dtpv.*(out*f(x)+in);
dR_ = @(x,out,dtpv) 1 + dtpv*out.*df(x);

R = @(x) R_(x,x0,in,out,dtpv);
dR = @(x) dR_(x,out,dtpv);

[xjtr, xjtrv, ijtr] = newtonJTR(x0,xi,R,dR,tol);
[xnr, xnrv, inr] = newton(x0,R,dR,tol);