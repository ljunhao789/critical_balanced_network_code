function t=averagebinnedISI(SpikeTrains)
% find optimal bin size :
% the average ISI of the merged spike train

N_total=size(SpikeTrains,1);
MergedTrain=[];
for s=1:N_total  % merge the spike trains of N_total neurons
    MergedTrain=[MergedTrain,SpikeTrains{s}];
end
MergedTrain=sort(MergedTrain); % make ascending order
ISI=zeros(1,length(MergedTrain)-1);
for j=1:length(MergedTrain)-1
    ISI(j)=MergedTrain(j+1)-MergedTrain(j);
end
t=mean(ISI);
