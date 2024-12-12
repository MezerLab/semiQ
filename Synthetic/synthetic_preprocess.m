%% Creating weighted ratios and synthetic quantifiers (with and without noise)
load("synthetic_args.mat");

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
