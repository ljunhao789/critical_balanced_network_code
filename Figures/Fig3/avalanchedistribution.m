% plot the spike raster plots and avalanche distributions


fig = figure(); clf;
set(fig, 'Position', [50 50 1100 220]);
fontsize=12;


N_show=500;
subplot 141
for s=1:N_show
    plot(SpikeTrains.rin0p1{s}-T_onset,s*ones(1,length(SpikeTrains.rin0p1{s})),'b.','MarkerSize',3);hold on;
    plot(SpikeTrains.rin0p35{s}-T_onset,(s+N_show)*ones(1,length(SpikeTrains.rin0p35{s})),'g.','MarkerSize',3);hold on;
    plot(SpikeTrains.rin0p6{s}-T_onset,(s+2*N_show)*ones(1,length(SpikeTrains.rin0p6{s})),'r.','MarkerSize',3);hold on;
end
box off;
plot([0,0],[0,3*N_show],'k--','linewidth',1);hold on;
xlim([-200,700]);ylim([0,3*N_show]);
set(gca,'yticklabel',[]);
xlabel('time (ms)','fontsize',10);
 
 
 
subplot 142
plotdensity(sizeset.rin0p1.pre,'c','-');
plotdensity(sizeset.rin0p1.post,'b','-');
plotdensity(sizeset.rin0p35.post,'g','-');
plotdensity(sizeset.rin0p6.post,'r','-');
loglog(tran_size.x,tran_size.P,'k-','LineWidth',1.5); hold on;%
plot(pldata_post.size_range,[1,1],'m-','LineWidth',2);hold on;
plot(pldata_post.size_line(1,:),pldata_post.size_line(2,:)*4,'k-.');hold on;
text(15,0.1,num2str(-pldata_post.size_slope),'FontSize',fontsize);
ylim([5*10^(-5),1]);
xlim([1,250]);
ylabel('Prob','fontsize',fontsize);
xlabel('S','fontsize',fontsize);

subplot 143
plotdensity(durationset.rin0p1.pre,'c','-');
plotdensity(durationset.rin0p1.post,'b','-');
plotdensity(durationset.rin0p35.post,'g','-');
plotdensity(durationset.rin0p6.post,'r','-');
loglog(tran_dur.x,tran_dur.P,'k-','LineWidth',1.5); hold on;%
plot(pldata_post.dur_range,[1,1],'m-','LineWidth',2);hold on;
plot(pldata_post.dur_line(1,:),pldata_post.dur_line(2,:)*4,'k-.');hold on;
text(10,0.1,num2str(-pldata_post.dur_slope),'FontSize',fontsize);
ylim([5*10^(-5),1]);
xlim([1,60]);
xlabel('T','fontsize',fontsize);

subplot 144
plotdurrange=pldata_post.dur_range;
sizegivdurwls2(sizeset.rin0p1.pre,durationset.rin0p1.pre,'durmin',plotdurrange(1),'durmax',plotdurrange(2),'plot','color','c','plotline',0);
sizegivdurwls2(sizeset.rin0p1.post,durationset.rin0p1.post,'durmin',plotdurrange(1),'durmax',plotdurrange(2),'plot','color','b','plotline',0);
sizegivdurwls2(sizeset.rin0p35.post,durationset.rin0p35.post,'durmin',plotdurrange(1),'durmax',plotdurrange(2),'plot','color','g','plotline',1);
sizegivdurwls2(sizeset.rin0p6.post,durationset.rin0p6.post,'durmin',plotdurrange(1),'durmax',plotdurrange(2),'plot','color','r','plotline',0);
sizegivdurwls2(sizeset.rin0p1.tran,durationset.rin0p1.tran,'durmin',plotdurrange(1),'durmax',plotdurrange(2),'plot','color','k','plotline',0);
plot(pldata_post.snz_range,[500,500],'m-','LineWidth',2);hold on;
text(2,90,num2str(pldata_post.snz),'FontSize',fontsize);
ylabel('<S>(T)','fontsize',fontsize);
xlabel('T','fontsize',fontsize);
xlim([1,60]);
ylim([1,500]);


