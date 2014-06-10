%%% -i 4 %%%
satm01i4 = importdata('saturation_values-s-r-dt-50-m-1-10-i-4.dat');
satm10i4 = importdata('saturation_values-s-r-dt-50-m-10-1-i-4.dat');
satm1i4 = importdata('saturation_values-s-r-dt-50-m-1-1-i-4.dat');

em01i4 = abs(satm01i4(:,3)-satm01i4(:,1));
em1i4 = abs(satm1i4(:,3)-satm1i4(:,1));
em10i4 = abs(satm10i4(:,3)-satm10i4(:,1));

sem01i4 = sort(em01i4);
sem10i4 = sort(em10i4);
sem1i4 = sort(em1i4);

fluxm01i4 = importdata('flux_values-s-r-dt-50-m-1-10-i-4.dat');
fluxm1i4 = importdata('flux_values-s-r-dt-50-m-1-1-i-4.dat');
fluxm10i4 = importdata('flux_values-s-r-dt-50-m-10-1-i-4.dat');

rqm01i4 = fluxm01i4(:,3)./fluxm01i4(:,2);
rqm1i4 = fluxm1i4(:,3)./fluxm1i4(:,2);
rqm10i4 = fluxm10i4(:,3)./fluxm10i4(:,2);

dlmwrite('q5-sr-T-300-t-50-m-10-1-dim-10-10-10-20-20-1-perm-h-10-i-4.data',sort(satm10i4(:,3)),' ')
dlmwrite('q5-sr-T-300-t-50-m-1-1-dim-10-10-10-20-20-1-perm-h-10-i-4.data',sort(satm1i4(:,3)),' ')
dlmwrite('q5-sr-T-300-t-50-m-1-10-dim-10-10-10-20-20-1-perm-h-10-i-4.data',sort(satm01i4(:,3)),' ')

dlmwrite('q5-s0error-T-300-t-50-m-1-10-dim-10-10-10-20-20-1-perm-h-10-i-4.data',sem01i4,' ')
dlmwrite('q5-s0error-T-300-t-50-m-10-1-dim-10-10-10-20-20-1-perm-h-10-i-4.data',sem10i4,' ')
dlmwrite('q5-s0error-T-300-t-50-m-1-1-dim-10-10-10-20-20-1-perm-h-10-i-4.data',sem1i4,' ')

%%% -i 180 %%%
satm01i180 = importdata('saturation_values-s-r-dt-50-m-1-10-i-180.dat');
satm10i180 = importdata('saturation_values-s-r-dt-50-m-10-1-i-180.dat');
satm1i180 = importdata('saturation_values-s-r-dt-50-m-1-1-i-180.dat');

em01i180 = abs(satm01i180(:,3)-satm01i180(:,1));
em1i180 = abs(satm1i180(:,3)-satm1i180(:,1));
em10i180 = abs(satm10i180(:,3)-satm10i180(:,1));

sem01i180 = sort(em01i180);
sem10i180 = sort(em10i180);
sem1i180 = sort(em1i180);

fluxm01i180 = importdata('flux_values-s-r-dt-50-m-1-10-i-180.dat');
fluxm1i180 = importdata('flux_values-s-r-dt-50-m-1-1-i-180.dat');
fluxm10i180 = importdata('flux_values-s-r-dt-50-m-10-1-i-180.dat');

rqm01i180 = fluxm01i180(:,3)./fluxm01i180(:,2);
rqm1i180 = fluxm1i180(:,3)./fluxm1i180(:,2);
rqm10i180 = fluxm10i180(:,3)./fluxm10i180(:,2);

dlmwrite('q5-sr-T-300-t-50-m-10-1-dim-120-120-10-20-20-1-perm-h-10-i-180.data',sort(satm10i180(:,3)),' ')
dlmwrite('q5-sr-T-300-t-50-m-1-1-dim-120-120-10-20-20-1-perm-h-10-i-180.data',sort(satm1i180(:,3)),' ')
dlmwrite('q5-sr-T-300-t-50-m-1-10-dim-120-120-10-20-20-1-perm-h-10-i-180.data',sort(satm01i180(:,3)),' ')

dlmwrite('q5-s0error-T-300-t-50-m-1-10-dim-120-120-10-20-20-1-perm-h-10-i-180.data',sem01i180,' ')
dlmwrite('q5-s0error-T-300-t-50-m-10-1-dim-120-120-10-20-20-1-perm-h-10-i-180.data',sem10i180,' ')
dlmwrite('q5-s0error-T-300-t-50-m-1-1-dim-120-120-10-20-20-1-perm-h-10-i-180.data',sem1i180,' ')