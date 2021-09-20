% plot the Asyn state example

fig = figure(); clf;
set(fig, 'Position', [50 50 280 220]);

subplot(5,1,[3,4,5])
for s=1:2000
    plot(SpikeTrain.AS{s},s*ones(1,length(SpikeTrain.AS{s})),'.','Color',CL.AS,'MarkerSize',1);hold on;
end
set(gca,'XColor','white');box off; 
line([800,900],[1,1],'LineWidth',2.5,'Color','k');
text(805,-140,'100 ms','FontSize',fontsize);
ylim([1,2000]);xlim([500,1000]);
set(gca,'yticklabel',[]);
ylabel('Neuron #','Fontsize',fontsize);


subplot(5,1,[1,2])
plot(t,Ve.AS,'-','Color',CL.AS,'linewidth',1);hold on;
ylim([-70 -50]);xlim([500,1000]);
ylabel('Ve (mV) ', 'fontsize',fontsize);
set(gca,'XColor','white');box off; 




fig = figure(); clf;
set(fig, 'Position', [500 500 250 220]);

subplot(2,2,1)
histogram(Corr.AS,100,'normalization','pdf','EdgeColor','none','facecolor',CL.AS,'FaceAlpha',0.9);
box off;
ylabel('pdf','FontSize',fontsize);
xlim([-0.1,0.2]);
text(0.08,10,'PCC','FontSize',fontsize);
subplot(2,2,2)
histogram(CVISI.AS,100,'normalization','pdf','EdgeColor','none','facecolor',CL.AS,'FaceAlpha',0.9);
box off;
xlim([0,2.5]);ylim([0,1.2]);
text(1.8,1,'CV','FontSize',fontsize);


subplot(2,2,[3,4])
plot(tau,AutoCor.AS,'-','Color',CL.AS,'LineWidth',1.5);hold on;
xlabel('time lag (ms)','Fontsize',fontsize);
box off; 
text(20,0.3,'AC','Fontsize',fontsize);
ylim([-0.01,0.4]);






