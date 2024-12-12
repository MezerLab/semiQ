%% Normalized PPMI vs. qMRI HUJI:
load("PPMI_vs_HUJI_ROI.mat");

fontsize = 18;

figure;
 for ii = 1 : length(roi_names)
     subplot(2,2,1); hold on;
     errorbar(mean(T1woverPDwppmi_n(:,ii)),mean(R1huji(:,ii)), ...
         std(R1huji(:,ii)),std(R1huji(:,ii)),std(T1woverPDwppmi_n(:,ii)),std(T1woverPDwppmi_n(:,ii)),...
         'Color',colors(ii,:),'marker','o') 
     xlabel('T1w/PDw (Dataset D) [a.u.]');
     ylabel('R1 (Dataset B) [S^-^1]')
     axis square
     grid on
     ax=gca();
     ax.FontSize = fontsize;
      subplot(2,2,2); hold on;
     errorbar(mean(T1woverT2wppmi_n(:,ii)),mean(R1huji(:,ii)), ...
         std(R1huji(:,ii)),std(R1huji(:,ii)),std(T1woverT2wppmi_n(:,ii)),std(T1woverT2wppmi_n(:,ii)),...
         'Color',colors(ii,:),'marker','o') 
     xlabel('T1w/T2w (Dataset D) [a.u.]');
     ylabel('R1 (Dataset B) [S^-^1]')
     ax=gca();
     ax.FontSize = fontsize;
     axis square
      grid on
    subplot(2,2,3); hold on;
     errorbar(mean(T1woverlnT2wppmi_n(:,ii)),mean(R1huji(:,ii)), ...
         std(R1huji(:,ii)),std(R1huji(:,ii)),std(T1woverlnT2wppmi_n(:,ii)),std(T1woverlnT2wppmi_n(:,ii)),...
         'Color',colors(ii,:),'marker','o') 
     xlabel('T1w/ln(T2w) (Dataset D) [a.u.]');
     ylabel('R1 (Dataset B) [S^-^1]')
     ax=gca();
     ax.FontSize = fontsize;
     axis square
      grid on
    subplot(2,2,4); hold on;
     errorbar(mean(lnT2woverPDwppmi_n(:,ii)),mean(R2huji(:,ii)), ...
         std(R2huji(:,ii)),std(R2huji(:,ii)),std(lnT2woverPDwppmi_n(:,ii)),std(lnT2woverPDwppmi_n(:,ii)),...
         'Color',colors(ii,:),'marker','o') 
     xlabel('ln(T2w/PDw) (Dataset D) [a.u.]');
     ylabel('R2 (Dataset B) [S^-^1]')
     axis square
     grid on
     ax=gca();
     ax.FontSize = fontsize;
 end

[R1,PVAL1] = corrcoef(median(T1woverPDwppmi_n,1)',median(R1huji,1)');
subplot(2,2,1); text(0.8,1.1,['R^2=',num2str(R1(1,2),3)],'FontSize',16)
text(0.8,1,'p<10^-^3^0','FontSize',16)
[R2,PVAL2] = corrcoef(median(T1woverT2wppmi_n,1)',median(R1huji,1)');
subplot(2,2,2); text(0.8,1.1,['R^2=',num2str(R2(1,2),3)],'FontSize',16)
text(0.8,1,'p<10^-^3^0','FontSize',16)
[R3,PVAL3] = corrcoef(median(T1woverlnT2wppmi_n,1)',median(R1huji,1)');
subplot(2,2,3); text(0.8,1.1,['R^2=',num2str(R3(1,2),3)],'FontSize',16)
text(0.8,1,'p<10^-^3^0','FontSize',16)
[R4,PVAL4] = corrcoef(median(lnT2woverPDwppmi_n,1)',median(R2huji,1)');
subplot(2,2,4); text(1,14,['R^2=',num2str(R4(1,2),3)],'FontSize',16)
text(1,12,'p<10^-^3^0','FontSize',16)

legend(roi_names, 'FontSize',16)

