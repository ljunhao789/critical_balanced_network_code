function meanWaveletCoef=bandpower(Allsignals)
% compute the trial-averaged frequency components of the signals across time
% each column of Allsignals is a trial of the signal

samp_interval=1; % the sampling interval of the signals (ms)
freq = 1:80; % the frequency band to observe
for j = 1:size(Allsignals,2) % for each trial
    temp=detrend(Allsignals(:,j));
    wav(:,:,j) = cwt(temp,1000*samp_interval./freq,'cmor1-1'); % 1000*samp_interval is the sampling rate
end
% get the trial-average wavelet coefficients
meanWaveletCoef = mean(abs(wav),3); 
