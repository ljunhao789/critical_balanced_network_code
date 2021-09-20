function [tau,Auto_pop]=autoCor_population(SpikeTrains,T_length)
% compute the population autocorrelation function Auto_pop(tau)
% of neurons with spike trains SpikeTrains, 
% T_length is the recoding time length of the trains

Dt=1; % window for constructing spike count
N_total=size(SpikeTrains,1);
Spikenum=zeros(N_total,T_length); % per Dt -ms
for s=1:N_total
    L=1;
    for k=1:length(SpikeTrains{s})
        while SpikeTrains{s}(k)>L*Dt
            L=L+1;
        end
        Spikenum(s,L)=Spikenum(s,L)+1; % T{s}(k) has been counted into the L segment
    end
end

% population autocorrelation
PopAct=sum(Spikenum,1);
n0=mean(PopAct);
tau=0:100; % delays 
Auto_pop=tau;
for m=1:length(tau)
    Auto_pop(m)=0;
    for t=1:T_length-tau(m)
        Auto_pop(m)=Auto_pop(m)+(PopAct(t+tau(m))-n0)*(PopAct(t)-n0);
    end
    Auto_pop(m)=Auto_pop(m)/(n0^2*(T_length-tau(m)));
end







