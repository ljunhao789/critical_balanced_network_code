% plot the LFPs

fig = figure(); clf;
set(fig, 'Position', [50 50 1000 280]);
fontsize=11;

Xrange=[-400,600];

ha = tight_subplot(2,3,[.04 .04],0.1,0.1) ;

axes(ha(1));
for i=1:5
    plot(LFP.Ve.t_axis-T_onset,LFP.Ve.sub(:,trialstosee(i))','Color',allColor(i,:));hold on;
end
plot(LFP.Ve.t_axis-T_onset,mean(LFP.Ve.sub,2),'k-','linewidth',2);hold on;
plot([0,0],[-70,-45],'k--','linewidth',1)
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-66,-53]);
ylabel('LFP (mV)','Fontsize',fontsize);

axes(ha(2));
for i=1:5
    plot(LFP.Ve.t_axis-T_onset,LFP.Ve.cri(:,trialstosee(i))','Color',allColor(i,:));hold on;
end
plot(LFP.Ve.t_axis-T_onset,mean(LFP.Ve.cri,2),'k-','linewidth',2);hold on;
plot([0,0],[-70,-45],'k--','linewidth',1)
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-66,-53]);


axes(ha(3));
for i=1:5
    plot(LFP.Ve.t_axis-T_onset,LFP.Ve.sup(:,trialstosee(i))','Color',allColor(i,:));hold on;
end
plot(LFP.Ve.t_axis-T_onset,mean(LFP.Ve.sup,2),'k-','linewidth',2);hold on;
plot([0,0],[-75,-45],'k--','linewidth',1)
set(gca,'XColor','white');box off; 
xlim(Xrange);
ylim([-73,-45]);


axes(ha(4));
plot(LFP.Var.t_axis-T_onset,smooth(LFP.Var.sub,30),'k-','LineWidth',2.5);hold on;
plot([0,0],[-1,2],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
line([200,400],[0,0],'LineWidth',2.5,'Color','k');
text(200,-0.2,'200 ms','FontSize',fontsize);
ylabel('Var of LFP','fontsize',fontsize);
xlim(Xrange);ylim([0,1.5]);

axes(ha(5));
plot(LFP.Var.t_axis-T_onset,smooth(LFP.Var.cri,30),'k-','LineWidth',2.5);hold on;
plot([0,0],[0,4],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
line([200,400],[0,0],'LineWidth',2.5,'Color','k');
text(200,-0.5,'200 ms','FontSize',fontsize);
xlim(Xrange);ylim([0,4]);

axes(ha(6));
plot(LFP.Var.t_axis-T_onset,smooth(LFP.Var.sup,30),'k-','LineWidth',2.5);hold on;
plot([0,0],[0,40],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
line([200,400],[20,20],'LineWidth',2.5,'Color','k');
text(200,18,'200 ms','FontSize',fontsize);
xlim(Xrange);ylim([20,40]);


