% plot the Cri state example

fig = figure(); clf;
set(fig, 'Position', [50 50 280 220]);
subplot(5,1,[3,4,5])
for s=1:2000
    plot(SpikeTrain.Cri{s},s*ones(1,length(SpikeTrain.Cri{s})),'.','Color',CL.Cri,'MarkerSize',1);hold on;
end
set(gca,'XColor','white');box off; 
line([800,900],[1,1],'LineWidth',2.5,'Color','k');
text(805,-140,'100 ms','FontSize',fontsize);
ylim([1,2000]);xlim([500,1000]);
set(gca,'yticklabel',[]);
ylabel('Neuron #','Fontsize',fontsize);


subplot(5,1,[1,2])
plot(t,Ve.Cri,'-','Color',CL.Cri,'linewidth',1);hold on;
ylim([-70 -50]);xlim([500,1000]);
ylabel('Ve (mV) ', 'fontsize',fontsize);
set(gca,'XColor','white');box off; 


fig = figure(); clf;
set(fig, 'Position', [500 500 250 220]);
subplot(2,2,1)
histogram(Corr.Cri,100,'normalization','pdf','EdgeColor','none','facecolor',CL.Cri,'FaceAlpha',0.9);
box off;
ylabel('pdf','FontSize',fontsize);
xlim([-0.1,0.3]);
text(0.1,8,'PCC','FontSize',fontsize);
subplot(2,2,2)
histogram(CVISI.Cri,100,'normalization','pdf','EdgeColor','none','facecolor',CL.Cri,'FaceAlpha',0.9);
box off;
xlim([0,3]);
ylim([0,1]);
text(2,0.8,'CV','FontSize',fontsize);


subplot(2,2,[3,4])
plot(tau,AutoCor.Cri,'-','Color',CL.Cri,'LineWidth',1.5);hold on;
xlabel('time lag (ms)','Fontsize',fontsize);
box off; 
text(20,0.8,'AC','Fontsize',fontsize);
ylim([-0.2,1]);



