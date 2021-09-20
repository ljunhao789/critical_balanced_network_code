% plot the avalanche distribution example

fig = figure(); clf;
set(fig, 'Position', [50 50 280 200]);

plotdensity(avalanche_sizeset.AS,CL.AS);
plotdensity(avalanche_sizeset.Cri,CL.Cri);
plotdensity(avalanche_sizeset.SS,CL.SS);
box off;
h=legend('AS','Cri','SS','box','off','Fontsize',fontsize);
ylabel('Prob','Fontsize',fontsize);
xlabel('avalanche size','Fontsize',fontsize);
xlim([1,560]);ylim([2*10^(-6),1]);