% plot the evolution of frequency components across time for subcritical
% state

fig = figure(); clf;
set(fig, 'Position', [50 50 900 300]);
fontsize=12;


subplot 131
imagesc(t_erp,freqRange(1):freqRange(end),mWC.sub{1}); hold on;
plot([0,0],[0,80],'k--','linewidth',1);hold on;
caxis([0,3]);
colormap('jet');
ch = colorbar('horiz');
ylim([freqRange(1),freqRange(end)]);
ylabel('frequency (Hz)','fontsize',fontsize);
xlim([-200,700]);
title('r_1 = 0.1 /ms','fontsize',fontsize,'Color','b');
xlabel('time (ms)','fontsize',10);

subplot 132
imagesc(t_erp,freqRange(1):freqRange(end),mWC.sub{2}); hold on;
plot([0,0],[0,80],'k--','linewidth',1);hold on;
caxis([0,3]);
colormap('jet');
ch = colorbar('horiz');
ylim([freqRange(1),freqRange(end)]);
xlim([-200,700]);
title('r_1 = 0.35 /ms','fontsize',fontsize,'Color','g');
xlabel('time (ms)','fontsize',10);

subplot 133
imagesc(t_erp,freqRange(1):freqRange(end),mWC.sub{3});hold on;
plot([0,0],[0,80],'k--','linewidth',1);hold on;
caxis([0,3]);
colormap('jet');
ch = colorbar('horiz');
ylim([freqRange(1),freqRange(end)]);
xlim([-200,700]);
title('r_1 = 0.6 /ms','fontsize',fontsize,'Color','r');
xlabel('time (ms)','fontsize',10);