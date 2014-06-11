cpusrm01 = importdata('tex/datafiles/spe10-cputvsdt-s-r-T-400-m-1-10-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpustm01 = importdata('tex/datafiles/spe10-cputvsdt-s-t-T-400-m-1-10-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusam01 = importdata('tex/datafiles/spe10-cputvsdt-s-a-T-400-m-1-10-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusbm01 = importdata('tex/datafiles/spe10-cputvsdt-s-b-T-400-m-1-10-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusim01 = importdata('tex/datafiles/spe10-cputvsdt-s-i-T-400-m-1-10-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusrm01 = cpusrm01.data;
cpustm01 = cpustm01.data;
cpusam01 = cpusam01.data; 
cpusbm01 = cpusbm01.data; 
cpusim01 = cpusim01.data;

cpusrm1 = importdata('tex/datafiles/spe10-cputvsdt-s-r-T-400-m-1-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpustm1 = importdata('tex/datafiles/spe10-cputvsdt-s-t-T-400-m-1-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusam1 = importdata('tex/datafiles/spe10-cputvsdt-s-a-T-400-m-1-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusbm1 = importdata('tex/datafiles/spe10-cputvsdt-s-b-T-400-m-1-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusim1 = importdata('tex/datafiles/spe10-cputvsdt-s-i-T-400-m-1-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusrm1 = cpusrm1.data;
cpustm1 = cpustm1.data;
cpusam1 = cpusam1.data; 
cpusbm1 = cpusbm1.data; 
cpusim1 = cpusim1.data;

cpusrm10 = importdata('tex/datafiles/spe10-cputvsdt-s-r-T-400-m-10-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpustm10 = importdata('tex/datafiles/spe10-cputvsdt-s-t-T-400-m-10-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusam10 = importdata('tex/datafiles/spe10-cputvsdt-s-a-T-400-m-10-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusbm10 = importdata('tex/datafiles/spe10-cputvsdt-s-b-T-400-m-10-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusim10 = importdata('tex/datafiles/spe10-cputvsdt-s-i-T-400-m-10-1-dim-10-10-60-220-perm-i-0-0-0-i-50.data',',');
cpusrm10 = cpusrm10.data;
cpustm10 = cpustm10.data;
cpusam10 = cpusam10.data; 
cpusbm10 = cpusbm10.data; 
cpusim10 = cpusim10.data;

ind = 5:11;
dt = cpusrm01(ind,1);

figure; hold on;
plot(dt,cpusrm01(ind,2)); 
plot(dt,cpustm01(ind,2))
plot(dt,cpusam01(ind,2))
plot(dt,cpusbm01(ind,2))
plot(dt,cpusim01(ind,2))

figure; hold on;
plot(dt,cpusrm1(ind,2))
plot(dt,cpustm1(ind,2))
plot(dt,cpusam1(ind,2))
plot(dt,cpusbm1(ind,2))
plot(dt,cpusim1(ind,2))

figure; hold on;
plot(dt,cpusrm10(ind,2))
plot(dt,cpustm10(ind,2))
plot(dt,cpusam10(ind,2))
plot(dt,cpusbm10(ind,2))
plot(dt,cpusim10(ind,2))