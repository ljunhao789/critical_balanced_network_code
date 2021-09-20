% plot the linear noise predictions for different noise strengths /beta

fig = figure(); clf;
set(fig, 'Position', [50 50 600 500]);
fontsize=12;

subplot 221
plot(r_in,VarE.sub,'LineWidth',2);hold on;
h=legend('\beta=0.1','\beta=0.2','\beta=0.3','\beta=0.4','box','off');
set(h,'FontSize',11);
box off;
xlabel('r_{in} (/ms)','FontSize',fontsize);ylabel('Var_E','FontSize',fontsize);
ylim([0,4.5]);
xlim([r_in(1),r_in(end)]);
title('Subcritical','FontSize',fontsize);

subplot 223
plot(r_in,VarE.sub-VarE.sub(:,26),'LineWidth',2);hold on;
plot([0.55,0.55],[-1.5,1],'k--','LineWidth',1);hold on;
box off;
xlabel('r_{in} (/ms)','FontSize',fontsize);ylabel('\Delta Var_E','FontSize',fontsize);
xlim([r_in(1),r_in(end)]);
ylim([-1.2,1]);

subplot 222
plot(r_in,VarE.cri,'LineWidth',2);hold on;
box off;
xlabel('r_{in} (/ms)','FontSize',fontsize);
ylim([0,4.5]);
xlim([r_in(1),r_in(end)]);
title('Critical','FontSize',fontsize);

subplot 224
plot(r_in,VarE.cri-VarE.cri(:,26),'LineWidth',2);hold on;
plot([0.55,0.55],[-1.5,1],'k--','LineWidth',1);hold on;
box off;
xlabel('r_{in} (/ms)','FontSize',fontsize);
xlim([r_in(1),r_in(end)]);
ylim([-1.2,1]);