%% Figure 2: weighted correlations

figure();
subplot(2,3,1);
ylim1=[0.2 0.6];
ylim2=[0 6];
ylim1=[0.2 0.8];
ylim2=[0 15];
fontsize = 20;
color =  [150 150 150]./255;

x1=[]; y1=[]; x2=[]; y2=[]; x3=[]; x4=[]; x5=[]; x6=[];
hold on;
for i = [1,2,4,5]
    x1 = [x1, t_lipids.T1w{i}];
    y1 = [y1, t_lipids.R1{i}];
    x2 = [x2, t_lipids.T1woverT2w{i}];
    x3 = [x3, t_lipids.T1woverPDw{i}];
    x4 = [x4, t_lipids.R2w{i}];
    x5 = [x5, t_lipids.lnT2woverPDw{i}];
    y2 = [y2, t_lipids.R2{i}];
    x6 = [x6, t_lipids.T1woverlnT2w{i}];
end

[Rsquared]=plot_mdl([x1;y1],color);
ax=gca();
ax.YLim = ylim1;
ax.FontSize = 14;
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+(ax.YLim(2)-ax.YLim(1))./7),...
    'p<10^-^3^0','FontSize',14);
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+1.8*(ax.YLim(2)-ax.YLim(1))./7),...
    ['R^2=',num2str(Rsquared,3)],'FontSize',14);
xlabel('T1w [a.u.]',FontSize=fontsize);
ylabel('R1 [S^-^1]',Interpreter='tex',FontSize=fontsize);

subplot(2,3,2);
[Rsquared]=plot_mdl([x2;y1],color);
ax=gca();
ax.YLim = ylim1;
ax.FontSize = 14;
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+(ax.YLim(2)-ax.YLim(1))./7),...
    'p<10^-^3^0','FontSize',14);
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+1.8*(ax.YLim(2)-ax.YLim(1))./7),...
    ['R^2=',num2str(Rsquared,3)],'FontSize',14);
xlabel('T1w/T2w [a.u.]',FontSize=fontsize);
ylabel('R1 [S^-^1]',Interpreter='tex',FontSize=fontsize);

subplot(2,3,3);
[Rsquared]=plot_mdl([x3;y1],color);
ax=gca();
ax.YLim = ylim1;
ax.FontSize = 14;
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+(ax.YLim(2)-ax.YLim(1))./7),...
    'p<10^-^3^0','FontSize',14);
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+1.8*(ax.YLim(2)-ax.YLim(1))./7),...
    ['R^2=',num2str(Rsquared,3)],'FontSize',14);
xlabel('T1w/PDw [a.u.]',FontSize=fontsize);
ylabel('R1 [S^-^1]',Interpreter='tex',FontSize=fontsize);

subplot(2,3,4);
[Rsquared]=plot_mdl([x4;y2],color);
ax=gca();
ax.YLim = ylim2;
ax.FontSize = 14;
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+(ax.YLim(2)-ax.YLim(1))./7),...
    'p<10^-^3^0','FontSize',14);
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+1.8*(ax.YLim(2)-ax.YLim(1))./7),...
    ['R^2=',num2str(Rsquared,3)],'FontSize',14);
xlabel('R2w [a.u.]',FontSize=fontsize);
ylabel('R2 [S^-^1]',Interpreter='tex',FontSize=fontsize);

subplot(2,3,5);
[Rsquared]=plot_mdl([x2;y2],color);
ax=gca();
ax.YLim = ylim2;
ax.FontSize = 14;
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+(ax.YLim(2)-ax.YLim(1))./7),...
    'p<10^-^3^0','FontSize',14);
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+1.8*(ax.YLim(2)-ax.YLim(1))./7),...
    ['R^2=',num2str(Rsquared,3)],'FontSize',14);
xlabel('T1w/T2w [a.u.]',FontSize=fontsize);
ylabel('R2 [S^-^1]',Interpreter='tex',FontSize=fontsize);

subplot(2,3,6);
[Rsquared]=plot_mdl([x5;y2],color);
ax=gca();
ax.YLim = ylim2;
ax.FontSize = 14;
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+(ax.YLim(2)-ax.YLim(1))./7),...
    'p<10^-^3^0','FontSize',14);
text(double(ax.XLim(1)+3.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+1.8*(ax.YLim(2)-ax.YLim(1))./7),...
    ['R^2=',num2str(Rsquared,3)],'FontSize',14);
xlabel('ln(T2w/PDw) [a.u.]',FontSize=fontsize);
ylabel('R2 [S^-^1]',Interpreter='tex',FontSize=fontsize);

