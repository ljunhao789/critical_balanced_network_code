function Correlations=Cor_afterfilter(SpikeTrains,T_length,windowSize)
% compute the Pearson correlations of neuron pairs,
% neurons are with spike trains SpikeTrains, 
% computation after filtered by a square window with size windowSize
% T_length is the recoding time length of the trains

Dt=1; % window for constructing spike count
N_total=size(SpikeTrains,1);
S_total=ceil(T_length/Dt); %
Spikenum=zeros(N_total,S_total);
for s=1:N_total
    L=1;
    for k=1:length(SpikeTrains{s})
        while SpikeTrains{s}(k)>L*Dt
            L=L+1;
        end
        Spikenum(s,L)=Spikenum(s,L)+1; % T{s}(k) has been counted into the L segment
    end
end

totalspike_eachneuron=sum(Spikenum,2);
deleteid=totalspike_eachneuron<5; 
Spikenum(deleteid,:)=[]; % delete too few spike neurons

% filter by a square window
b = (1/windowSize)*ones(1,windowSize);a = 1;
Spikenum_filtered = filter(b,a,Spikenum);

% compute the correlations of neuron pairs 
N=size(Spikenum_filtered,1);
Ecor_temp=corrcoef(Spikenum_filtered');
Correlations=[];
for k=1:N-1
    Correlations=[Correlations,Ecor_temp(k,k+1:N)];
end






