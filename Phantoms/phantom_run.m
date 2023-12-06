function [T] = phantom_run(T,TE_PD,TE_T2,fa_T1,TR)
% This function calculates the new quantifiers and produce synthetic values
% 
% INPUT:
%     T - A table that contains the median of the maps across quivettes.
%         Each row represents a different type of lipid.
%     TE_PD - echo time of PD scans.
%     TE_T2 - echo time of T2 scans.
%     fa_T1 - flip angle (alpha) 
%     TR - repetition time.
% 
% OUTPUT:
%     T - the midified table, contains all new quantifiers and synthetic
%     values.

signal_sym_T1_over_PD = @(T1, FA, TR) sin(FA).*(1-exp(-TR./T1))./(1-exp(-TR./T1).*cos(FA));
signal_sym_T2_over_PD = @(TE, T2) exp(-(TE./1000)./T2);


for ii = 1:height(T)
    T.T1woverT2w{ii} = T.T1w{ii}./T.T2w{ii};   
    T.T1woverPDw{ii} = T.T1w{ii}./T.PDw{ii};   
    T.lnT2woverPDw{ii} = log(T.T2w{ii}./T.PDw{ii}).*(TE_PD-TE_T2);
    T.R1{ii} = 1./T.T1{ii};   
    T.R2{ii} = 1./T.T2{ii};
    T.R2w{ii} = 1./T.T2w{ii};
    
    % Now create the synthetic values:
    T.syn_T1woverPDw{ii} = signal_sym_T1_over_PD(T.T1{ii}, fa_T1, TR);
    T.syn_lnT2woverPDw{ii} = log(signal_sym_T2_over_PD(TE_T2,T.T2{ii})).*(TE_PD-TE_T2);
end
