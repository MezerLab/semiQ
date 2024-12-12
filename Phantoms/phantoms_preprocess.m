%% Load the table:
load("phantom_table.mat");

%% Other weighted metrics:

T1woverPDw = cellfun(@(x,y) (x./y),t_lipids.T1w,t_lipids.PDw,'UniformOutput',false);
T1woverT2w =  cellfun(@(x,y) (x./y),t_lipids.T1w,t_lipids.T2w,'UniformOutput',false);
T1woverlnT2w =  cellfun(@(x,y) (x./log(y)),t_lipids.T1w,t_lipids.T2w,'UniformOutput',false);
lnT2woverPDw =  cellfun(@(x,y) log(x./y)./TE1,t_lipids.T2w,t_lipids.PDw,'UniformOutput',false);
R2w = cellfun(@(x) (1./x),t_lipids.T2w,'UniformOutput',false);

t_lipids.T1woverPDw = T1woverPDw;
t_lipids.T1woverT2w = T1woverT2w;
t_lipids.T1woverlnT2w = T1woverlnT2w;
t_lipids.lnT2woverPDw = lnT2woverPDw;
t_lipids.R2w = R2w;

%% Cross-validation (excluding ddw quivettes):

% For R1 correlations, we calculate the RMSEs:
[RMSE1] = crossValidation_RMSE([t_lipids.T1w{[1:2,4:5],:}],[t_lipids.R1{[1:2,4:5],:}],0.10,1000);
[RMSE2] = crossValidation_RMSE([t_lipids.T1woverT2w{[1:2,4:5],:}],[t_lipids.R1{[1:2,4:5],:}],0.10,1000);
[RMSE3] = crossValidation_RMSE([t_lipids.T1woverPDw{[1:2,4:5],:}],[t_lipids.R1{[1:2,4:5],:}],0.10,1000);

% For R2 correlations, we calculate the RMSEs:
[RMSE4] = crossValidation_RMSE([t_lipids.R2w{[1:2,4:5],:}],[t_lipids.R2{[1:2,4:5],:}],0.10,1000);
[RMSE5] = crossValidation_RMSE([t_lipids.T1woverT2w{[1:2,4:5],:}],[t_lipids.R2{[1:2,4:5],:}],0.10,1000);
[RMSE6] = crossValidation_RMSE([t_lipids.lnT2woverPDw{[1:2,4:5],:}],[t_lipids.R2{[1:2,4:5],:}],0.10,1000);

