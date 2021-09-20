% plot the FF by grouping different number of neurons


fig = figure(); clf;
set(fig, 'Position', [50 50 1000 210]);
fontsize=11;

Xrange=[-400,600];

ha = tight_subplot(1,3,[.04 .04],0.2,0.1) ;

axes(ha(1));
for k=1:5
    plot(FF.t_axis'-T_onset,smooth(FF.sub(:,k),5),'LineWidth',3);hold on;
end
plot([0,0],[0,15],'k--','linewidth',1);hold on;
line([200,400],[1.2,1.2],'LineWidth',2.5,'Color','k');
text(200,1.12,'200 ms','FontSize',fontsize);
xlabel('time (ms)','fontsize',fontsize);
ylabel('FF','fontsize',fontsize);
xlim(Xrange);ylim([1.2,2]);
title('Subcritical','Fontsize',fontsize);
set(gca,'XColor','white');box off; 

axes(ha(2));
for k=1:5
    plot(FF.t_axis'-T_onset,smooth(FF.cri(:,k),5),'LineWidth',3);hold on;
end
plot([0,0],[0,100],'k--','linewidth',1);hold on;
line([200,400],[0,0],'LineWidth',2.5,'Color','k');
text(200,-2.3,'200 ms','FontSize',fontsize);
xlabel('time (ms)','fontsize',fontsize);
xlim(Xrange);ylim([0,22]);
h=legend('10 neurons','15','20','30','50','box','off');
set(h,'fontsize',10);
title('Critical','Fontsize',fontsize);
set(gca,'XColor','white');box off; 

axes(ha(3));
for k=1:5
    plot(FF.t_axis'-T_onset,smooth(FF.sup(:,k),5),'LineWidth',3);hold on;
end
plot([0,0],[0,20],'k--','linewidth',1);hold on;
line([200,400],[0,0],'LineWidth',2.5,'Color','k');
text(200,-1,'200 ms','FontSize',fontsize);
xlabel('time (ms)','fontsize',fontsize);
xlim(Xrange);ylim([0,10]);
title('Supercritical','Fontsize',fontsize);
set(gca,'XColor','white');box off; 