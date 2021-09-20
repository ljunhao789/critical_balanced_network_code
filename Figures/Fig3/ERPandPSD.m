% plot the ERP and post-stimulus PSD

fig = figure(); clf;
set(fig, 'Position', [50 50 1100 250]);
fontsize=12;

subplot 131
plot(t_erp,Ve_cri(1,:),'b-','linewidth',1.5);hold on;
plot(t_erp,Ve_cri(2,:),'g-','linewidth',1.5);hold on;
plot(t_erp,Ve_cri(3,:),'r-','linewidth',1.5);hold on;
plot([0,0],[-70,-45],'k--','linewidth',1);hold on;
xlim([-200,700]);ylim([-62,-55]);
box off;
h=legend('r_1 = 0.1','r_1 = 0.35','r_1 = 0.6');
set(h,'fontsize',10,'box','off');
xlabel('time (ms)','fontsize',fontsize);
ylabel('ERP (mV)','fontsize',fontsize);

subplot 132
plot(t_erp,Qe_cri(1,:)*10^3,'b-','linewidth',1.5);hold on;
plot(t_erp,Qe_cri(2,:)*10^3,'g-','linewidth',1.5);hold on;
plot(t_erp,Qe_cri(3,:)*10^3,'r-','linewidth',1.5);hold on;
plot([0,0],[0,25],'k--','linewidth',1);hold on;
xlim([-200,700]);ylim([0,21]);
box off;
xlabel('time (ms)','fontsize',fontsize);
ylabel('firing rate (Hz)','fontsize',fontsize);

subplot 133
semilogy(f_cri,Psd_cri(1,:),'b-','LineWidth',1.5);hold on;
semilogy(f_cri,Psd_cri(2,:),'g-','LineWidth',1.5);hold on;
semilogy(f_cri,Psd_cri(3,:),'r-','LineWidth',1.5);hold on;
xlim([10 80]);ylim([0.002,0.2]);
box off;
xlabel('freq (Hz)','Fontsize',fontsize);
ylabel('post-stim PSD','Fontsize',fontsize);

fig = figure(); clf;
set(fig, 'Position', [50 50 150 120]);
scatter(r1(1),peakfreq.cri(1),50,'MarkerFaceColor','b');hold on;
scatter(r1(2),peakfreq.cri(2),50,'MarkerFaceColor','g');hold on;
scatter(r1(3),peakfreq.cri(3),50,'MarkerFaceColor','r');hold on;
plot(r1,peakfreq.cri,'k-','linewidth',1);hold on;

scatter(r1(1),peakfreq.sup(1),50,'MarkerFaceColor','b');hold on;
scatter(r1(2),peakfreq.sup(2),50,'MarkerFaceColor','g');hold on;
scatter(r1(3),peakfreq.sup(3),50,'MarkerFaceColor','r');hold on;
plot(r1,peakfreq.sup,'k:','linewidth',1);hold on;

xlabel('r_1','fontsize',8);
ylabel('peak freq (Hz)','fontsize',8);
xlim([0.05,0.7]);ylim([22,55]);
box on;

fig = figure(); clf;
set(fig, 'Position', [50 50 150 120]);
scatter(r1(1),peakfreq.sub(1),50,'MarkerFaceColor','b');hold on;
scatter(r1(2),peakfreq.sub(2),50,'MarkerFaceColor','g');hold on;
scatter(r1(3),peakfreq.sub(3),50,'MarkerFaceColor','r');hold on;
plot(r1,[0,0,0],'k-.','linewidth',1);hold on;


xlabel('r_1','fontsize',8);
ylabel('peak freq (Hz)','fontsize',8);
xlim([0.05,0.7]);ylim([-0.5,10]);
box on;


