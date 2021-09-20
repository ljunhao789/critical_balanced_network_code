% the mean-field prediction firing rate and eigenvalues of the equilibrium

fig = figure();
set(fig, 'Position', [100 100 1200 270]);
fontsize=12;

subplot 131
plot(r0(index.Qe),Qe.predict*10^3,'k-','LineWidth',2);  hold on;
plot(r0(index.Qe),Qe.optimaln*10^3,'m.-');  hold on;
plot(r0(index.Qe),Qe.simul_const*10^3,'bo','MarkerFaceColor','b');  hold on;
plot(r0(index.Qe),Qe.simul_noisy*10^3,'rs','MarkerFaceColor','r');  hold on;
box off;
h=legend('mean-field','optimal estimate','box','off');
set(h,'fontsize',10);
ylim([0,10]);
xlim([r0(index.Qe(1)),r0(index.Qe(end))]);
xlabel('r_{in} (/ms)','FontSize',fontsize);
ylabel('Qe (Hz)','FontSize',fontsize);


subplot 132
pcolor(r0,tau_di,realPart);  hold on;
xlim([0.3,1.2]);
shading interp;
colorbar;colormap jet;
xlabel('r_{in}','FontSize',fontsize);ylabel('tau_{d}^I','FontSize',fontsize);
title('real (/ms)','FontSize',fontsize);
scatter(r0(zerobound.y),tau_di(zerobound.x),3,'MarkerEdgeColor',[0.4940 0.1840 0.5560],'MarkerFaceColor',[0.4940 0.1840 0.5560]);hold on;
scatter(r0(noisebound.y),tau_di(noisebound.x),3,'MarkerEdgeColor','k','MarkerFaceColor','k');hold on;

subplot 133
HopfFre_cut=HopfFre;
HopfFre_cut(cut_id)=0;
pcolor(r0,tau_di,HopfFre_cut); hold on;
shading interp;
xlim([0.3,1.2]);
colorbar;colormap jet;
caxis([20,40]);
xlabel('r_{in}','FontSize',fontsize);ylabel('tau_{d}^I','FontSize',fontsize);
title('Hopf frequency (/s)','FontSize',fontsize);


fig = figure(); clf;
set(fig, 'Position', [50 50 150 100]);

scatter(r0(index.r0(1)),HopfFre(index.criid,index.r0(1)),50,'MarkerFaceColor','b');hold on;
scatter(r0(index.r0(2)),HopfFre(index.criid,index.r0(2)),50,'MarkerFaceColor','g');hold on;
scatter(r0(index.r0(3)),HopfFre(index.criid,index.r0(3)),50,'MarkerFaceColor','r');hold on;
plot(r0(index.r0(1):index.r0(3)),HopfFre(index.criid,index.r0(1):index.r0(3)),'k-','linewidth',1);hold on;

scatter(r0(index.r0(1)),HopfFre(index.supid,index.r0(1)),50,'MarkerFaceColor','b');hold on;
scatter(r0(index.r0(2)),HopfFre(index.supid,index.r0(2)),50,'MarkerFaceColor','g');hold on;
scatter(r0(index.r0(3)),HopfFre(index.supid,index.r0(3)),50,'MarkerFaceColor','r');hold on;
plot(r0(index.r0(1):index.r0(3)),HopfFre(index.supid,index.r0(1):index.r0(3)),'k:','linewidth',1);hold on;


xlabel('r_{in}','fontsize',8);
ylabel('freq (Hz)','fontsize',8);
xlim([0.3,1]);ylim([21,38]);
box on;
