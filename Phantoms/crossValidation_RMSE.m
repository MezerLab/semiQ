function [meanRMSE] = crossValidation_RMSE(a,b,holdOutFraction,numIterations)
% This function performs cross-validation to compute the average Root Mean 
% Squared Error (RMSE) between two variables, a and b, over multiple iterations.
%
% INPUTS:
%       - a: Independent variable (column vector or converted to one).
%       - b: Dependent variable (column vector or converted to one).
%       - holdOutFraction (optional): Fraction of data to hold out for 
%       testing in each iteration. Default is 10%.
%       - numIterations (optional): Number of iterations for 
%       cross-validation. Default is 1000.
% OUTPUTS:
%       - meanRMSE: The average RMSE over all cross-validation iterations,
%       which gives a robust estimate of the model s predictive performance.

% Assuming a and b are column vectors
if size(a,2) > 1
    a = a';
end
if size(b,2) > 1
    b = b';
end
if sum(isnan(a))>0
    out_idx = find(isnan(a));
    a(out_idx)=[];
    b(out_idx)=[];
elseif sum(isnan(b))>0
    out_idx = find(isnan(b));
    a(out_idx)=[];
    b(out_idx)=[];
end

numDataPoints = length(a);
if(~exist('holdOutFraction','var'))
    holdOutFraction = 0.10; % 10%
end
numHoldOut = round(numDataPoints * holdOutFraction);
if(~exist('numIterations','var'))
    numIterations = 1000;
end

% Storage for performance
mse = zeros(numIterations, 1); % Mean squared error for each iteration

for iter = 1:numIterations
    % Randomly select indices for holdout
    holdOutIdx = randsample(numDataPoints, numHoldOut);
    trainIdx = setdiff(1:numDataPoints, holdOutIdx);
   
    % Training data
    a_train = a(trainIdx);
    b_train = b(trainIdx);
   
    % Test data
    a_test = a(holdOutIdx);
    b_test = b(holdOutIdx);
   
    % Linear regression on training data
    p = polyfit(a_train, b_train, 1); % Assuming a simple linear relationship
   
    % Predict on test data
    b_pred = polyval(p, a_test);
   
    % Compute the mean squared error
    rmse(iter) = sqrt(mean((b_test - b_pred).^2));
end

meanRMSE = mean(rmse); % Average MSE over all iterations
