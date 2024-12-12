%% Fig. 5 - B0 as T2w:
load("B0_as_T2w_quantifiers.mat");

fontsize = 16;

figure(3);
nBins=200;
subplot(2,3,1);
plothist(nBins,T1woverB0_all,R1_all,fontsize);
xlabel('T1w/T2w_B_0 [a.u.]'); ylabel('R1 [S^-^1]')

subplot(2,3,2);
plothist(nBins,lnT1woverB0_all,R1_all,fontsize);
xlabel('ln(T1w/T2w_B_0) [a.u.]'); 

subplot(2,3,3);
plothist(nBins,T1woverlnB0_all,R1_all,fontsize);
xlabel('T1w/ln(T2w_B_0) [a.u.]'); 

subplot(2,3,4);
plothist(nBins,T1woverB0_all,R2_all,fontsize);
xlabel('T1w/T2w_B_0 [a.u.]'); ylabel('R2 [S^-^1]')

subplot(2,3,5);
plothist(nBins,lnT1woverB0_all,R2_all,fontsize);
xlabel('ln(T1w/T2w_B_0) [a.u.]'); 

subplot(2,3,6);
plothist(nBins,T1woverlnB0_all,R2_all,fontsize);
xlabel('T1w/ln(T2w_B_0) [a.u.]'); 