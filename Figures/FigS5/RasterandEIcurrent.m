% plot the E,I current received by neurons at spontaneous and stimulus states

fig = figure(); clf;
set(fig, 'Position', [50 50 600 400]);

yrange1=[-35,35];
yrange2=[-5,8];
xrange=[-100,300];
fontsize=10;

subplot(7,2,[1,3])
for s=1:2000
    plot(T_exc.cri{s}-600,s*ones(1,length(T_exc.cri{s})),'.','Color','k','MarkerSize',1);hold on;
end
set(gca,'XColor','white');box off; 
ylim([1,2000]);
xlim(xrange);
set(gca,'yticklabel',[]);
ylabel('Neuron #','Fontsize',fontsize);

subplot(7,2,[2,4])
for s=1:2000
    plot(T_exc.cristimulus{s}-600,s*ones(1,length(T_exc.cristimulus{s})),'.','Color','k','MarkerSize',1);hold on;
end
plot([0,0],[0,2000],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
ylim([1,2000]);
xlim(xrange);
set(gca,'yticklabel',[]);


subplot(7,2,[5,7,9])
plot(time,EC.cri,'b-','LineWidth',1); hold on;
plot(time,-IC.cri,'r-','LineWidth',1); hold on;
legend('E','I','box','off');
xlim(xrange);
ylim(yrange1);
ylabel('Input Current','fontsize',fontsize);
set(gca,'XColor','white');box off; 

subplot(7,2,[11,13])
plot(time,EC.cri-IC.cri,'k-','LineWidth',1); hold on;
legend('E+I','box','off');
xlim(xrange);
ylim(yrange2);
ylabel('Input Current','fontsize',fontsize);
xlabel('time (ms)','fontsize',fontsize);
box off; 

subplot(7,2,[6,8,10])
plot(time,EC.cristimulus,'b-','LineWidth',1); hold on;
plot(time,-IC.cristimulus,'r-','LineWidth',1); hold on;
plot([0,0],[-50,50],'k--','linewidth',1);hold on;
xlim(xrange);
ylim(yrange1);
set(gca,'XColor','white');box off; 

subplot(7,2,[12,14])
plot(time,EC.cristimulus-IC.cristimulus,'k-','LineWidth',1); hold on;
plot([0,0],[-10,10],'k--','linewidth',1);hold on;
xlim(xrange);
ylim(yrange2);
xlabel('time (ms)','fontsize',fontsize);
box off; 

