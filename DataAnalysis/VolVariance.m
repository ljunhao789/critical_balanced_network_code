function [t_axis,VarofVol]=VolVariance(AllVe)
% compute the trial-to-trial variance of signal Ve
% each column of AllVe is a trial of Ve

% the time length of recoding
T_length=2000;
% the stimulus onset time
T_onset=1000;

% get the time axis
t_axis=(0:T_length-1) + 1/2 - T_onset; % mid point.
% compute the cross-trail variance
VarofVol=var(AllVe,1,2);

% the pre and post-stimulus variance
preVar=mean(VarofVol(450:950));
postVar=mean(VarofVol(1050:1550));

% 
figure();
plot(t_axis,smooth(VarofVol,30),'k-','LineWidth',2);hold on;
xlabel('time (ms)');ylabel('Variance');
xlim([-400,600]);








