% plot the evolution of frequency components across time for supercritical
% state

fig = figure(); clf;
set(fig, 'Position', [50 50 900 280]);
fontsize=12;

subplot 131
imagesc(t_erp,freqRange(1):freqRange(end),mWC.sup{1});hold on;
plot([0,0],[0,80],'k--','linewidth',1);hold on;
caxis([0,6]);
colormap('jet');
ch = colorbar('horiz');
ylim([freqRange(1),freqRange(end)]);
ylabel('frequency (Hz)','fontsize',fontsize);
xlim([-200,700]);ylim([0,70]);
xlabel('time (ms)','fontsize',10);

subplot 132
imagesc(t_erp,freqRange(1):freqRange(end),mWC.sup{2});hold on;
plot([0,0],[0,80],'k--','linewidth',1);hold on;
caxis([0,6]);
colormap('jet');
ch = colorbar('horiz');
ylim([freqRange(1),freqRange(end)]);
xlim([-200,700]);ylim([0,70]);
xlabel('time (ms)','fontsize',10);

subplot 133
imagesc(t_erp,freqRange(1):freqRange(end),mWC.sup{3});hold on;
plot([0,0],[0,80],'k--','linewidth',1);hold on;
caxis([0,6]);
colormap('jet');
ch = colorbar('horiz');
ylim([freqRange(1),freqRange(end)]);
xlim([-200,700]);ylim([0,70]);
xlabel('time (ms)','fontsize',10);