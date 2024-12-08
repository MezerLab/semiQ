function [Rsquared] = plot_mdl_synth(matmdl, mdl_col,plotline)
% This function recieves a matrix and outputs the R-squared value of the
% linear correlation between the matrix rows, as well as plotting the
% linear regression.
%
%   Inputs:
%       - matmdl - a matrix consisting of 2 rows to perform linear
%       regression on.
%       - mdl_color - color for the linear regression plot.
%       - plotline - toggle argument for plotting the regression line.
%
%   Outputs:
%       - Rsquared - the R-squared value of the linear regression model.
%


mdl = fitlm(matmdl(1,:),matmdl(2,:),'poly1');
Rsquared = mdl.Rsquared.Ordinary;

% Define extended range
x = matmdl(1,:);
y = matmdl(2,:);
delta = (max(x)-min(x)).*0.05;  % How much to extend beyond the original data range
xExtended = linspace(min(x) - delta, max(x) + delta, 400)';  % More points for smoother line

% Calculate predictions for the extended range
yExtended = predict(mdl, xExtended);

% Plot original data
scatter(x, y,'MarkerFaceColor',mdl_col,'MarkerFaceAlpha',0.5,'MarkerEdgeColor',mdl_col);
hold on;
axis square
grid on

% Plot extended regression line
if plotline
    plot(xExtended, yExtended, 'Color',mdl_col,'LineStyle','--', 'LineWidth', 1.5);
end


