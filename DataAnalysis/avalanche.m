function [sizeset,durationset,shapeset]=avalanche(SpikeTrains,T_length,timebin)
% get the avalanche sizes, durations, and shapes from 
% a population of neurons with spike trains SpikeTrains.
% timebin is the bin used to define avalanche
% T_length is the recoding time length of the trains

% first find the number of spikes in each bin in the merged train
Aset=avalancheset(SpikeTrains);

sizeset=[]; % record the avalanche size
durationset=[];% record the avalanche duration
currentset=[]; 
a=1;
for l=1:length(Aset)
    if Aset(l)~=0
        currentset=[currentset,Aset(l)];
    else
        the_size=sum(currentset);
        duration=length(currentset);
        sizeset=[sizeset,the_size]; % the size
        durationset=[durationset,duration]; % the duration
        shape{a}=currentset; % the shape
        a=a+1;
        currentset=[];
    end
end

% delete empty avalanches
sizeset(sizeset==0)=[];%
durationset(durationset==0)=[];
temp=cellfun('length',shape);
b=find(temp~=0);
shapeset=cell(length(b),1);
for l=1:length(b)
    shapeset{l}=shape{b(l)};
end


    function Aset=avalancheset(SpikeTrains)
        % get the number of spikes in each bin in the merged train
        
        N_total=size(SpikeTrains,1);
        Aset=zeros(1,ceil(T_length/timebin));
        MergedTrain=[];
        for s=1:N_total % merge
            MergedTrain=[MergedTrain,SpikeTrains{s}];
        end
        MergedTrain=sort(MergedTrain);
        L=1;
        for k=1:length(MergedTrain)
            while MergedTrain(k)>L*timebin
                L=L+1;
            end
            Aset(L)=Aset(L)+1; % T{s}(k) has been counted into the L segment
        end
     
    end
end


