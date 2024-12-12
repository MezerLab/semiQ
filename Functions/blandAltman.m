function [] = blandAltman(method1,method2,method_names)
%   This function creates a Bland-Altman plot to assess the agreement between
%   two measurement methods. The plot shows:
%     - The mean of the two methods on the x-axis.
%     - The difference between the two methods on the y-axis.
%     - The bias (mean difference) as a solid red line.
%     - The 95% limits of agreement (mean ± 1.96 * standard deviation) as dashed blue lines.
%
% INPUTS:
%   method1      - First set of measurements (vector of numeric values).
%   method2      - Second set of measurements (vector of numeric values).
%   method_names - Cell array of two strings containing the names of the methods.
%                  Used for labeling the plot.
%
% OUTPUTS:
%   None (this function generates a Bland-Altman plot as a side effect).


mean_values = (method1 + method2) / 2;
differences = method1 - method2;
mean_diff = mean(differences);
std_diff = std(differences);
upper_limit = mean_diff + 1.96 * std_diff;
lower_limit = mean_diff - 1.96 * std_diff;

plot2Dhist(mean_values, differences);

hold on;
yline(mean_diff, 'r', 'Bias');
yline(upper_limit, 'b--', 'Upper Limit');
yline(lower_limit, 'b--', 'Lower Limit');
xlabel(['Mean of ',method_names{1},' and ',method_names{2}]);
ylabel(['Difference (',method_names{1},' - ',method_names{2},')']);
hold off;
end