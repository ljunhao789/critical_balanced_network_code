% plot the LFP results under differnt definition

fig = figure(); clf;
set(fig, 'Position', [50 50 1000 420]);
fontsize=11;


Xrange=[-400,600];

ha = tight_subplot(3,3,[.04 .04],0.1,0.1) ;

axes(ha(1));
plot(LFP.t_axis-T_onset,V.onetrialsub,'Color','k');hold on;
plot(LFP.t_axis-T_onset,Ve.onetrialsub,'Color','b');hold on;
plot(LFP.t_axis-T_onset,Vi.onetrialsub,'Color','r');hold on;
plot([0,0],[-70,-45],'k--','linewidth',1);
legend('<V>','<V>_E','<V>_I','box','off');
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-66,-53]);
ylabel('LFP (mV)','Fontsize',fontsize);

axes(ha(2));
plot(LFP.t_axis-T_onset,V.onetrialcri,'Color','k');hold on;
plot(LFP.t_axis-T_onset,Ve.onetrialcri,'Color','b');hold on;
plot(LFP.t_axis-T_onset,Vi.onetrialcri,'Color','r');hold on;
plot([0,0],[-70,-45],'k--','linewidth',1)
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-66,-53]);


axes(ha(3));
plot(LFP.t_axis-T_onset,V.onetrialsup,'Color','k');hold on;
plot(LFP.t_axis-T_onset,Ve.onetrialsup,'Color','b');hold on;
plot(LFP.t_axis-T_onset,Vi.onetrialsup,'Color','r');hold on;
plot([0,0],[-70,-45],'k--','linewidth',1)
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-70,-50]);


axes(ha(4));
for i=1:5
    plot(LFP.t_axis-T_onset,LFP.sub(:,trialstosee(i))','Color',allColor(i,:));hold on;
end
plot(LFP.t_axis-T_onset,mean(LFP.sub,2),'k-','linewidth',2);hold on;
plot([0,0],[-70,-45],'k--','linewidth',1)
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-66,-53]);
ylabel('LFP (mV)','Fontsize',fontsize);

axes(ha(5));
for i=1:5
    plot(LFP.t_axis-T_onset,LFP.cri(:,trialstosee(i))','Color',allColor(i,:));hold on;
end
plot(LFP.t_axis-T_onset,mean(LFP.cri,2),'k-','linewidth',2);hold on;
plot([0,0],[-70,-45],'k--','linewidth',1)
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-66,-53]);

axes(ha(6));
for i=1:5
    plot(LFP.t_axis-T_onset,LFP.sup(:,trialstosee(i))','Color',allColor(i,:));hold on;
end
plot(LFP.t_axis-T_onset,mean(LFP.sup,2),'k-','linewidth',2);hold on;
plot([0,0],[-75,-45],'k--','linewidth',1)
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-73,-45]);

axes(ha(7));
plot(Vedata.t_axis-T_onset,smooth(Vedata.VarofVol_sub,30),'k-','LineWidth',2.5);hold on;
plot([0,0],[-1,2],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
line([200,400],[0,0],'LineWidth',2.5,'Color','k');
text(200,-0.2,'200 ms','FontSize',fontsize);
ylabel('Var of LFP','fontsize',fontsize);
xlim(Xrange);ylim([0,1.5]);

axes(ha(8));
plot(Vedata.t_axis-T_onset,smooth(Vedata.VarofVol_cri,30),'k-','LineWidth',2.5);hold on;
plot([0,0],[0,4],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
line([200,400],[0,0],'LineWidth',2.5,'Color','k');
text(200,-0.5,'200 ms','FontSize',fontsize);
xlim(Xrange);ylim([0,4]);

axes(ha(9));
plot(Vedata.t_axis-T_onset,smooth(Vedata.VarofVol_sup,30),'k-','LineWidth',2.5);hold on;
plot([0,0],[0,40],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
line([200,400],[20,20],'LineWidth',2.5,'Color','k');
text(200,18,'200 ms','FontSize',fontsize);
xlim(Xrange);ylim([20,40]);


