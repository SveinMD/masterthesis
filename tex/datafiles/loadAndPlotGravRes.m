% Plot gravity residuals from parameters

muw = 1e-3;
muo = muw;
mobw = @(s) s.^2/muw;
mobo = @(s) (1-s).^2/muo;

rimpl = @(s,s0,dtpv,g1,g2,mw,mo) s - s0 - ...
    dtpv*(g1*mo*mobw(s)./(mobw(s)+mo) + g2*mw*mobo(s)./(mobo(s)+mw));

s=linspace(0,1,100);

for i = 1:10:100
    str = strcat('residual-data-cell-',int2str(i-1),'.data');
    if(exist(str,'file'))
        disp(str)
        data = importdata(str);
        data = data.data;
        dtpv = data(2);
        s0 = data(3);
        g1 = data(4); g2 = data(5);
        mw = data(8); mo = data(7);
        Rs = rimpl(s,s0,dtpv,g1,g2,mw,mo);
        plot(s,Rs);
        pause;
    end
end
