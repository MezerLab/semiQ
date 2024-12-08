%% Creating weighted ratios and synthetic quantifiers (with and without noise)

fa_T1 = 30./180.*pi;
fa_PD = 4./180.*pi;
symTR = 18;             % ms
TE1 = TE_PD - TE_T2;    % ms

symTR = symTR./1000; %sec
TE1 = TE1./1000;     %sec

sym_T1w_over_PDw = @(T1,TR,FA) sin(FA).*(1-exp(-TR./T1))./(1-exp(-TR./T1).*cos(FA));
sym_ln_T2w_over_PDw = @(T2,TE) 1./T2.*(-TE);

T1_sym = linspace(T1_min,T1_max);
T2_sym = linspace(T2_min, T2_max);
R1_sym = 1./T1_sym;         % seconds
R2_sym = 1./T2_sym;         % seconds

T1woverPDw_sym = sym_T1w_over_PDw(T1_sym,symTR,fa_T1);
lnT2woverPDw_sym = sym_ln_T2w_over_PDw(T2_sym,TE1);

%% SNR noise: RUN

% Define the desired SNR values in dB
snr_dB1 = 20; % for example, 20 dB
snr_dB2 = 15; % for example, 15 dB
snr_dB3 = 10; % for example, 10 dB

T1_noisy1 = add_noise(T1woverPDw_sym, snr_dB1);
T1_noisy2 = add_noise(T1woverPDw_sym, snr_dB2);
T1_noisy3 = add_noise(T1woverPDw_sym, snr_dB3);

T2_noisy1 = add_noise(lnT2woverPDw_sym, snr_dB1);
T2_noisy2 = add_noise(lnT2woverPDw_sym, snr_dB2);
T2_noisy3 = add_noise(lnT2woverPDw_sym, snr_dB3);

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

%% Functions

function [noisy_signal] = add_noise(signal, snr_dB)

% Calculate the signal power
signal_power = mean(signal(:).^2);

% Convert SNR from dB to linear scale
snr_linear = 10^(snr_dB/10);

% Calculate the noise power for each SNR
noise_power = signal_power / snr_linear;

% Generate Gaussian noise with calculated power
noise = sqrt(noise_power) * randn(size(signal));

% Generate noisy data
noisy_signal = signal + noise;
end
