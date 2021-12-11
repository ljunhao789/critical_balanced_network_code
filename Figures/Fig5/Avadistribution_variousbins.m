close all
fig = figure(); clf;
set(fig, 'Position', [50 50 800 500]);
fontsize=10;

% fixed bin 0.02
subplot(2,3,1)  
plotdensity(sizeFixedbin.N2p5k,plotColors(1,:),'-');
plotdensity(sizeFixedbin.N5k,plotColors(2,:),'-');
plotdensity(sizeFixedbin.N10k,plotColors(3,:),'-');
plotdensity(sizeFixedbin.N15k,plotColors(4,:),'-');
plot(pldataFixedbin.N2p5k.size_range,[1,1],'-','Color',plotColors(1,:),'LineWidth',2);hold on;
plot(pldataFixedbin.N5k.size_range,[0.75,0.75],'-','Color',plotColors(2,:),'LineWidth',2);hold on;
plot(pldataFixedbin.N10k.size_range,[0.55,0.55],'-','Color',plotColors(3,:),'LineWidth',2);hold on;
plot(pldataFixedbin.N15k.size_range,[0.4,0.4],'-','Color',plotColors(4,:),'LineWidth',2);hold on;
xlim([1,450]);
ylim([2*10^(-6),1]);
h=legend('N=2500','N=5000','N=10000','N=15000','box','off');
set(h,'fontsize',8);
ylabel('Prob','fontsize',fontsize);
xlabel('S','fontsize',fontsize);

subplot(2,3,2)  
plotdensity(durationFixedbin.N2p5k,plotColors(1,:),'-');
plotdensity(durationFixedbin.N5k,plotColors(2,:),'-');
plotdensity(durationFixedbin.N10k,plotColors(3,:),'-');
plotdensity(durationFixedbin.N15k,plotColors(4,:),'-');
plot(pldataFixedbin.N2p5k.dur_range,[1,1],'-','Color',plotColors(1,:),'LineWidth',2);hold on;
plot(pldataFixedbin.N5k.dur_range,[0.75,0.75],'-','Color',plotColors(2,:),'LineWidth',2);hold on;
plot(pldataFixedbin.N10k.dur_range,[0.55,0.55],'-','Color',plotColors(3,:),'LineWidth',2);hold on;
plot(pldataFixedbin.N15k.dur_range,[0.4,0.4],'-','Color',plotColors(4,:),'LineWidth',2);hold on;
xlim([1,100]);
ylim([2*10^(-6),1]);
ylabel('Prob','fontsize',fontsize);
xlabel('T','fontsize',fontsize);

subplot(2,3,3)  
sizegivdurwls2(sizeFixedbin.N2p5k,durationFixedbin.N2p5k,'durmin',pldataFixedbin.N2p5k.dur_range(1),...
    'durmax',pldataFixedbin.N2p5k.dur_range(2),'plot','color',plotColors(1,:),'plotline',0);
sizegivdurwls2(sizeFixedbin.N5k,durationFixedbin.N5k,'durmin',pldataFixedbin.N5k.dur_range(1),...
    'durmax',pldataFixedbin.N5k.dur_range(2),'plot','color',plotColors(2,:),'plotline',0);
sizegivdurwls2(sizeFixedbin.N10k,durationFixedbin.N10k,'durmin',pldataFixedbin.N10k.dur_range(1),...
    'durmax',pldataFixedbin.N10k.dur_range(2),'plot','color',plotColors(3,:),'plotline',0);
sizegivdurwls2(sizeFixedbin.N15k,durationFixedbin.N15k,'durmin',pldataFixedbin.N15k.dur_range(1),...
    'durmax',pldataFixedbin.N15k.dur_range(2),'plot','color',plotColors(4,:),'plotline',0);
plot(pldataFixedbin.N2p5k.dur_range,[500,500],'-','Color',plotColors(1,:),'LineWidth',2);hold on;
plot(pldataFixedbin.N5k.dur_range,[440,440],'-','Color',plotColors(2,:),'LineWidth',2);hold on;
plot(pldataFixedbin.N10k.dur_range,[380,380],'-','Color',plotColors(3,:),'LineWidth',2);hold on;
plot(pldataFixedbin.N15k.dur_range,[330,330],'-','Color',plotColors(4,:),'LineWidth',2);hold on;
text(11,8,'\Delta t=0.02 ms','FontSize',fontsize);
ylabel('<S>(T)','fontsize',fontsize);
xlabel('T','fontsize',fontsize);
xlim([1,100]);
ylim([1,500]);



% fixed network N=15000
subplot(2,3,4) 
plotdensity(sizeN15k_differentBins{1},plotColors(5,:),'-');
plotdensity(sizeN15k_differentBins{2},plotColors(6,:),'-');
plotdensity(sizeN15k_differentBins{3},plotColors(7,:),'-');
plot(pldataN15k_differentBins{1}.size_range,[1,1],'-','Color',plotColors(5,:),'LineWidth',2);hold on;
plot(pldataN15k_differentBins{2}.size_range,[0.75,0.75],'-','Color',plotColors(6,:),'LineWidth',2);hold on;
plot(pldataN15k_differentBins{3}.size_range,[0.55,0.55],'-','Color',plotColors(7,:),'LineWidth',2);hold on;
xlim([1,450]);
ylim([1*10^(-6),1]);
h=legend('bin=0.4T_m','bin=0.8T_m','bin=1.2T_m','box','off');
set(h,'fontsize',8);
ylabel('Prob','fontsize',fontsize);
xlabel('S','fontsize',fontsize);

subplot(2,3,5) 
plotdensity(durationN15k_differentBins{1},plotColors(5,:),'-');
plotdensity(durationN15k_differentBins{2},plotColors(6,:),'-');
plotdensity(durationN15k_differentBins{3},plotColors(7,:),'-');
plot(pldataN15k_differentBins{1}.dur_range,[1,1],'-','Color',plotColors(5,:),'LineWidth',2);hold on;
plot(pldataN15k_differentBins{2}.dur_range,[0.75,0.75],'-','Color',plotColors(6,:),'LineWidth',2);hold on;
plot(pldataN15k_differentBins{3}.dur_range,[0.55,0.55],'-','Color',plotColors(7,:),'LineWidth',2);hold on;
xlim([1,100]);
ylim([1*10^(-6),1]);
ylabel('Prob','fontsize',fontsize);
xlabel('T','fontsize',fontsize);

subplot(2,3,6) 
sizegivdurwls2(sizeN15k_differentBins{1},durationN15k_differentBins{1},'durmin',pldataN15k_differentBins{1}.dur_range(1),...
    'durmax',pldataN15k_differentBins{1}.dur_range(2),'plot','color',plotColors(5,:),'plotline',0);
sizegivdurwls2(sizeN15k_differentBins{2},durationN15k_differentBins{2},'durmin',pldataN15k_differentBins{2}.dur_range(1),...
    'durmax',pldataN15k_differentBins{2}.dur_range(2),'plot','color',plotColors(6,:),'plotline',0);
sizegivdurwls2(sizeN15k_differentBins{3},durationN15k_differentBins{3},'durmin',pldataN15k_differentBins{3}.dur_range(1),...
    'durmax',pldataN15k_differentBins{3}.dur_range(2),'plot','color',plotColors(7,:),'plotline',0);

plot(pldataN15k_differentBins{1}.dur_range,[500,500],'-','Color',plotColors(5,:),'LineWidth',2);hold on;
plot(pldataN15k_differentBins{2}.dur_range,[440,440],'-','Color',plotColors(6,:),'LineWidth',2);hold on;
plot(pldataN15k_differentBins{3}.dur_range,[380,380],'-','Color',plotColors(7,:),'LineWidth',2);hold on;
text(15,8,'N=15000','FontSize',fontsize);
ylabel('<S>(T)','fontsize',fontsize);
xlabel('T','fontsize',fontsize);
xlim([1,100]);
ylim([1,500]);
