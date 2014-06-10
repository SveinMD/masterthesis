function [] = plotWRTViscosity(s,s0,qo,qi,dtpv,v,r)
n = length(v);
if(numel(v) < 2)
    throw('To few elements in viscosity vector')
elseif(numel(v) == 2)
    n = 1;
end

clf;
hold on; grid on;

for i = 1:n
Rs = r(s,s0,qo,qi,dtpv,v(i,1),v(i,2));
plot(s,Rs);
plot(scale(v(i,1)/v(i,2),qo,qi,dtpv),0,'kx');
end
plot(s,0*s,'r');
hold off;

end