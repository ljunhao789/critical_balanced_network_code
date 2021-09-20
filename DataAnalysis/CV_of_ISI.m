function CV=CV_of_ISI(SpikeTrains)
% get the CV of ISI of neurons

N_total=size(SpikeTrains,1);
CV=zeros(1,N_total);
for s=1:N_total %    
    if length(SpikeTrains{s})>=5 % only recoding > 10 spikes counts
        ISI=zeros(1,length(SpikeTrains{s})-1);
        for l=1:length(SpikeTrains{s})-1
            ISI(l)=SpikeTrains{s}(l+1)-SpikeTrains{s}(l);
        end
        CV(s)=std(ISI)/mean(ISI);
    else
        CV(s)=nan;
    end
end
CV(isnan(CV))=[];

