function [t_axis,FF,FF_std,Meanrate,preFF,postFF]=rawFF(SpikeTrainsacrossTrials,FFParams)
% compute the trial-to-trial Fano factor 
% SpikeTrainsacrossTrials records the spike trains of the neurons in
% different trials
% such that
% SpikeTrainsacrossTrials{s,j} is the spike train of neuron s in trial j

% FFParams specifies some paramters in computing FF: e.g.
% FFParams.boxWidth = 100; % the sliding window length for computing spike
% FFParams.movingstep = 50; % the moving step length of the window
% FFParams.groupingnum = 5; % the number of neuron grouped
% FFParams.samplenum=200; % sample number of neuron groups in computing FF

N_total=size(SpikeTrainsacrossTrials,1);% number of neurons recorded
trialnum=size(SpikeTrainsacrossTrials,2);
T_length=2000; % the initial recording time is  ms, stimulus onset at  ms
windowSize=FFParams.boxWidth; % grouping for every xx ms
movingStep=FFParams.movingstep;
neuronnumber=FFParams.groupingnum;
windomNum=floor((T_length-windowSize)/movingStep+1);
T_onset=1000; % stimulus onset time

% get the time axis
t_axis=(0:windomNum-1)*movingStep + windowSize/2 - T_onset; % mid point

samplenum=FFParams.samplenum;

FF_all=zeros(windomNum,samplenum);
Rate_all=zeros(windomNum,samplenum);

for j=1:samplenum % for each sample group
    temp=randperm(N_total);
    grouptocompute=temp(1:neuronnumber); % sample a group of neuron used to compute
    gsm=groupedspikemat(SpikeTrainsacrossTrials,grouptocompute);% gsm is the spikenumbers of this group in each time window, each column is a trial
    FF=var(gsm,1,2)./mean(gsm,2); % trial-average FF of this group in each grouping periods
%     FF(isnan(FF))=1; % for those windows without spikes
    FF_all(:,j)=FF;
    Rate_all(:,j)=mean(gsm,2)/windowSize; % record the firing rate of this neuron group
end

% the mean FF of different groups
FF=mean(FF_all,2); 
% the std of FF between different groups
FF_std=std(FF_all,1,2);
% the mean of firing rate of different groups
Meanrate=mean(Rate_all,2)*10^3;

% the pre and post-stimulus FF
preFF=FF_all( floor((450-windowSize/2)/movingStep+1) : floor((950-windowSize/2)/movingStep+1) ,  :);
postFF=FF_all( floor((1050-windowSize/2)/movingStep+1): floor((1550-windowSize/2)/movingStep+1), : ) ;
preFF=reshape(preFF,1,size(preFF,1)*size(preFF,2));postFF=reshape(postFF,1,size(postFF,1)*size(postFF,2));

%
% fig=figure();
% set(fig,'position',[60,60,300,500]);
% 
% subplot 211
% plot(t_axis,smooth(Meanrate,5),'k-','LineWidth',3);hold on;
% xlim([-400,600]);
% xlabel('time (ms)');ylabel('rate (Hz)');
% subplot 212
% plot(t_axis,smooth(FF,5),'k-','LineWidth',3);hold on;
% plot(t_axis,smooth(FF,5)+smooth(FF_std,5),'k-','LineWidth',1);hold on;
% plot(t_axis,smooth(FF,5)-smooth(FF_std,5),'k-','LineWidth',1);hold on;
% xlim([-400,600]);
% xlabel('time (ms)');ylabel('FF');




    function gsm=groupedspikemat(SpikeTrainsacrossTrials,grouptocompute)
        % grouptocompute is the neuronal indexs to compute
        % every column of gsm is the spikenumbers of this group in each periods for each trial
        
        gsm_per1ms=zeros(T_length,trialnum); % first compute the spike in every ms
        groupsize=length(grouptocompute); % number of neurons to compute
        for m=1:trialnum
            Spikenum=zeros(groupsize,T_length); % record the spike in this group
            for s=1:groupsize
                L=1;
                for k=1:length(SpikeTrainsacrossTrials{grouptocompute(s),m})
                    while SpikeTrainsacrossTrials{grouptocompute(s),m}(k)>L*1
                        L=L+1;
                    end
                    Spikenum(s,L)=Spikenum(s,L)+1; % T{s}(k) has been counted into the L segment
                end
            end
            gsm_per1ms(:,m)=sum(Spikenum,1)';
        end
        gsm=zeros(windomNum,trialnum);
        for k=1:windomNum
            gsm(k,:)= sum(gsm_per1ms( (k-1)*movingStep +1 : (k-1)*movingStep+windowSize ,:),1);
        end
    end

end
