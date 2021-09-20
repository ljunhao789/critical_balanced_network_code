% plot noisy model TTV

fig = figure(); clf;
set(fig, 'Position', [50 50 350 280]);
fontsize=11;

Xrange=[-400,600];
trialstosee=[1,2,6,12,16];

ha = tight_subplot(2,1,[.04 .04],0.1,0.15) ;

axes(ha(1));
for i=1:5
    plot(LFP.t_axis-T_onset,LFP.noisemodel(:,trialstosee(i))','Color',allColor(i,:));hold on;
end
plot(LFP.t_axis-T_onset,mean(LFP.noisemodel,2),'k-','linewidth',2);hold on;
plot([0,0],[-70,-45],'k--','linewidth',1)
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-66,-53]);
ylabel('LFP (mV)','Fontsize',fontsize);

axes(ha(2));
plot(Vedata.t_axis-T_onset,smooth(Vedata.VarofVol_noisemodel,30),'k-','LineWidth',2.5);hold on;
plot([0,0],[-1,2],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
line([200,400],[0,0],'LineWidth',2.5,'Color','k');
text(200,-0.2,'200 ms','FontSize',fontsize);
ylabel('Var of LFP','fontsize',fontsize);
xlim(Xrange);ylim([0,1.5]);

fig = figure(); clf;
set(fig, 'Position', [50 50 350 150]);

ha = tight_subplot(1,1,[.04 .04],0.1,0.15) ;
axes(ha(1));

see5trials(SpikeTrains.noisemodel,trialstosee,allColor);
xlim(Xrange);
set(gca,'yticklabel',[]);
ylabel('Trials','Fontsize',fontsize);
set(gca,'XColor','white');box off; 


fig = figure(); clf;
set(fig, 'Position', [50 50 350 280]);

ha = tight_subplot(2,1,[.04 .04],0.1,0.15) ;

axes(ha(1));
plot(FFdata.t_axis-T_onset,smooth(FFdata.Meanrate_noisemodel,3),'k-','LineWidth',3);hold on;
plot([0,0],[10,30],'k--','linewidth',1);
xlim(Xrange);ylim([10,25]);
ylabel('rate (Hz)','Fontsize',fontsize);
set(gca,'XColor','white');box off; 

axes(ha(2));
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF_noisemodel,3),'k-','LineWidth',3);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF_noisemodel,3)+smooth(FFdata.FF_std_noisemodel,5),'k-','LineWidth',1);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF_noisemodel,3)-smooth(FFdata.FF_std_noisemodel,5),'k-','LineWidth',1);hold on;
plot([0,0],[1,3],'k--','linewidth',1);
xlim(Xrange);ylim([0.9,2.8]);
ylabel('FF','Fontsize',fontsize);
set(gca,'XColor','white');box off; 
line([200,400],[1,1],'LineWidth',2.5,'Color','k');
text(200,0.85,'200 ms','FontSize',fontsize);


fig = figure(); clf;
set(fig, 'Position', [50 50 150 80]);
fontsize=9;


boxplot([FFdata.preFF_noisemodel',FFdata.postFF_noisemodel'],'Labels',{'Pre','Post'});
box off;
ylabel('FF','fontsize',fontsize);ylim([0.7,3.5]);
set(gca,'fontsize',fontsize);








