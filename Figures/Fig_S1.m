%% Fig S1

figure;
subplot(1,3,1);
hold on;
color = [200, 200, 200;...
         150, 150, 150;...
         100, 100, 100;...
         25, 25, 25]./255;

[Rsquared1]=plot_mdl([T1woverPDw_sym_FA1; R1_sym], color(1,:),1);
[Rsquared2]=plot_mdl([T1woverPDw_sym_FA2; R1_sym], color(2,:),1);
[Rsquared3]=plot_mdl([T1woverPDw_sym_FA3; R1_sym], color(3,:),1);
xlabel('synthetic T1w/PDw [a.u.]','FontSize',fontsize); 
ylabel('synthetic R1 [S^-^1]','FontSize',fontsize);
axis tight
legend({['FA=20 - R^2=',num2str(Rsquared1,3)];'';...
    ['FA=10 - R^2=',num2str(Rsquared2,3)];'';...
    ['FA=4 - R^2=',num2str(Rsquared3,3)];''},'FontSize',10,'Location','southeast')
grid off

subplot(1,3,2);
hold on;
[Rsquared1]=plot_mdl([T1woverPDw_sym_TR3; R1_sym], color(1,:),1);
[Rsquared2]=plot_mdl([T1woverPDw_sym_TR2; R1_sym], color(2,:),1);
[Rsquared3]=plot_mdl([T1woverPDw_sym_TR1; R1_sym], color(3,:),1);
xlabel('synthetic T1w/PDw [a.u.]','FontSize',fontsize); 
ylabel('synthetic R1 [S^-^1]','FontSize',fontsize);
axis tight
legend({['TR=20 - R^2=',num2str(Rsquared1,3)];'';...
    ['TR=10 - R^2=',num2str(Rsquared2,3)];'';...
    ['TR=4 - R^2=',num2str(Rsquared3,3)];''},'FontSize',10,'Location','southeast')
grid off

subplot(1,3,3);
hold on;
[Rsquared1]=plot_mdl([lnT2woverPDw_sym_TE3; R2_sym], color(1,:),1);
[Rsquared2]=plot_mdl([lnT2woverPDw_sym_TE2; R2_sym], color(2,:),1);
[Rsquared3]=plot_mdl([lnT2woverPDw_sym_TE1; R2_sym], color(3,:),1);
xlabel('synthetic ln(T2w/PDw) [a.u.]','FontSize',fontsize); 
ylabel('synthetic R2 [S^-^1]','FontSize',fontsize);
axis tight
legend({['TE=-147 - R^2=',num2str(Rsquared1,3)];'';...
    ['TE=-116 - R^2=',num2str(Rsquared2,3)];'';...
    ['TE=-92 - R^2=',num2str(Rsquared3,3)];''},'FontSize',10,'Location','southeast')
grid off
