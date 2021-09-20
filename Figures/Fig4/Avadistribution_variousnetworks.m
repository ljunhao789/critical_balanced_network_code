% plot the avalanche distributions on networks with different sizes


fig = figure(); clf;
set(fig, 'Position', [50 50 950 650]);
fontsize=10;


%% N=2500
subplot(3,4,1)
plotdensity(sizeset.N2p5k,plotColors(1,:),'-');
plot(plotdata.N2p5k.size_range,[1,1],'m-','LineWidth',2);hold on;
plot(plotdata.N2p5k.size_line(1,:),plotdata.N2p5k.size_line(2,:)*4,'k-.');hold on;
text(15,0.1,num2str(-plotdata.N2p5k.size_slope),'FontSize',fontsize);
ylim([1*10^(-5),1]);
xlim([1,400]);
ylabel('Prob','fontsize',fontsize);
xlabel('S','fontsize',fontsize);
title('N=2500','fontsize',fontsize);

subplot(3,4,5)
plotdensity(durationset.N2p5k,plotColors(1,:),'-');
plot(plotdata.N2p5k.dur_range,[1,1],'m-','LineWidth',2);hold on;
plot(plotdata.N2p5k.dur_line(1,:),plotdata.N2p5k.dur_line(2,:)*4,'k-.');hold on;
text(10,0.1,num2str(-plotdata.N2p5k.dur_slope),'FontSize',fontsize);
ylim([1*10^(-5),1]);
xlim([1,100]);
ylabel('Prob','fontsize',fontsize);
xlabel('T','fontsize',fontsize);

subplot(3,4,9)
sizegivdurwls2(sizeset.N2p5k,durationset.N2p5k,'durmin',plotdata.N2p5k.dur_range(1),...
    'durmax',plotdata.N2p5k.dur_range(2),'plot','color',plotColors(1,:),'plotline',1);
plot(plotdata.N2p5k.dur_range,[500,500],'m-','LineWidth',2);hold on;
text(2,90,num2str(plotdata.N2p5k.snz),'FontSize',fontsize);
ylabel('<S>(T)','fontsize',fontsize);
xlabel('T','fontsize',fontsize);
xlim([1,100]);
ylim([1,500]);


%% N=5000
subplot(3,4,2)
plotdensity(sizeset.N5k,plotColors(2,:),'-');
plot(plotdata.N5k.size_range,[1,1],'m-','LineWidth',2);hold on;
plot(plotdata.N5k.size_line(1,:),plotdata.N5k.size_line(2,:)*4,'k-.');hold on;
text(15,0.1,num2str(-plotdata.N5k.size_slope),'FontSize',fontsize);
ylim([5*10^(-6),1]);
xlim([1,400]);
xlabel('S','fontsize',fontsize);
title('N=5000','fontsize',fontsize);

subplot(3,4,6)
plotdensity(durationset.N5k,plotColors(2,:),'-');
plot(plotdata.N5k.dur_range,[1,1],'m-','LineWidth',2);hold on;
plot(plotdata.N5k.dur_line(1,:),plotdata.N5k.dur_line(2,:)*4,'k-.');hold on;
text(10,0.1,num2str(-plotdata.N5k.dur_slope),'FontSize',fontsize);
ylim([5*10^(-6),1]);
xlim([1,100]);
xlabel('T','fontsize',fontsize);

subplot(3,4,10)
sizegivdurwls2(sizeset.N5k,durationset.N5k,'durmin',plotdata.N5k.dur_range(1),...
    'durmax',plotdata.N5k.dur_range(2),'plot','color',plotColors(2,:),'plotline',1);
plot(plotdata.N5k.dur_range,[500,500],'m-','LineWidth',2);hold on;
text(2,90,num2str(plotdata.N5k.snz),'FontSize',fontsize);
xlabel('T','fontsize',fontsize);
xlim([1,100]);
ylim([1,500]);

%% N=10000
subplot(3,4,3)
plotdensity(sizeset.N10k,plotColors(3,:),'-');
plot(plotdata.N10k.size_range,[1,1],'m-','LineWidth',2);hold on;
plot(plotdata.N10k.size_line(1,:),plotdata.N10k.size_line(2,:)*4,'k-.');hold on;
text(15,0.1,num2str(-plotdata.N10k.size_slope),'FontSize',fontsize);
ylim([1*10^(-6),1]);
xlim([1,400]);
xlabel('S','fontsize',fontsize);
title('N=10000','fontsize',fontsize);

subplot(3,4,7)
plotdensity(durationset.N10k,plotColors(3,:),'-');
plot(plotdata.N10k.dur_range,[1,1],'m-','LineWidth',2);hold on;
plot(plotdata.N10k.dur_line(1,:),plotdata.N10k.dur_line(2,:)*4,'k-.');hold on;
text(10,0.1,num2str(-plotdata.N10k.dur_slope),'FontSize',fontsize);
ylim([1*10^(-6),1]);
xlim([1,100]);
xlabel('T','fontsize',fontsize);

subplot(3,4,11)
sizegivdurwls2(sizeset.N10k,durationset.N10k,'durmin',plotdata.N10k.dur_range(1),...
    'durmax',plotdata.N10k.dur_range(2),'plot','color',plotColors(3,:),'plotline',1);
plot(plotdata.N10k.dur_range,[500,500],'m-','LineWidth',2);hold on;
text(2,90,num2str(plotdata.N10k.snz),'FontSize',fontsize);
xlabel('T','fontsize',fontsize);
xlim([1,100]);
ylim([1,500]);


%% N=15000
subplot(3,4,4)
plotdensity(sizeset.N15k,plotColors(4,:),'-');
plot(plotdata.N15k.size_range,[1,1],'m-','LineWidth',2);hold on;
plot(plotdata.N15k.size_line(1,:),plotdata.N15k.size_line(2,:)*4,'k-.');hold on;
text(15,0.1,num2str(-plotdata.N15k.size_slope),'FontSize',fontsize);
ylim([3*10^(-7),1]);
xlim([1,400]);
xlabel('S','fontsize',fontsize);
title('N=15000','fontsize',fontsize);

subplot(3,4,8)
plotdensity(durationset.N15k,plotColors(4,:),'-');
plot(plotdata.N15k.dur_range,[1,1],'m-','LineWidth',2);hold on;
plot(plotdata.N15k.dur_line(1,:),plotdata.N15k.dur_line(2,:)*4,'k-.');hold on;
text(10,0.1,num2str(-plotdata.N15k.dur_slope),'FontSize',fontsize);
ylim([3*10^(-7),1]);
xlim([1,100]);
xlabel('T','fontsize',fontsize);

subplot(3,4,12)
sizegivdurwls2(sizeset.N15k,durationset.N15k,'durmin',plotdata.N15k.dur_range(1),...
    'durmax',plotdata.N15k.dur_range(2),'plot','color',plotColors(4,:),'plotline',1);
plot(plotdata.N15k.dur_range,[500,500],'m-','LineWidth',2);hold on;
text(2,90,num2str(plotdata.N15k.snz),'FontSize',fontsize);
xlabel('T','fontsize',fontsize);
xlim([1,100]);
ylim([1,500]);
