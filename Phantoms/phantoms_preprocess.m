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

%% Varying TE TR and FA: RUN

fa1 = 20./180.*pi;
fa2 = 10./180.*pi;
fa3 = 4./180.*pi;

TR1 = 4./1000;
TR2 = 10./1000;
TR3 = 20./1000;

TE1 = (TE_PD - TE_T2)./1000;
TE2 = (4 - 120)./1000;
TE3 = (8 - 100)./1000;



noise = 20; %dB

T1woverPDw_sym_FA1 = sym_T1w_over_PDw(T1_sym,symTR,fa1);
T1woverPDw_sym_FA1 = add_noise(T1woverPDw_sym_FA1, noise);
T1woverPDw_sym_FA2 = sym_T1w_over_PDw(T1_sym,symTR,fa2);
T1woverPDw_sym_FA2 = add_noise(T1woverPDw_sym_FA2, noise);
T1woverPDw_sym_FA3 = sym_T1w_over_PDw(T1_sym,symTR,fa3);
T1woverPDw_sym_FA3 = add_noise(T1woverPDw_sym_FA3, noise);

T1woverPDw_sym_TR1 = sym_T1w_over_PDw(T1_sym,TR1,fa_T1);
T1woverPDw_sym_TR1 = add_noise(T1woverPDw_sym_TR1,noise);
T1woverPDw_sym_TR2 = sym_T1w_over_PDw(T1_sym,TR2,fa_T1);
T1woverPDw_sym_TR2 = add_noise(T1woverPDw_sym_TR2,noise);
T1woverPDw_sym_TR3 = sym_T1w_over_PDw(T1_sym,TR3,fa_T1);
T1woverPDw_sym_TR3 = add_noise(T1woverPDw_sym_TR3,noise);

lnT2woverPDw_sym_TE1 = sym_ln_T2w_over_PDw(T2_sym,TE1);
lnT2woverPDw_sym_TE1 = add_noise(lnT2woverPDw_sym_TE1,noise);
lnT2woverPDw_sym_TE2 = sym_ln_T2w_over_PDw(T2_sym,TE2);
lnT2woverPDw_sym_TE2 = add_noise(lnT2woverPDw_sym_TE2,noise);
lnT2woverPDw_sym_TE3 = sym_ln_T2w_over_PDw(T2_sym,TE3);
lnT2woverPDw_sym_TE3 = add_noise(lnT2woverPDw_sym_TE3,noise);

%% Cross-validation (excluding ddw quivettes):

% For R1 correlations, we calculate the RMSEs:
[RMSE1] = crossValidation_RMSE([t_lipids.T1w{[1:2,4:5],:}],[t_lipids.R1{[1:2,4:5],:}],0.10,1000);
[RMSE2] = crossValidation_RMSE([t_lipids.T1woverT2w{[1:2,4:5],:}],[t_lipids.R1{[1:2,4:5],:}],0.10,1000);
[RMSE3] = crossValidation_RMSE([t_lipids.T1woverPDw{[1:2,4:5],:}],[t_lipids.R1{[1:2,4:5],:}],0.10,1000);

% For R2 correlations, we calculate the RMSEs:
[RMSE4] = crossValidation_RMSE([t_lipids.R2w{[1:2,4:5],:}],[t_lipids.R2{[1:2,4:5],:}],0.10,1000);
[RMSE5] = crossValidation_RMSE([t_lipids.T1woverT2w{[1:2,4:5],:}],[t_lipids.R2{[1:2,4:5],:}],0.10,1000);
[RMSE6] = crossValidation_RMSE([t_lipids.lnT2woverPDw{[1:2,4:5],:}],[t_lipids.R2{[1:2,4:5],:}],0.10,1000);

