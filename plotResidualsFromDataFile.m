% Plot gravity residuals from parameters

mD = 1e-3;
muw = 1*mD;
muo = muw;
mobw = @(s,muw) s.^2/muw;
mobo = @(s,muo) (1-s).^2/muo;
s0 = 0.5;
%dtpv = 172;

fw = @(s,muw,muo) mobw(s,muw)./(mobw(s,muw) + mobo(s,muo));
h = @(s,qo,qi,dtpv,muw,muo) dtpv*(qo*fw(s,muw,muo)+qi);
r = @(s,s0,qo,qi,dtpv,muw,muo) s - s0 + h(s,qo,qi,dtpv,muw,muo);

s=linspace(0,1,100);

str = strcat('flux_values.dat');
data = importdata(str);
%data = data.data;
n = length(data);

clf;
%istart = 254;
for i = istart:n
    cell = data(i,1); 
    qi = data(i,2); qo = data(i,3); 
    dtpv = data(i,4);
    s0 = data(i,5);
    rq = abs(qo/qi);
    fprintf('i = %d, cell = %d, rq = %2.5g, qo = %2.5g, qi = %2.5g, dtpv = %2.3g\n',i,cell,rq,qo,qi,dtpv)
    plotWRTViscosity(s,s0,qo,qi,dtpv,muw,muo,r);
    hold on;
    plot(s0,0,'g*');
    %plot(scale(muw/muo,qo/qi),0,'g*');
    pause;
end
