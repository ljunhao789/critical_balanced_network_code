% plot the critical parameters values

fig=figure();
set(fig, 'Position', [50 50 800 250]);
fontsize=11;
fontsize2=9;

subplot 121
for s=1:neuronNum
    plot(SpikeTrain.taudi14to6{s}-T_onset,s*ones(1,length(SpikeTrain.taudi14to6{s})),'.',...
        'Color','b','MarkerSize',3);hold on;
    plot(SpikeTrain.taudi14to9{s}-T_onset,(s+400)*ones(1,length(SpikeTrain.taudi14to9{s})),'.',...
        'Color','b','MarkerSize',3);hold on;
end
plot([0,0],[-50,750],'k--','linewidth',1);hold on;
set(gca,'XColor','white');box off; 
line([200,400],[-50,-50],'LineWidth',2.5,'Color','k');
text(200,-110,'200 ms','FontSize',fontsize);
text(-800,750,'tau_d^I=14ms','FontSize',fontsize2);
text(800,750,'tau_d^I=9ms','FontSize',fontsize2);
text(800,340,'tau_d^I=6ms','FontSize',fontsize2);
set(gca,'yticklabel',[]);
ylim([-50,750]);


subplot 122
plot(rin,min_tau_di_for_periodic_r,'b-','linewidth',1.5);hold on;
plot(rin,max_tau_di_for_chaotic_r,'r-','linewidth',1.5);hold on;
plot(rin2,tau_di_H_r,'g-','linewidth',1.5);hold on;
box off;
legend('tau_d^{I*}','tau_d^{I**}','tau_d^{IH}','FontSize',10,'location','southeast','box','off')
xlabel('r_{in} /ms','FontSize',fontsize);
ylabel('tau_d^I(ms)','FontSize',fontsize);
ylim([3,14]);xlim([rin(1),rin(end)]);