function [f,Pf,peakpower,peakfrequency,meanfrequency]=spectrumdensity(signal)
% estimate the power spectral density (f,Pf) of the signal

% mean-detrended
nor_S=signal-mean(signal);

Fs=10^3/1; % sampling frequency of the signal (Hz)

% some parameters in the Welch estimator
window=hamming(250); % window
nfft=2*length(nor_S);% number of fft points
noverlap=2; % overlapping 

[Pf,f]=pwelch(nor_S,window,noverlap,nfft,Fs); % Welch method to compute PSD

[peakpower,p]=max(Pf); % peak power
peakfrequency=f(p); % peak frequency
meanfrequency=dot(f,Pf);
