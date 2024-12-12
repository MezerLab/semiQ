function [noisy_signal] = add_noise(signal, snr_dB)
%   This function calculates the noise power required to achieve the specified
%   SNR relative to the input signal's power. Gaussian noise is then generated
%   and added to the signal. The resulting noisy signal is returned.
%   Calculate the signal power
% INPUTS:
%   signal   - Original input signal (vector or matrix) to which noise will be added.
%   snr_dB   - Desired Signal-to-Noise Ratio (SNR) in decibels (dB).
%
% OUTPUTS:
%   noisy_signal - Signal with added Gaussian noise, adjusted to match the specified SNR.

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
