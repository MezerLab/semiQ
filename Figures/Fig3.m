%% Fig. 3 correlations all humans

load('MPRAGE_T2_space_all_subs_HBM.mat');

%% R1 correlates:
fontsize = 16;

figure(1);
nBins=200;
subplot(2,3,1);
[ax,R1] = plothist(nBins, T1w_all, R1_all, fontsize);
xlabel('T1w [a.u.]'); 
ylabel('R1 [S^-^1]')

subplot(2,3,2);
[ax,R2]=plothist(nBins,T1woverT2w_all1,R1_all,fontsize);
xlabel('T1w/T2w [a.u.]'); 

subplot(2,3,3);
[ax,R3]=plothist(nBins,T1woverPDw_all,R1_all,fontsize);
xlabel('T1w/PDw [a.u.]'); 
% colorbar;
%% R2 correlates:
subplot(2,3,4);
[ax,R1]=plothist(nBins,R2w_all,R2_all,fontsize);
xlabel('R2w [a.u.]'); 
ylabel('R2 [S^-^1]')

subplot(2,3,5);
[ax,R2]=plothist(nBins,T1woverT2w_all2,R2_all,fontsize);
xlabel('T1w/T2w [a.u.]'); 

subplot(2,3,6);
[ax,R3]=plothist(nBins,lnT2woverPDw_all,R2_all,fontsize);
xlabel('ln(T2w/PDw) [a.u.]'); 