% plot the comparison for trials perserving criticality or not

fig=figure();
set(fig, 'Position', [50 50 900 180]);
fontsize=11;
Xrange=[-400,600];
neuronNum=300;

subplot 131
for s=1:neuronNum
    plot(SpikeTrains.example1{s}-T_onset,s*ones(1,length(SpikeTrains.example1{s})),'.',...
        'Color','b','MarkerSize',3);hold on;
    plot(SpikeTrains.example2{s}-T_onset,(s+400)*ones(1,length(SpikeTrains.example2{s})),'.',...
        'Color','r','MarkerSize',3);hold on;
end
plot([0,0],[-50,750],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
line([200,400],[-50,-50],'LineWidth',2.5,'Color','k');
text(200,-110,'200 ms','FontSize',fontsize);
set(gca,'yticklabel',[]);
ylim([-50,750]);
xlim(Xrange);


subplot 132
plot(Vedata.t_axis-T_onset,smooth(Vedata.VarofVol_perserveCritrials,30),'k-','LineWidth',2.5);hold on;
plot([0,0],[0,4],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
ylabel('Var of LFP','fontsize',fontsize);
line([200,400],[0.6,0.6],'LineWidth',2.5,'Color','k');
text(200,0.4,'200 ms','FontSize',fontsize);
xlim(Xrange);ylim([0.5,3]);

subplot 133
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF_perserveCritrials,3),'k-','LineWidth',3);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF_perserveCritrials,3)+smooth(FFdata.FF_std_perserveCritrials,5),'k-','LineWidth',1);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF_perserveCritrials,3)-smooth(FFdata.FF_std_perserveCritrials,5),'k-','LineWidth',1);hold on;
plot([0,0],[0,4],'k--','linewidth',1);
xlim(Xrange);ylim([0.8,2.7]);
ylabel('FF','Fontsize',fontsize);
set(gca,'XColor','white');box off; 
line([200,400],[0.85,0.85],'LineWidth',2.5,'Color','k');
text(200,0.7,'200 ms','FontSize',fontsize);


