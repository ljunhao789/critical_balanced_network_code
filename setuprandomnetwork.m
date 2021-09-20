function [Exc,Inh,pointto]=setuprandomnetwork(N_total,p)
% establish random network with probability p and N_total nodes 
% the number of exc and inh neurons, E:I = 4:1
% Here, the 'Exc','Inh' are indices of E, I neurons respectively
% 'pointto' is a cell array such that pointto{s} is the indices of neurons
% that the neuron s projecting to

% we specify Number 1~ N_total*(4/5) are Exc neurons
Exc=(1:N_total*(4/5))'; % the index of Exc neurons

% Number > N_total*(4/5) are Inh neurons
Inh=(N_total*(4/5)+1:N_total)'; % the index of Inh neurons

pointto=cell(N_total,1); 
for s=1:N_total 
    for v=1:N_total
        if v==s
            continue;
        end
        if rand()<p % build a link with probability p
            pointto{s}=[pointto{s};v];
        end
    end
end

    