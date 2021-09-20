% plot the Periodic state example

fig = figure(); clf;
set(fig, 'Position', [50 50 280 220]);
subplot(5,1,[3,4,5])
for s=1:2000
    plot(SpikeTrain.P{s},s*ones(1,length(SpikeTrain.P{s})),'.','Color',CL.P,'MarkerSize',1);hold on;
end
set(gca,'XColor','white');box off; 
line([800,900],[1,1],'LineWidth',2.5,'Color','k');
text(805,-140,'100 ms','FontSize',fontsize);
ylim([1,2000]);xlim([500,1000]);
set(gca,'yticklabel',[]);
ylabel('Neuron #','Fontsize',fontsize);


subplot(5,1,[1,2])
plot(t,Ve.P,'-','Color',CL.P,'linewidth',1);hold on;
ylim([-70 -50]);xlim([500,1000]);
ylabel('Ve (mV) ', 'fontsize',fontsize);
set(gca,'XColor','white');box off; 


fig = figure(); clf;
set(fig, 'Position', [500 500 250 220]);
subplot(2,2,1)
histogram(Corr.P,100,'normalization','pdf','EdgeColor','none','facecolor',CL.P,'FaceAlpha',0.9);
box off;
ylabel('pdf','FontSize',fontsize);
xlim([0.8,1.05]);
text(0.85,20,'PCC','FontSize',fontsize);
subplot(2,2,2)
histogram(CVISI.P,100,'normalization','pdf','EdgeColor','none','facecolor',CL.P,'FaceAlpha',0.9);
box off;
xlim([-0.05,0.7]);
ylim([0,60]);
text(0.2,40,'CV','FontSize',fontsize);


subplot(2,2,[3,4])
plot(tau,AutoCor.P,'-','Color',CL.P,'LineWidth',1.5);hold on;
xlabel('time lag (ms)','Fontsize',fontsize);
box off; 
text(20,50,'AC','Fontsize',fontsize);
ylim([-2,70]);



