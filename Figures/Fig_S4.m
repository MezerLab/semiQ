%% Fig. S1 new: Dataset B non-corrected


load('MPRAGE_T2_space_correlations_HBM.mat')

yLim1 = [0.55 1];
yLim2 = [0.3 1.2];
colors = [[220,220,220];[220,220,220];[220,220,220];[220,220,220];[220,220,220];[220,220,220]]./255;
   
    figure(1)
    subplot(2,4,1);
    tbl = table(MPRAGE_subs, R_MPREAGE_R1',R_MPRAGEoverT2w_R1',R_lnT1woverT2w_R1',...
        R_T1woverlnT2w_R1',R_MPRAGEoverPDw_R1', 'VariableNames', {'Subject', 'R_T1w_R1',...
    'R_T1woverT2w_R1', 'R_lnT1woverT2w_R1', 'R_T1woverlnT2w_R1','R_T1woverPDw_R1'});
    ranova_results = rmANOVA(tbl);
    p = pairedTtestBon(tbl);
    boxplot(table2array(tbl(:,2:end)));
    axis square
    ylim(yLim1);
    h = findobj(gca,'Tag','Box');
    hw = findobj(gca, 'Tag', 'Upper Whisker'); % Upper whisker handles
    for j=1:length(h)
        patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
        if j == 1 || j == 2 || j ==5
            text((hw(j).XData(1)),hw(j).YData(2)+0.03,'\downarrow','FontWeight','bold','FontSize',14,'Color','r','HorizontalAlignment','center');
        end
    end
    labels={'T1w','T1w/T2w','ln(T1w/T2w)','T1w/ln(T2w)','T1w/PDw'};
    xticklabels(labels);
    ylabel('Correlation with R1 (R^2)');
    ax=gca;
    text(double(ax.XLim(1)+4.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+(ax.YLim(2)-ax.YLim(1))./7),...
        ['N=',num2str(length(R_MPRAGEoverT2w_R1))],'FontSize',14);

    ax.FontSize = 16;

    subplot(2,4,5);
    tbl = table(MPRAGE_subs, R_R2w_R2,R_ln_R2w_R2,R_MPRAGEoverT2w_R2,...
        R_ln_MPRAGEoverT2w_R2,R_T1woverlnT2w_R2,R_ln_T2woverPDw_R2, 'VariableNames', ...
        {'Subject', 'R_R2w_R2','R_lnR2w_R2','R_T1woverT2w_R2', 'R_lnT1woverT2w_R2',...
        'R_T1woverlnT2w_R2','R_lnT2woverPDw_R1'});
    ranova_results = rmANOVA(tbl);
    p = pairedTtestBon(tbl);
    boxplot(table2array(tbl(:,2:end)));
    axis square
    ylim(yLim2)
    h = findobj(gca,'Tag','Box');
    hw = findobj(gca, 'Tag', 'Upper Whisker'); % Upper whisker handles
    for j=1:length(h)
        patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
    end    
    text((hw(1).XData(1)),hw(1).YData(2)+0.03,'\downarrow','FontWeight','bold','FontSize',14,'Color','r','HorizontalAlignment','center');
    labels = {'R2w','ln(R2w)','T1w/T2w','ln(T1w/T2w)','T1w/ln(T2w)','ln(T2w/PDw)'};
    xticklabels(labels);
    xtickangle(30)
    ylabel('Correlation with R2 (R^2)');
    ax=gca;
    text(double(ax.XLim(1)+(ax.XLim(2)-6*ax.XLim(1))./7),double(ax.YLim(2)-(ax.YLim(2)-ax.YLim(1))./10),...
    ['N=',num2str(length(R_MPRAGEoverT2w_R2))],'FontSize',14);
        ax.FontSize = 16;

%% Dataset B corrected
load('MPRAGE_ANTs_corrected.mat')

    figure(1)
    subplot(2,4,2);
    tbl = table(MPRAGE_subs, R_MPREAGE_R1',R_MPRAGEoverT2w_R1',R_lnT1woverT2w_R1',...
        R_T1woverlnT2w_R1',R_MPRAGEoverPDw_R1', 'VariableNames', {'Subject', 'R_T1w_R1',...
    'R_T1woverT2w_R1', 'R_lnT1woverT2w_R1', 'R_T1woverlnT2w_R1','R_T1woverPDw_R1'});
    ranova_results = rmANOVA(tbl);
    p = pairedTtestBon(tbl);
    boxplot(table2array(tbl(:,2:end)));
    ylim(yLim1);
    axis square
    h = findobj(gca,'Tag','Box');
    hw = findobj(gca, 'Tag', 'Upper Whisker'); % Upper whisker handles
    for j=1:length(h)
        patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
        if j == 1 || j == 2 || j ==5
            text((hw(j).XData(1)),hw(j).YData(2)+0.03,'\downarrow','FontWeight','bold','FontSize',14,'Color','r','HorizontalAlignment','center');
        end
    end
    labels={'T1w','T1w/T2w','ln(T1w/T2w)','T1w/ln(T2w)','T1w/PDw'};
    xticklabels(labels);
    ylabel('Correlation with R1 (R^2)');
    ax=gca;
    text(double(ax.XLim(1)+4.5*(ax.XLim(2)-ax.XLim(1))./7),double(ax.YLim(1)+(ax.YLim(2)-ax.YLim(1))./7),...
        ['N=',num2str(length(R_MPRAGEoverT2w_R1))],'FontSize',14);
    ax.FontSize = 16;

    subplot(2,4,6);
    tbl = table(MPRAGE_subs, R_R2w_R2,R_ln_R2w_R2,R_MPRAGEoverT2w_R2,...
        R_ln_MPRAGEoverT2w_R2,R_T1woverlnT2w_R2,R_ln_T2woverPDw_R2, 'VariableNames', ...
        {'Subject', 'R_R2w_R2','R_lnR2w_R2','R_T1woverT2w_R2', 'R_lnT1woverT2w_R2',...
        'R_T1woverlnT2w_R2','R_lnT2woverPDw_R1'});
    ranova_results = rmANOVA(tbl);
    p = pairedTtestBon(tbl);
    boxplot(table2array(tbl(:,2:end)));
    axis square
    ylim(yLim2)
    h = findobj(gca,'Tag','Box');
    hw = findobj(gca, 'Tag', 'Upper Whisker'); % Upper whisker handles
    for j=1:length(h)
        patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
    end    
    text((hw(1).XData(1)),hw(1).YData(2)+0.03,'\downarrow','FontWeight','bold','FontSize',14,'Color','r','HorizontalAlignment','center');
    labels = {'R2w','ln(R2w)','T1w/T2w','ln(T1w/T2w)','T1w/ln(T2w)','ln(T2w/PDw)'};
    xticklabels(labels);
    xtickangle(30)
    ylabel('Correlation with R2 (R^2)');
    ylim([0.3 1.2])
    ax=gca;
    text(double(ax.XLim(1)+(ax.XLim(2)-6*ax.XLim(1))./7),double(ax.YLim(2)-(ax.YLim(2)-ax.YLim(1))./10),...
    ['N=',num2str(length(R_MPRAGEoverT2w_R2))],'FontSize',14);
        ax.FontSize = 16;

%% Dataset C non-corrected

    load('DatasetC_correlations_no_Correction.mat');

    subs = {'EM_001';'NA_002';'DC_003'};

    subplot(2,4,3);
    tbl = table(subs, R_MPREAGE_R1',R_MPRAGEoverT2w_R1',R_lnT1woverT2w_R1',...
        R_T1woverlnT2w_R1',R_MPRAGEoverPDw_R1', 'VariableNames', {'Subject', 'R_T1w_R1',...
    'R_T1woverT2w_R1', 'R_lnT1woverT2w_R1', 'R_T1woverlnT2w_R1','R_T1woverPDw_R1'});
    ranova_results = rmANOVA(tbl);
    p = pairedTtestBon(tbl);
    h=plot(table2array(tbl(:,2:end))');
    h(1).Marker = '^';
    h(2).Marker = 'o';
    h(3).Marker = 'square';
    h(1).MarkerFaceColor = h(1).Color;
    h(2).MarkerFaceColor = h(2).Color;
    h(3).MarkerFaceColor = h(3).Color;
    axis square
    xlim([0.5 5.5]); ylim([0.75 0.95])
    xticks([0:1:5])
    xtickangle(30)
    xticklabels({'','T1w','T1w/T2w','ln(T1w/T2w)','T1w/ln(T2w)','T1w/PDw'});
    ylabel('Correlation with R1 (R^2)');
    ax=gca;
    ax.FontSize = 16;
    text(double(ax.XLim(1)+(ax.XLim(2)-6*ax.XLim(1))./7),double(ax.YLim(2)-(ax.YLim(2)-ax.YLim(1))./10),...
    ['N=',num2str(length(R_MPREAGE_R1))],'FontSize',14);
        ax.FontSize = 16;

    subplot(2,4,7);
    tbl = table(subs, R_R2w_R2,R_ln_R2w_R2,R_MPRAGEoverT2w_R2,...
    R_ln_MPRAGEoverT2w_R2,R_T1woverlnT2w_R2,R_ln_T2woverPDw_R2, 'VariableNames', ...
    {'Subject', 'R_R2w_R2','R_lnR2w_R2','R_T1woverT2w_R2', 'R_lnT1woverT2w_R2',...
    'R_T1woverlnT2w_R2','R_lnT2woverPDw_R1'});
    ranova_results = rmANOVA(tbl);
    p = pairedTtestBon(tbl);
    h=plot(table2array(tbl(:,2:end))');
    h(1).Marker = '^';
    h(2).Marker = 'o';
    h(3).Marker = 'square';
    h(1).MarkerFaceColor = h(1).Color;
    h(2).MarkerFaceColor = h(2).Color;
    h(3).MarkerFaceColor = h(3).Color;
    xlim([0.5 6.5]);
    xticks([0:1:6]);
    xtickangle(30);
    axis square
    xticklabels({'','R2w','ln(R2w)','T1w/T2w','ln(T1w/T2w)','T1w/ln(T2w)','ln(T2w/PDw)'});
    ylabel('Correlation with R2 (R^2)');
    ax=gca;
    ax.FontSize = 16;
   text(double(ax.XLim(1)+(ax.XLim(2)-6*ax.XLim(1))./7),double(ax.YLim(2)-(ax.YLim(2)-ax.YLim(1))./10),...
    ['N=',num2str(length(R_R2w_R2))],'FontSize',14);
        ax.FontSize = 16;

%% Dataset C corrected

load('DatasetC_correlations_ANTs_Correction.mat');

    subplot(2,4,4);
    tbl = table(subs, R_MPREAGE_R1',R_MPRAGEoverT2w_R1',R_lnT1woverT2w_R1',...
        R_T1woverlnT2w_R1',R_MPRAGEoverPDw_R1', 'VariableNames', {'Subject', 'R_T1w_R1',...
    'R_T1woverT2w_R1', 'R_lnT1woverT2w_R1', 'R_T1woverlnT2w_R1','R_T1woverPDw_R1'});
    ranova_results = rmANOVA(tbl);
    p = pairedTtestBon(tbl);
    h=plot(table2array(tbl(:,2:end))');
    h(1).Marker = '^';
    h(2).Marker = 'o';
    h(3).Marker = 'square';
    h(1).MarkerFaceColor = h(1).Color;
    h(2).MarkerFaceColor = h(2).Color;
    h(3).MarkerFaceColor = h(3).Color;
    axis square
    xlim([0.5 5.5]); ylim([0.75 0.95])
    xticks([0:1:5])
    xtickangle(30)
    xticklabels({'','T1w','T1w/T2w','ln(T1w/T2w)','T1w/ln(T2w)','T1w/PDw'});
    ylabel('Correlation with R1 (R^2)');
    ax=gca;
    ax.FontSize = 16;
    text(double(ax.XLim(1)+(ax.XLim(2)-6*ax.XLim(1))./7),double(ax.YLim(2)-(ax.YLim(2)-ax.YLim(1))./10),...
    ['N=',num2str(length(R_MPREAGE_R1))],'FontSize',14);
        ax.FontSize = 16;

    subplot(2,4,8);
    tbl = table(subs, R_R2w_R2,R_ln_R2w_R2,R_MPRAGEoverT2w_R2,...
    R_ln_MPRAGEoverT2w_R2,R_T1woverlnT2w_R2,R_ln_T2woverPDw_R2, 'VariableNames', ...
    {'Subject', 'R_R2w_R2','R_lnR2w_R2','R_T1woverT2w_R2', 'R_lnT1woverT2w_R2',...
    'R_T1woverlnT2w_R2','R_lnT2woverPDw_R1'});
    ranova_results = rmANOVA(tbl);
    p = pairedTtestBon(tbl);
    h=plot(table2array(tbl(:,2:end))');
    h(1).Marker = '^';
    h(2).Marker = 'o';
    h(3).Marker = 'square';
    h(1).MarkerFaceColor = h(1).Color;
    h(2).MarkerFaceColor = h(2).Color;
    h(3).MarkerFaceColor = h(3).Color;
    xlim([0.5 6.5]);
    xticks([0:1:6]);
    xtickangle(30);
    axis square
    xticklabels({'','R2w','ln(R2w)','T1w/T2w','ln(T1w/T2w)','T1w/ln(T2w)','ln(T2w/PDw)'});
    ylabel('Correlation with R2 (R^2)');
    ax=gca;
    ax.FontSize = 16;
   text(double(ax.XLim(1)+(ax.XLim(2)-6*ax.XLim(1))./7),double(ax.YLim(2)-(ax.YLim(2)-ax.YLim(1))./10),...
    ['N=',num2str(length(R_R2w_R2))],'FontSize',14);
        ax.FontSize = 16;


%% Functions

function [ranova_results]=rmANOVA(tbl)
% Define the repeated measures across conditions
var_names = tbl.Properties.VariableNames(2:end);
formula = sprintf([var_names{1},'-',var_names{end},' ~ 1']);
rm = fitrm(tbl, formula, 'WithinDesign',...
    table(var_names', 'VariableNames', {'R_squared'}));
% Perform repeated-measures ANOVA
ranova_results = ranova(rm);
disp(ranova_results);

end

function [p_values]=pairedTtestBon(tbl)
% Define the number of conditions
data = table2array(tbl(:,2:end));
num_conditions = size(data, 2);
var_names = tbl.Properties.VariableNames(2:end);
alpha = 0.05; % Significance level
adjusted_alpha = alpha / nchoosek(num_conditions, 2); % Bonferroni correction
p_values = nan(num_conditions); % Initialize p-value matrix
% Conduct paired t-tests for each pair of conditions
for i = 1:num_conditions-1
    for j = i+1:num_conditions
%         [~, p] = ttest(data(:, i), data(:, j));
        p = signrank(data(:,i), data(:,j),'method','exact'); % Returns the p-value
        p_values(i, j) = p;
        fprintf(['p-value for ',var_names{i},' vs ',var_names{j},': %.4f\n'], p);
        
        % Apply Bonferroni correction
        if p < adjusted_alpha
            fprintf(['Significant difference between ',var_names{i},' and ',var_names{j},' (p = %.4f)\n'], p);
        else
            fprintf(['No significant difference between ',var_names{i},' and ',var_names{j},' (p = %.4f)\n'], p);
        end
    end
end
end

function addRedArrowToBox(boxHandle)
    % Validate the box handle
    if ~isgraphics(boxHandle, 'line')
        error('Input must be a handle to a box in a boxplot.');
    end

    % Get the x and y data for the top of the box
    xData = boxHandle.XData;
    yData = boxHandle.YData;
    
    % Calculate the midpoint of the box in data coordinates
    midX = mean(xData(1:2));
    topY = max(yData);

    % Convert the data coordinates to normalized figure coordinates
    ax = ancestor(boxHandle, 'axes'); % Get the parent axis
    point = [midX, topY]; % Top center of the box in data coordinates
    [normX, normY] = dataToNormalizedCoordinates(ax, point);

    % Define the position for the arrow in normalized coordinates
    arrowLength = 0.05; % Length of arrow as a proportion of the y-axis range
    annotation('arrow', 'Color', 'red', ...
        'X', [normX, normX], 'Y', [normY + arrowLength, normY], ...
        'HeadStyle', 'vback3', 'HeadLength', 8, 'HeadWidth', 8);
end

function [normX, normY] = dataToNormalizedCoordinates(ax, point)
    % Convert data coordinates to normalized figure coordinates for annotation
    % Get axes position in normalized figure units
    axPos = get(ax, 'Position');
    
    % Get the data limits of the axis
    xLim = get(ax, 'XLim');
    yLim = get(ax, 'YLim');
    
    % Convert data point to axis fraction
    xFraction = (point(1) - xLim(1)) / (xLim(2) - xLim(1));
    yFraction = (point(2) - yLim(1)) / (yLim(2) - yLim(1));
    
    % Scale by axis position in figure units
    normX = axPos(1) + xFraction * axPos(3);
    normY = axPos(2) + yFraction * axPos(4);
end
