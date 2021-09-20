function Paras=getParameters()
% get the parameters of the model

%% network parameters
Paras.N_total = 2500; % num of neurons
Paras.p = 0.2; % connection probability

% set up a new network by function setuprandomnetwork.m
[Exc,Inh,pointto]=...
setuprandomnetwork(Paras.N_total,Paras.p);

% or load network from data if a particular network has to be used
% e.g. in computing the TTV results
% load('networkW.mat');

Paras.Exc = Exc; % indices of E neurons
Paras.Inh = Inh; % indices of I neurons
Paras.pointto = pointto; % the projection list of each neuron


%% neural dynamic parameters
Paras.tau_de = 4; % exc synaptic time (ms)
Paras.tau_di = 8; % inh synaptic time (ms)

Paras.Refrac_e = 2; % exc refractory period (ms)
Paras.Refrac_i = 1; % inh refractory period (ms)

% o->e / o->i / e->e / i->e / e->i / i->i synaptic weights 
% before size scaled
Paras.g_eo=2.5;Paras.g_io=4;
Paras.g_ee=2;Paras.g_ie=4;
Paras.g_ei=27;Paras.g_ii=48;

Paras.Tau_e = 20; %  E membrane time const (ms)
Paras.Tau_i = 10; %  I membrane time const (ms)

Paras.V_threshold = -50; % spike threshold (mV) 
Paras.V_reset = -60; % reset potential (mV) 
Paras.Ve_rest = -70; % E leaky potential (mV)
Paras.Vi_rest = -70; % I leaky potential (mV)
Paras.Ve_rev = 0; % E reversal potential (mV)
Paras.Vi_rev = -70; % I reversal potential (mV)

%% input parameters

% set Paras.noisyinput = 1 if applying noisy (Poisson) input,
% set Paras.noisyinput = 0 if applying deterministic (constant) input,
Paras.noisyinput = 1 ; 
% Paras.noisyinput = 0 ; 

Paras.r0 = 0.6; % background input rate (/ms)
Paras.r1 = 0.3; % stimulus rate (/ms)

Paras.tau=20; % the \tau parameter in the ERP alpha function

% set a=r1 if one wants to induce ERP effect, otherwise set a=0
Paras.a = 0;
% Paras.a = Paras.r1;


%% simulation parameters
Paras.dt = 0.05; % simulation step size (ms)
Paras.Record_dt = 1;  % recording step size (ms)
Paras.T_running = 1*10^3; % the simulation time (ms)
Paras.T_onset = 500; % the stimulus onset time (ms)
Paras.T_onsetend = Paras.T_running; % the stimulus end time (ms)

Paras.t_discard = 100; % the initial period to be discarded to avoid transient effect (ms)

%% mean-field parameters

Paras.beta = 0.2; % noise strength in the field equation

% effective Vol std parameters
Paras.sigma_e = 3.2;
Paras.sigma_i = 3.8;



