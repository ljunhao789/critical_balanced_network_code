% plot the evolution of frequency components across time

fig = figure(); clf;
set(fig, 'Position', [50 50 1100 330]);
fontsize=12;


subplot 131
imagesc(t_erp,freqRange(1):freqRange(end),mWCcri{1});hold on;
plot([0,0],[0,80],'k--','linewidth',1);hold on;
scatter(-200,peakfreq.cri(1),50,'MarkerFaceColor','b','MarkerEdgeColor','w');hold on;
caxis([0,4.5]);
colormap('jet'); % colorbar;
ch = colorbar('horiz');
ylim([freqRange(1),freqRange(end)]);
ylabel('frequency (Hz)','fontsize',fontsize);
xlim([-200,700]);ylim([0,70]);
title('r_1 = 0.1 /ms','fontsize',fontsize,'Color','b');
xlabel('time (ms)','fontsize',fontsize);

subplot 132
imagesc(t_erp,freqRange(1):freqRange(end),mWCcri{2});hold on;
plot([0,0],[0,80],'k--','linewidth',1);hold on;
scatter(-200,peakfreq.cri(2),50,'MarkerFaceColor','g','MarkerEdgeColor','w');hold on;
caxis([0,4]);
colormap('jet'); % colorbar;
ch = colorbar('horiz');
ylim([freqRange(1),freqRange(end)]);
xlim([-200,700]);ylim([0,70]);
title('r_1 = 0.35 /ms','fontsize',fontsize,'Color','g');
xlabel('time (ms)','fontsize',fontsize);

subplot 133
imagesc(t_erp,freqRange(1):freqRange(end),mWCcri{3});hold on;
plot([0,0],[0,80],'k--','linewidth',1);hold on;
scatter(-200,peakfreq.cri(3),50,'MarkerFaceColor','r','MarkerEdgeColor','w');hold on;
caxis([0,3.5]);
colormap('jet');
ch = colorbar('horiz');% colorbar;
ylim([freqRange(1),freqRange(end)]);
xlim([-200,700]);ylim([0,70]);
title('r_1 = 0.6 /ms','fontsize',fontsize,'Color','r');
xlabel('time (ms)','fontsize',fontsize);

