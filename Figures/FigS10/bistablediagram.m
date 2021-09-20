% plot the diagram for the bistable dynamics

fig=figure();
set(fig, 'Position', [50 50 800 300]);
fontsize=11;
fontsize2=10;
fs=25;

subplot 121
patch([7.5 8.5 8.5 7.5],[0.5 0.5 3.5 3.5],'c','FaceAlpha',0.2,'Edgecolor','none');hold on;

plot(tau_di.lowinput(1:Bp(1)),states(1:Bp(1)),'-','linewidth',2.5,'Color',CL.AS);hold on;
plot(tau_di.lowinput(Bp(1):Bp(2)),states(Bp(1):Bp(2)),'-','linewidth',2.5,'Color',CL.Cri);hold on;
plot(tau_di.lowinput(Bp(2):Bp(3)),states(Bp(2):Bp(3)),'-','linewidth',2.5,'Color',CL.SS);hold on;

plot(tau_di.lowinput(Bp(3):Bp(4)),states(Bp(3):Bp(4)),'k--','linewidth',1.5);hold on;
plot(tau_di.lowinput(Bp(4):end),states(Bp(4):end),'-','linewidth',2.5,'Color',CL.P);hold on;

scatter(7.5,1,fs,'MarkerFaceColor','k','MarkerEdgeColor','k');hold on;
scatter(9.4,1.5,fs,'MarkerFaceColor','k','MarkerEdgeColor','k');hold on;
scatter(6.2,2.5,fs,'MarkerFaceColor','k','MarkerEdgeColor','k');hold on;

text(4.5,2.5,'tau_d^{I*}','fontsize',fontsize2);
text(10,1.5,'tau_d^{I**}','fontsize',fontsize2);
text(6,1.3,'tau_d^{IH}','fontsize',fontsize2);
text(7,3.2,'spontaneous','fontsize',fontsize2);

text(4.5,0.85,'AS','fontsize',fontsize);
text(12,2.8,'P','fontsize',fontsize);
text(9,0.75,'SS','fontsize',fontsize);
text(7.5,0.7,'Cri','fontsize',fontsize);

box off;
xlim([4,14]);ylim([0.5,3.5]);
xlabel('tau_d^I (ms)','fontsize',fontsize);
ylabel('dynamic state','fontsize',fontsize);
set(gca,'yticklabel',[]);
title('r_{in}=0.55 /ms','fontsize',fontsize);

subplot 122
patch([7.5 8.5 8.5 7.5],[0.5 0.5 3.5 3.5],'c','FaceAlpha',0.2,'Edgecolor','none');hold on;

plot(tau_di.highinput(1:Bp(1)),states(1:Bp(1)),'-','linewidth',2.5,'Color',CL.AS);hold on;
plot(tau_di.highinput(Bp(1):Bp(2)),states(Bp(1):Bp(2)),'-','linewidth',2.5,'Color',CL.Cri);hold on;
plot(tau_di.highinput(Bp(2):Bp(3)),states(Bp(2):Bp(3)),'-','linewidth',2.5,'Color',CL.SS);hold on;
plot(tau_di.highinput(Bp(3):Bp(4)),states(Bp(3):Bp(4)),'k--','linewidth',1.5);hold on;
plot(tau_di.highinput(Bp(4):end),states(Bp(4):end),'-','linewidth',2.5,'Color',CL.P);hold on;

scatter(7.9,1,fs,'MarkerFaceColor','k','MarkerEdgeColor','k');hold on;
scatter(11.8,1.5,fs,'MarkerFaceColor','k','MarkerEdgeColor','k');hold on;
scatter(10.7,2.5,fs,'MarkerFaceColor','k','MarkerEdgeColor','k');hold on;

text(9,2.5,'tau_d^{I*}','fontsize',fontsize2);
text(12.3,1.5,'tau_d^{I**}','fontsize',fontsize2);
text(6.3,1.3,'tau_d^{IH}','fontsize',fontsize2);
text(7.2,3.2,'evoked','fontsize',fontsize2);

text(4.5,0.9,'AS','fontsize',fontsize);
text(13,2.75,'P','fontsize',fontsize);
text(10.8,0.7,'SS','fontsize',fontsize);
text(7.8,0.7,'Cri','fontsize',fontsize);

box off;
xlim([4,14]);ylim([0.5,3.5]);
xlabel('tau_d^I (ms)','fontsize',fontsize);
ylabel('dynamic state','fontsize',fontsize);
set(gca,'yticklabel',[]);
title('r_{in}=0.75 /ms','fontsize',fontsize);


