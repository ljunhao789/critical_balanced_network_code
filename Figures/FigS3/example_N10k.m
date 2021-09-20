% network size N=10000

fontsize=10;


%% plot AS state
fig = figure(); clf;
set(fig, 'Position', [50 50 280 220]);
subplot(5,1,[1,2]);
plot(t,Ve.N10k.AS,'-','Color',CL.AS,'linewidth',1);hold on;
ylim([-70 -50]);xlim([500,1000]);
ylabel('Ve (mV) ', 'fontsize',fontsize);
set(gca,'XColor','white');box off; 
subplot(5,1,[3,4,5]);
for s=1:N_neuronshown
    plot(T.N10k.AS{s},s*ones(1,length(T.N10k.AS{s})),'.','Color',CL.AS,'MarkerSize',1);hold on;
end
set(gca,'XColor','white');box off; 
line([800,900],[1,1],'LineWidth',2.5,'Color','k');
text(805,-140,'100 ms','FontSize',fontsize);
ylim([1,N_neuronshown]);xlim([500,1000]);
set(gca,'yticklabel',[]);
ylabel('Neuron #','Fontsize',fontsize);

%% plot Cri state
fig = figure(); clf;
set(fig, 'Position', [50 50 280 220]);
subplot(5,1,[1,2]);
plot(t,Ve.N10k.Cri,'-','Color',CL.Cri,'linewidth',1);hold on;
ylim([-70 -50]);xlim([500,1000]);
ylabel('Ve (mV) ', 'fontsize',fontsize);
set(gca,'XColor','white');box off; 
subplot(5,1,[3,4,5]);
for s=1:N_neuronshown
    plot(T.N10k.Cri{s},s*ones(1,length(T.N10k.Cri{s})),'.','Color',CL.Cri,'MarkerSize',1);hold on;
end
set(gca,'XColor','white');box off; 
line([800,900],[1,1],'LineWidth',2.5,'Color','k');
text(805,-140,'100 ms','FontSize',fontsize);
ylim([1,N_neuronshown]);xlim([500,1000]);
set(gca,'yticklabel',[]);
ylabel('Neuron #','Fontsize',fontsize);

%% plot SS state
fig = figure(); clf;
set(fig, 'Position', [50 50 280 220]);
subplot(5,1,[1,2]);
plot(t,Ve.N10k.SS,'-','Color',CL.SS,'linewidth',1);hold on;
ylim([-70 -50]);xlim([500,1000]);
ylabel('Ve (mV) ', 'fontsize',fontsize);
set(gca,'XColor','white');box off; 
subplot(5,1,[3,4,5]);
for s=1:N_neuronshown
    plot(T.N10k.SS{s},s*ones(1,length(T.N10k.SS{s})),'.','Color',CL.SS,'MarkerSize',1);hold on;
end
set(gca,'XColor','white');box off; 
line([800,900],[1,1],'LineWidth',2.5,'Color','k');
text(805,-140,'100 ms','FontSize',fontsize);
ylim([1,N_neuronshown]);xlim([500,1000]);
set(gca,'yticklabel',[]);
ylabel('Neuron #','Fontsize',fontsize);

%% plot P state
fig = figure(); clf;
set(fig, 'Position', [50 50 280 220]);
subplot(5,1,[1,2]);
plot(t,Ve.N10k.P,'-','Color',CL.P,'linewidth',1);hold on;
ylim([-70 -50]);xlim([500,1000]);
ylabel('Ve (mV) ', 'fontsize',fontsize);
set(gca,'XColor','white');box off; 
subplot(5,1,[3,4,5]);
for s=1:N_neuronshown
    plot(T.N10k.P{s},s*ones(1,length(T.N10k.P{s})),'.','Color',CL.P,'MarkerSize',1);hold on;
end
set(gca,'XColor','white');box off; 
line([800,900],[1,1],'LineWidth',2.5,'Color','k');
text(805,-140,'100 ms','FontSize',fontsize);
ylim([1,N_neuronshown]);xlim([500,1000]);
set(gca,'yticklabel',[]);
ylabel('Neuron #','Fontsize',fontsize);