function MFResults=meanfieldPrediction()
% construct the mean-field equation and solve its equilibrium 
% estimate the stability and the linear noise approximation

%% get parameters
Paras = getParameters();

%% model parameters setting
beta = Paras.beta; % noise strength in the field equation
p = Paras.p; % connection probability

% effective Vol std parameters
sigma_e = Paras.sigma_e;
sigma_i = Paras.sigma_i;

% input strength
r_in = Paras.r0;

tau_de = Paras.tau_de;  % exc synaptic time (ms)
tau_di = Paras.tau_di;  % inh synaptic time (ms)

N_total = Paras.N_total; % num of neurons

[Tau_e,Tau_i] = deal(Paras.Tau_e,Paras.Tau_i); % (ms) E/I membrane time const

% (mV) spike threshold ,reset potential,leaky potential and E/I reversal potential
[V_threshold,Ve_rest,Vi_rest,Ve_rev,Vi_rev] = ...
    deal(Paras.V_threshold,Paras.Ve_rest,Paras.Vi_rest,Paras.Ve_rev,Paras.Vi_rev);


% coupling strength
g_eo = Paras.g_eo; g_io = Paras.g_io;
g_ee = Paras.g_ee; g_ie = Paras.g_ie;
g_ei = Paras.g_ei; g_ii = Paras.g_ii;

% coupling strength after network size scaled
g_eo_scaled = g_eo/sqrt(N_total);g_io_scaled = g_io/sqrt(N_total); 
g_ee_scaled = g_ee/sqrt(N_total);g_ie_scaled = g_ie/sqrt(N_total);
g_ei_scaled = g_ei/sqrt(N_total);g_ii_scaled = g_ii/sqrt(N_total);

% number of E,I neurons
[ne,ni]=deal(N_total*0.8*p,N_total*0.2*p);

% find the equilibrium
[Ve_all,Vi_all,Qe_all,Qi_all] = findroots();
rootnum=length(Ve_all);
if rootnum>1
    warning('multiple solution found');
end
% in general, there is only one solution can be found 
% however, in some extreme parameters range, it's possible to find
% unrealistic solution above V_threshold
o=1;
Ve=Ve_all(o);Vi=Vi_all(o);
Qe=Qe_all(o);Qi=Qi_all(o);% (/ms)

% some auxiliary parameter
Ee=exp((V_threshold-Ve)/(sigma_e*sqrt(3)/pi));
Ei=exp((V_threshold-Vi)/(sigma_i*sqrt(3)/pi));
Qep=Ee/(sigma_e*sqrt(3)/pi*(1+Ee)^2);
Qip=Ei/(sigma_i*sqrt(3)/pi*(1+Ei)^2);

% construct the Jacobian matrix
J=zeros(4,4);
J(1,1)=-1/Tau_e-(g_ee_scaled*ne*Qe+g_eo_scaled*r_in+g_ei_scaled*ni*Qi);
J(1,3)=g_ee_scaled*(Ve_rev-Ve);
J(1,4)=g_ei_scaled*(Vi_rev-Ve);
J(2,2)=-1/Tau_i-(g_ie_scaled*ne*Qe+g_io_scaled*r_in+g_ii_scaled*ni*Qi);
J(2,3)=g_ie_scaled*(Ve_rev-Vi);
J(2,4)=g_ii_scaled*(Vi_rev-Vi);
J(3,1)=ne/tau_de*Qep;
J(4,2)=ni/tau_di*Qip;
J(3,3)=-1/tau_de;
J(4,4)=-1/tau_di;

Evs=eig(J);
[~,n]=max(real(Evs));
dominantEig=Evs(n); % return the real and imag part of the dominant eigenvalue

B=zeros(4); % noise matrix
B(1,1)=beta;
B(2,2)=beta;

% solve the lyapunov equation
Covm=lyap(J,B);

VarE=Covm(1,1); % variance of Ve


% record the output structure
MFResults.Ve_steady  = Ve ;
MFResults.Qe_steady  = Qe ; % (/ms)
MFResults.dominantEig = dominantEig;
MFResults.VarE = VarE;




function [Ve,Vi,Qe,Qi] = findroots()
% Find steady states
n_roots = 0;
Nsearch = 8000; Nsearch_max = 8*128000; % if no roots found, keep increasing search density until Nsearch_max reached
while ((n_roots == 0 || n_roots == 2) && Nsearch <= Nsearch_max) % NB: We treat zero roots or 2 roots as error condition (expect 1 or 3 roots)
    Qe_1 = linspace(0, 1, Nsearch)';
    err_Qe = Qe_resid(Qe_1);
    chs_Qe = err_Qe(1:end-1) .* err_Qe(2:end); % Count the no. of Qe roots (look for sign-change in residuals)
    chs_Qe_index = find(chs_Qe < 0); % the left one's index of sign-changing
    n_roots = length(chs_Qe_index);
    if (n_roots == 0 || n_roots == 2)
        Nsearch = 2*Nsearch;
    end
end
if n_roots >= 1 % Form a bracketting interval for each root, each row is an interval
    brack_Qe = [Qe_1(chs_Qe_index)  Qe_1(chs_Qe_index + 1)]; % Qe_1 is column
else
%     error('failed to find a root');
[Ve,Vi,Qe,Qi]=deal(0);
return
end
[Qe,Qi,Ve,Vi] = deal(ones(n_roots, 1)); % find each roots
for j = 1: n_roots
    fun = @ (Qe_1) Qe_resid(Qe_1);
    Qe(j) = fzero(fun, brack_Qe(j,:));
    Ve(j) = invQsige(Qe(j));
    Qi(j) = EqA(Qe(j), Ve(j));
    Vi(j) = invQsigi(Qi(j));
end


%------------------------------------------------------------------------
    function err_Qe = Qe_resid(Qe_1)     % error residual in Qe
        Ve_1 = invQsige(Qe_1); % Qe -> Ve
        Qi_2 = EqA(Qe_1, Ve_1); % Qe Ve -> Qi
        Vi_2 = invQsigi(Qi_2); % Qi -> Vi
        Qe_3 = EqB(Qi_2, Vi_2); % Qi Vi -> Qe
        err_Qe = Qe_3 - Qe_1;
    end
%------------------------------------------------------------------------
    function Qi = EqA(Qe, Ve) % Given Qe_1 and Ve_1, to compute Qi
        Qi = ((Ve_rest-Ve)/Tau_e+(Ve_rev-Ve).*(g_eo_scaled*r_in+g_ee_scaled*ne*Qe))./((Ve-Vi_rev)*g_ei_scaled*ni);
        Qi(Qi < 0 | Qi > 1) = NaN;
    end
%------------------------------------------------------------------------
    function Qe = EqB(Qi, Vi)   % Given Qi_2 and Vi_2,to compute Qe
        Qe = (((Vi_rest-Vi)/Tau_i+(Vi_rev-Vi).*(g_ii_scaled*ni*Qi))./(Vi-Ve_rev)-g_io_scaled*r_in)/(g_ie_scaled*ne);
        Qe(Qe < 0 | Qe > 1) = NaN;
    end
%------------------------------------------------------------------------
    function  invsig = invQsige(val)  % Inverse of excitatory sigmoid function; output in millivolts
        invsig = NaN*ones(size(val));
        ok = find(val > 0 & val < 1);
        invsig(ok) = V_threshold - log(1./val(ok) - 1)* sigma_e*sqrt(3)/pi;
    end
%------------------------------------------------------------------------
    function  invsig = invQsigi(val) % Inverse of inhibitory sigmoid function
        invsig = NaN*ones(size(val));
        ok = find(val > 0 & val < 1);
        invsig(ok) = V_threshold - log(1./val(ok) - 1)* sigma_i*sqrt(3)/pi;
    end

end








end