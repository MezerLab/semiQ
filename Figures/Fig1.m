%% Fig. 1 

fontsize = 20;
figure();
ax = subplot(1,2,1); hold on;
hold on;
color =  [150 150 150]./255;
color = [200, 200, 200;...
         150, 150, 150;...
         100, 100, 100;...
         25, 25, 25]./255;

[Rsquared1]=plot_mdl([T1_noisy3; R1_sym], color(1,:),0);
[Rsquared2]=plot_mdl([T1_noisy2; R1_sym], color(2,:),0);
[Rsquared3]=plot_mdl([T1_noisy1; R1_sym], color(3,:),0);
[Rsquared4]=plot_mdl([T1woverPDw_sym; R1_sym], color(4,:),1);
xlabel('synthetic T1w/PDw [a.u.]','FontSize',fontsize); 
ylabel('synthetic R1 [S^-^1]','FontSize',fontsize);
axis tight

for i=1:4
    plot([0,0],[0,0],'LineWidth',2,'color',color(i,:));
end
legend({['SNR=10dB - R^2=',num2str(Rsquared1,3)];...
    ['SNR=15dB - R^2=',num2str(Rsquared2,3)];...
    ['SNR=20dB - R^2=',num2str(Rsquared3,3)];...
    ['no noise - R^2=',num2str(Rsquared4,3)]},'FontSize',10,'Location','southeast')

ax = subplot(1,2,2); hold on;
hold on;
[Rsquared5]=plot_mdl([T2_noisy3; R2_sym], color(1,:),0);
[Rsquared6]=plot_mdl([T2_noisy2; R2_sym], color(2,:),0);
[Rsquared7]=plot_mdl([T2_noisy1; R2_sym], color(3,:),0);
[Rsquared8]=plot_mdl([lnT2woverPDw_sym; R2_sym], color(4,:),1);
xlabel('synthetic ln(T2w/PDw) [a.u.]','FontSize',fontsize); 
ylabel('synthetic R2 [S^-^1]','FontSize',fontsize);
axis tight

for i=1:4
    plot([0,0],[0,0],'LineWidth',2,'color',color(i,:));
end
legend({['SNR=10dB - R^2=',num2str(Rsquared5,3)];...
    ['SNR=15dB - R^2=',num2str(Rsquared6,3)];...
    ['SNR=20dB - R^2=',num2str(Rsquared7,3)];...
    ['no noise - R^2=',num2str(Rsquared8,3)]},'FontSize',10,'Location','southeast')
