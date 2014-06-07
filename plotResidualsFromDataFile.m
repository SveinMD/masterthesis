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

%'saturation_values-s-r-dt-4320000_000-m-0_010-0_001.dat'
%'saturation_values-s-r-dt-4320000_000-m-0_001-0_010.dat'

%str = strcat('flux_values.dat');

str = strcat('flux_values-s-r-dt-4320000_000-m-0_001-0_010.dat');
v = [1,10];

%str = strcat('flux_values-s-r-dt-4320000_000-m-0_010-0_001.dat');
%v = [10,1];

data = importdata(str);
n = length(data);

% v = [1, 1000;...
%      1, 100; ...
%      1, 10;  ...
%      1, 1;   ...
%      10, 1;  ...
%      100, 1; ...
%      1000, 1;...
%     ];
%v = [1, 10; 1,1; 10, 1];

v = v*muw;

clf;
if(~exist('istart','var'))
    istart = 1;
end
for i = istart:n
    cell = data(i,1); 
    qi = data(i,2); qo = data(i,3); 
    dtpv = data(i,4);
    s0 = data(i,5);
    s0_mod_cpp = data(i,6);
    rq = abs(qo/qi);
    fprintf('i = %d, cell = %d, rq = %2.5g, qo = %2.5g, qi = %2.5g, dtpv = %2.3g\n',i,cell,rq,qo,qi,dtpv)
    plotWRTViscosity(s,s0,qo,qi,dtpv,v,r);
    hold on;
    plot(s0,0,'b*');
    plot(s0_mod_cpp,0,'kx');
    %plot(scale(muw/muo,qo/qi),0,'g*');
    pause;
end
