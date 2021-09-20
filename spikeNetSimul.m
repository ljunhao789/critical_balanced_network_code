function outputResults=spikeNetSimul()
% simulate the spiking network

%% get parameters
Paras = getParameters();

% set random seed
rand_state = floor(sum(100*clock)); 
rng(rand_state);

% set plotflag = 1 for simply visualize the results, otherwise 0
plotflag = 1;

%% model parameters setting

N_total = Paras.N_total; % num of neurons
[Refrac_e,Refrac_i] = deal(Paras.Refrac_e,Paras.Refrac_i); % E/I refractory period (ms)

tau_de = Paras.tau_de;  % exc synaptic time (ms)
tau_di = Paras.tau_di;  % inh synaptic time (ms)

% coupling strength
g_eo = Paras.g_eo; g_io = Paras.g_io;
g_ee = Paras.g_ee; g_ie = Paras.g_ie;
g_ei = Paras.g_ei; g_ii = Paras.g_ii;

% coupling strength after network size scaled
g_eo_scaled = g_eo/sqrt(N_total);g_io_scaled = g_io/sqrt(N_total); 
g_ee_scaled = g_ee/sqrt(N_total);g_ie_scaled = g_ie/sqrt(N_total);
g_ei_scaled = g_ei/sqrt(N_total);g_ii_scaled = g_ii/sqrt(N_total);

[Tau_e,Tau_i] = deal(Paras.Tau_e,Paras.Tau_i); % (ms) E/I membrane time const

% (mV) spike threshold ,reset potential,leaky potential and E/I reversal potential
[V_threshold,V_reset,Ve_rest,Vi_rest,Ve_rev,Vi_rev] = ...
    deal(Paras.V_threshold,Paras.V_reset,Paras.Ve_rest,Paras.Vi_rest,Paras.Ve_rev,Paras.Vi_rev);

r0 = Paras.r0; % background input rate (/ms)
r1 = Paras.r1; % stimulus rate (/ms)

tau = Paras.tau; % the \tau parameter in the ERP alpha function
a = Paras.a; % ERP effect parameter


%% technical parameters setting
dt = Paras.dt; % step size (ms)
Record_dt = Paras.Record_dt;  % recording step size (ms)
Recordstep = Record_dt/dt; % to make a record every Recordstep
T_running = Paras.T_running; % the simulation time (ms)
T_onset = Paras.T_onset; % the stimulus onset time (ms)
T_onsetend = Paras.T_onsetend; % the stimulus end time (ms)
t_discard = Paras.t_discard; % the initial period to be discarded to avoid transient effect (ms)

T_length = T_running-t_discard; % the remaining recording length after discarding
timeaxis = Record_dt:Record_dt:T_running;

%% network building up, initial conditions, set auxillary arrays 

[Exc,Inh,pointto] = deal(Paras.Exc,Paras.Inh,Paras.pointto);

% set initial conditions
V = normrnd(-70+15*rand(),5*rand(),[N_total,1]); 
temp = find(V>-50);
V(temp) = -70+20*rand(length(temp),1);

Wait = zeros(N_total,1); % the steps to be waited before refractory end

% some parameter auxillary arrays

VL = ones(N_total,1)*Ve_rest; VL(Inh) = Vi_rest;

WaitingSpike = zeros(N_total,1)*nan; % effective spike time that has not acted
spike_time_spill = zeros(N_total,1); % time of this effective spike to last stepping time
% synaptic conductance by E,I neighbors (the columns are for d,,pre_d)
Synap_E = zeros(N_total,2); Synap_I = zeros(N_total,2); 

switch Paras.noisyinput
    case 1   % noisy input
        gO=ones(N_total,1)*g_eo_scaled/tau_de;  gO(Inh)=g_io_scaled/tau_de;       
        t_spike_out=exprnd(1/r0,N_total,1);  % next external spiking acting time
    case 0   % deterministic input
        gO=ones(N_total,1)*g_eo_scaled;  gO(Inh)=g_io_scaled; 
    otherwise
        error('noise index error');    
end
gE=ones(N_total,1)*g_ee_scaled/tau_de;  gE(Inh)=g_ie_scaled/tau_de;
gI=ones(N_total,1)*g_ei_scaled/tau_di;  gI(Inh)=g_ii_scaled/tau_di; 

Tau=ones(N_total,1)*Tau_e;
Tau(Inh)=Tau_i;
RefracStep=ones(N_total,1)*Refrac_e/dt;
RefracStep(Inh)=Refrac_i/dt;
alpha0=1./Tau;
beta0=VL./Tau;
alpha=zeros(N_total,2);
beta=zeros(N_total,2);
V_last=zeros(N_total,1);
Dte=exp(-dt/tau_de);Dti=exp(-dt/tau_di); % step const

% external input strength in each step
r_in=ones(1,T_running/dt)*r0;
r_in(T_onset/dt+1:T_onsetend/dt)=r0+r1+a*(dt:dt:(T_onsetend-T_onset)).*exp(-(dt:dt:(T_onsetend-T_onset))/tau); 

%% recording arrarys
Train_rec=cell(N_total,1); % spike series for each neuron
Train_Exc=cell(N_total*0.8,1); % the Exc neuron spike trains
Train_Inh=cell(N_total*0.2,1); % the Inh neuron spike trains
Ve_mean=zeros(1,T_running/Record_dt); % <Ve>
Vi_mean=zeros(1,T_running/Record_dt); % <Vi>
V_mean=zeros(1,T_running/Record_dt);  % <V>
EC_rec=zeros(1,T_running/Record_dt);  % <E current received>
IC_rec=zeros(1,T_running/Record_dt);  % <I current received>
Spikenum=zeros(N_total,T_running/Record_dt); % record the spike num of each neuron
kr=1; % recording step

for k=1:T_running/dt
    t=(k-1)*dt; % the current time 
    %% compute the voltage
    Ind_Ref=find(Wait>1);% in refractory
    Wait(Ind_Ref)=Wait(Ind_Ref)-1;

    Ind_Nor=find(Wait==0); % normal steps
    Ind_Lea=find(Wait==1); % leaving refractory
    Ind=union(Ind_Nor,Ind_Lea); % to be computed
    if ~isempty(Ind)
        
        switch Paras.noisyinput
            case 1   % noisy input
                alpha(Ind,1)= alpha0(Ind) +  Synap_E(Ind,1) + Synap_I(Ind,1);
                alpha(Ind,2)= alpha0(Ind) +  Synap_E(Ind,2) + Synap_I(Ind,2);
                beta(Ind,1)= beta0(Ind) + Synap_E(Ind,1)*Ve_rev + Synap_I(Ind,1)*Vi_rev;
                beta(Ind,2)= beta0(Ind) + Synap_E(Ind,2)*Ve_rev + Synap_I(Ind,2)*Vi_rev;
            case 0   % deterministic input
                alpha(Ind,1)= alpha0(Ind) +  Synap_E(Ind,1)+gO(Ind)*r_in(k) + Synap_I(Ind,1);
                alpha(Ind,2)= alpha0(Ind) +  Synap_E(Ind,2)+gO(Ind)*r_in(k) + Synap_I(Ind,2);
                beta(Ind,1)= beta0(Ind) + (Synap_E(Ind,1)+gO(Ind)*r_in(k))*Ve_rev + Synap_I(Ind,1)*Vi_rev;
                beta(Ind,2)= beta0(Ind) + (Synap_E(Ind,2)+gO(Ind)*r_in(k))*Ve_rev + Synap_I(Ind,2)*Vi_rev;
        end
           
        % for neurons in normal step
        K1=-alpha(Ind_Nor,1).*V(Ind_Nor)+beta(Ind_Nor,1);
        K2=-alpha(Ind_Nor,2).*(V(Ind_Nor)+dt*K1)+beta(Ind_Nor,2);
        V_last(Ind_Nor)=V(Ind_Nor);
        V(Ind_Nor)=V(Ind_Nor)+(dt/2)*(K1+K2); % RK2 scheme
        % for neurons leaving refractory
        Wait(Ind_Lea)=Wait(Ind_Lea)-1;
        V_last(Ind_Lea)=(beta(Ind_Lea,1)+beta(Ind_Lea,2)-alpha(Ind_Lea,2).*beta(Ind_Lea,1)*dt-...
            2*V_reset./spike_time_spill(Ind_Lea))./(alpha(Ind_Lea,1)+alpha(Ind_Lea,2)-alpha(Ind_Lea,2).*alpha(Ind_Lea,1)*dt-2./spike_time_spill(Ind_Lea));
        V(Ind_Lea)=dt*V_reset./spike_time_spill(Ind_Lea)+(1-dt./spike_time_spill(Ind_Lea)).*V_last(Ind_Lea); % modified scheme 计下一步   
    end  
    
    switch Paras.noisyinput
        case 1   % noisy input
            E_current=Synap_E(:,1).*(Ve_rev-V);
        case 0   % deterministic input
            E_current=(Synap_E(:,1)+gO*r_in(k)).*(Ve_rev-V); % E current received
    end
    I_current=Synap_I(:,1).*(Vi_rev-V); % I current received
    
    %% renew synaptic conductance 
    Synap_E(:,1)=Synap_E(:,2);
    Synap_I(:,1)=Synap_I(:,2);
    Ind=find(WaitingSpike<=k*dt); %  there is effective spike in ((k-1)dt,kdt]
    if ~isempty(Ind)
        Ind_e=intersect(Ind,Exc); % spike of E neurons
        Ind_i=intersect(Ind,Inh); % spike of I neurons
        for s=Ind_e'
            Ind_renew=pointto{s}; % those s point to  receive the input of s
            Synap_E(Ind_renew,1)=Synap_E(Ind_renew,1)+gE(Ind_renew)*exp(-(dt-spike_time_spill(s))/tau_de);
        end
        for s=Ind_i'
            Ind_renew=pointto{s};
            Synap_I(Ind_renew,1)=Synap_I(Ind_renew,1)+gI(Ind_renew)*exp(-(dt-spike_time_spill(s))/tau_di);
        end
        WaitingSpike(Ind)=nan;
    end
    
    if Paras.noisyinput == 1 % noisy input
        Ind=find(t_spike_out<=k*dt);  % add external spike effect in ((k-1)dt,kdt]
        if ~isempty(Ind)
            Synap_E(Ind,1)=Synap_E(Ind,1)+gO(Ind).*exp(-(k*dt-t_spike_out(Ind))/tau_de);
            t_spike_out(Ind)=t_spike_out(Ind)+exprnd(1/r_in(k),[length(Ind),1]);
        end
    end  
    
    Synap_E(:,2)=Dte*Synap_E(:,1); % pre-estimate current
    Synap_I(:,2)=Dti*Synap_I(:,1);
    
    %% record
    if mod(k,Recordstep)==0
        Ind_rec=find(Wait==0); %  record those not at refractory period
        Ve_mean(kr)=nanmean(V(intersect(Ind_rec,Exc)),1); % record voltage
        Vi_mean(kr)=nanmean(V(intersect(Ind_rec,Inh)),1);
        V_mean(kr)=nanmean(V(Ind_rec),1);
        EC_rec(kr)=nanmean(E_current); % record E,I current received
        IC_rec(kr)=nanmean(I_current);
        kr=kr+1;
    end
    
    %% renew spike
    Ind_Spi=find(V>=V_threshold);        % for spiking neurons 
    if ~isempty(Ind_Spi)
        spike_time_spill(Ind_Spi)=dt*(V_threshold-V_last(Ind_Spi))./(V(Ind_Spi)-V_last(Ind_Spi));% linear interpolation for finding spike time
        for s=Ind_Spi'
            Train_rec{s}=[Train_rec{s},t+spike_time_spill(s)];
        end
        V(Ind_Spi)=V_reset; % reset 
        Wait(Ind_Spi)=RefracStep(Ind_Spi); % enter refractory period
        WaitingSpike(Ind_Spi)=t+spike_time_spill(Ind_Spi); % spikes waiting for count (modified RK2)
    end
    
end % end k

% modify the nan values in <V>
% this happens when all neurons enter the refractory period
% so no neurons will be counted to compute the <V>, then we set
% it to the threshold value ( which is <V> right before the spike)
Ve_mean(isnan(Ve_mean))=-50;
Vi_mean(isnan(Vi_mean))=-50;
V_mean(isnan(V_mean))=-50;

% compute the firing rates
for s=1:N_total
    L=1;
    for k=1:length(Train_rec{s})
        while Train_rec{s}(k)>L*Record_dt
            L=L+1;
        end
        Spikenum(s,L)=Spikenum(s,L)+1; % Train_rec{s}(k) has been counted into the L segment
    end
end
Qe_mean=mean(Spikenum(1:N_total*(4/5),:)); % /ms
Qi_mean=mean(Spikenum(N_total*(4/5)+1:N_total,:)); % /ms

% simple visualization
if plotflag==1
    fig = figure(); clf;
    set(fig, 'Position', [50 50 800 800]);
    subplot(2,1,1); % plot the spike raster plot of neurons
    for s=1:N_total*(4/5)
        plot(Train_rec{s},s*ones(1,length(Train_rec{s})),'b.','MarkerSize',1);hold on;
    end
    for s=N_total*(4/5)+1:N_total
        plot(Train_rec{s},s*ones(1,length(Train_rec{s})),'r.','MarkerSize',1);hold on;
    end
    xlabel('Time(ms)','Fontsize',10);ylabel('Neuron index','Fontsize',10);
    subplot(2,1,2); % plot <Ve>,<Vi> and 
    yyaxis left;
    plot(timeaxis,Ve_mean,'b-','linewidth',1);hold on;
    plot(timeaxis,Vi_mean,'r-','linewidth',1);hold on;
    ylim([-80 -50]);
    ylabel('mean Voltage (mV) ', 'fontsize',16);
    xlabel('time (ms) ', 'fontsize',16);
    set(gca,'Ycolor','b');
    yyaxis right;
    plot(timeaxis,Qe_mean*10^3 ,'b--','linewidth',1);hold on;
    plot(timeaxis,Qi_mean*10^3,'r--','linewidth',1);hold on;
    legend('E Voltage','I Voltage','E rate','I rate');
    ylabel('rate (Hz) ','fontsize',16);
    set(gca,'Ycolor','k');
end


% discard initial period

for s=1:N_total  
    while ~isempty(Train_rec{s})&& Train_rec{s}(1)<t_discard
        Train_rec{s}(1)=[];
    end  
    if ~isempty(Train_rec{s})
        Train_rec{s}=Train_rec{s}-t_discard; % turn back the initial time axis
    end
    if s<=N_total*0.8
        Train_Exc{s}=Train_rec{s};
    else
        Train_Inh{s-N_total*0.8}=Train_rec{s};
    end
end

Qe_mean(1:t_discard/Record_dt)=[]; 
Qi_mean(1:t_discard/Record_dt)=[];
Ve_mean(1:t_discard/Record_dt)=[]; 
Vi_mean(1:t_discard/Record_dt)=[]; 
V_mean(1:t_discard/Record_dt)=[]; 
EC_rec(1:t_discard/Record_dt)=[];
IC_rec(1:t_discard/Record_dt)=[];
timeaxis(1:t_discard/Record_dt)=[];



% numerically estimate the mean-field parameter sigma_e, sigma_i
% this estimation is suitable for network in AS state (i.e. tau_de=tau_di)
% and for a fixed input (i.e. r1=0 )
sigma_e=(V_threshold-mean(Ve_mean))/log(1/mean(Qe_mean)-1)*pi/sqrt(3);
sigma_i=(V_threshold-mean(Vi_mean))/log(1/mean(Qi_mean)-1)*pi/sqrt(3);

% record the output structure
outputResults.SpikeTrains_all = Train_rec;
outputResults.SpikeTrains_E = Train_Exc;
outputResults.SpikeTrains_I = Train_Inh;

outputResults.record_timeaxis = timeaxis;
outputResults.record_length = T_length ; % (ms)
outputResults.Ve = Ve_mean;
outputResults.Vi = Vi_mean;
outputResults.V_all = V_mean;
outputResults.Qe = Qe_mean;
outputResults.Qi = Qi_mean;

outputResults.Ecurrent = EC_rec;
outputResults.Icurrent = IC_rec;
outputResults.sigma_e = sigma_e;
outputResults.sigma_i = sigma_i;


% toc








