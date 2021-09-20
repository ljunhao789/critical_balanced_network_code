% plot the mean firing rate and FF versus time


fig = figure(); clf;
set(fig, 'Position', [50 50 1000 280]);
fontsize=11;

Xrange=[-400,600];

ha = tight_subplot(2,3,[.04 .04],0.1,0.1) ;

axes(ha(1));
plot(FFdata.t_axis-T_onset,smooth(FFdata.Meanrate.sub,3),'k-','LineWidth',3);hold on;
plot([0,0],[10,30],'k--','linewidth',1);
xlim(Xrange);ylim([10,25]);
ylabel('rate (Hz)','Fontsize',fontsize);
set(gca,'XColor','white');box off; 


axes(ha(4));
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF.sub,3),'k-','LineWidth',3);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF.sub,3)+smooth(FFdata.FFstd.sub,5),'k-','LineWidth',1);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF.sub,3)-smooth(FFdata.FFstd.sub,5),'k-','LineWidth',1);hold on;
plot([0,0],[1,2],'k--','linewidth',1);
xlim(Xrange);ylim([1,1.9]);
ylabel('FF','Fontsize',fontsize);
set(gca,'XColor','white');box off; 
line([200,400],[1,1],'LineWidth',2.5,'Color','k');
text(200,0.9,'200 ms','FontSize',fontsize);


axes(ha(2));
plot(FFdata.t_axis-T_onset,smooth(FFdata.Meanrate.cri,5),'k-','LineWidth',3);hold on;
plot([0,0],[10,25],'k--','linewidth',1)
xlim(Xrange);ylim([10,22]);
set(gca,'XColor','white');box off; 

axes(ha(5));
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF.cri,5),'k-','LineWidth',3);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF.cri,5)+smooth(FFdata.FFstd.cri,5),'k-','LineWidth',1);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF.cri,5)-smooth(FFdata.FFstd.cri,5),'k-','LineWidth',1);hold on;
plot([0,0],[1,4],'k--','linewidth',1)
xlim(Xrange);ylim([1.2,3.5]);
set(gca,'XColor','white');box off; 
line([200,400],[1.2,1.2],'LineWidth',2.5,'Color','k');
text(200,0.95,'200 ms','FontSize',fontsize);

axes(ha(3));
plot(FFdata.t_axis-T_onset,smooth(FFdata.Meanrate.sup,3),'k-','LineWidth',3);hold on;
plot([0,0],[50,75],'k--','linewidth',1)
xlim(Xrange);ylim([50,70]);
set(gca,'XColor','white');box off; 

axes(ha(6));
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF.sup,3),'k-','LineWidth',3);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF.sup,3)+smooth(FFdata.FFstd.sub,5),'k-','LineWidth',1);hold on;
plot(FFdata.t_axis-T_onset,smooth(FFdata.FF.sup,3)-smooth(FFdata.FFstd.sub,5),'k-','LineWidth',1);hold on;
plot([0,0],[-0.5,1.5],'k--','linewidth',1)
xlim(Xrange);ylim([-0.1,1.4]);
set(gca,'XColor','white');box off; 
line([200,400],[-0.1,-0.1],'LineWidth',2.5,'Color','k');
text(200,-0.25,'200 ms','FontSize',fontsize);




