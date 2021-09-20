% the variance of VE under linear noise approximation

fig = figure();
set(fig, 'Position', [100 100 1200 270]);
fontsize=12;

subplot 131
pcolor(r0,tau_di,VarE);  hold on;
shading interp;
xlim([0.3,1.2]);
colorbar;colormap jet;
caxis([0,3]);
xlabel('r_{in}','FontSize',fontsize);ylabel('tau_{d}^I','FontSize',fontsize);
title('Var_E','FontSize',fontsize);
scatter(r0(noisebound.y),tau_di(noisebound.x),3,'MarkerEdgeColor','k','MarkerFaceColor','k');



subplot 132
plot(r0,VarE(index.subid,:),'-','Color',CL.sub,'LineWidth',2);hold on;
plot(r0,VarE(index.criid,:),'-','Color',CL.cri,'LineWidth',2);hold on;
box off;
h=legend('Subcritical','Critical');
set(h,'FontSize',10,'box','off');
xlabel('r_{in} (/ms)','FontSize',fontsize);ylabel('Var_E','FontSize',fontsize);
ylim([-0.2,2.8]);
xlim([r0(1),r0(end)]);

subplot 133
plot(r0,VarE(index.subid,:)-VarE(index.subid,index.r0is0p55),'-','Color',CL.sub,'LineWidth',2);hold on;
plot(r0,VarE(index.criid,:)-VarE(index.criid,index.r0is0p55),'-','Color',CL.cri,'LineWidth',2);hold on;
plot([0.55,0.55],[-0.7,0.5],'k--','LineWidth',1);hold on;
box off;
xlabel('r_{in} (/ms)','FontSize',fontsize);
ylabel('\Delta Var_E','FontSize',fontsize);
ylim([-0.7,0.5]);
xlim([r0(1),r0(end)]);