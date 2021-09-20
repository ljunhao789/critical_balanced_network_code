% plot the dependences on mean-field parameters : /sigma

fig = figure(); clf;
set(fig, 'Position', [50 50 600 250]);
fontsize=12;

subplot 121
plot(r0,sigmaonr0.e,'rs-');hold on;
plot(r0,sigmaonr0.i,'ro-');hold on;
h=legend('\sigma_e','\sigma_i','box','off');
set(h,'fontsize',10,'location','southeast');
box off;
xlim([0.5,1.2]);
ylim([2.5,4.5]);
xlabel('r_{in} (/ms)','fontsize',fontsize);ylabel('\sigma','fontsize',fontsize);


subplot 122
plot(r0,CTonr0.optimal,'r.-');hold on;
plot(r0,CTonr0.fix,'k.-');hold on;
h=legend('optimal estimated','fixed \sigma','box','off');
set(h,'fontsize',10);
box off;
xlim([0.5,1.2]);
ylim([5,13]);
xlabel('r_{in} (/ms)','fontsize',fontsize);
ylabel('tau_d^{IH}','fontsize',fontsize);

fig = figure();
set(fig, 'Position', [100 100 350 250]);
pcolor(sigma_i,sigma_e,CTonsigma);hold on;
shading interp;
colorbar;colormap jet;
xlabel('\sigma_i','FontSize',fontsize);
ylabel('\sigma_e','FontSize',fontsize);

