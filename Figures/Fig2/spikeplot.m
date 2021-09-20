% plot the spike raster plots

fig = figure(); clf;
set(fig, 'Position', [50 50 1000 150]);
fontsize=11;

Xrange=[-400,600];

ha = tight_subplot(1,3,[.03 .04],0.1,0.1) ;


axes(ha(1));
see5trials(SpikeTrains.sub,trialstosee,allColor);
xlim(Xrange);
set(gca,'yticklabel',[]);
ylabel('Trials','Fontsize',fontsize);
set(gca,'XColor','white');box off; 


axes(ha(2)); 
see5trials(SpikeTrains.cri,trialstosee,allColor);
xlim(Xrange);
set(gca,'yticklabel',[]);
set(gca,'XColor','white');box off; 

axes(ha(3));
see5trials(SpikeTrains.sup,trialstosee,allColor);
xlim(Xrange);
set(gca,'yticklabel',[]);
set(gca,'XColor','white');box off; 






