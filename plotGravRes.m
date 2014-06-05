%plotGravRes

s0 = 0.5;
g1 = -1e-5; g2 = norm(g1);
pv = 500;
mw = 500; mo = 150;

muw = 0.001; muo = 0.001;
mobw = @(s)s.^2/muw;
mobo = @(s)(1-s).^2/muo;

s = linspace(0,1,30);
dtv = linspace(0,500000,30);

rimpl=@(s,s0,dtpv,g1,g2,mw,mo)s-s0-dtpv*(g1*mo*mobw(s)./(mobw(s)+mo)+g2*mw*mobo(s)./(mobo(s)+mw));

R = zeros(length(s),length(dtv));

for i = 1:length(dtv)
    R(:,i) = rimpl(s,s0,dtv(i)/pv,g1,g2,mw,mo);
end

surf(dtv,s,R);
shading faceted
%{
for i = 1:length(s)
    for j = 1:length(dtv)
        disp(sprintf('%2.5g, %2.5g, %2.5g',dtv(j),s(i),R(i,j)))
    end
    disp(sprintf(''))
end
%}