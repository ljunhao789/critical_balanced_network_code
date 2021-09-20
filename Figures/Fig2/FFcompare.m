% plot the comparion of FF 

fig = figure(); clf;
set(fig, 'Position', [50 50 500 80]);
fontsize=9;

subplot 131
boxplot([FFdata.preFF.sub',FFdata.postFF.sub'],'Labels',{'Pre','Post'});
box off;
ylabel('FF','fontsize',fontsize);ylim([0.7,2.2]);
set(gca,'fontsize',fontsize);

subplot 132
boxplot([FFdata.preFF.cri',FFdata.postFF.cri'],'Labels',{'Pre','Post'});
box off;
ylabel('FF','fontsize',fontsize);ylim([1,5]);
set(gca,'fontsize',fontsize);

subplot 133
boxplot([FFdata.preFF.sup',FFdata.postFF.sup'],'Labels',{'Pre','Post'});
box off;
ylabel('FF','fontsize',fontsize);ylim([0,1.5]);
set(gca,'fontsize',fontsize);

