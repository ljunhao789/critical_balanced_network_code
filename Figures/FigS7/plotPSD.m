% plot the power spectra of sub and super- critical states

fig = figure(); clf;
set(fig, 'Position', [50 50 280 500]);
fontsize=12;

subplot 211
semilogy(f.sub,Psd.sub(1,:),'b-','LineWidth',1.5);hold on;
semilogy(f.sub,Psd.sub(2,:),'g-','LineWidth',1.5);hold on;
semilogy(f.sub,Psd.sub(3,:),'r-','LineWidth',1.5);hold on;
xlim([10 80]);
box off;
xlabel('freq (Hz)','Fontsize',fontsize);
ylabel('post-stim PSD','Fontsize',fontsize);


subplot 212
semilogy(f.sup,Psd.sup(1,:),'b-','LineWidth',1.5);hold on;
semilogy(f.sup,Psd.sup(2,:),'g-','LineWidth',1.5);hold on;
semilogy(f.sup,Psd.sup(3,:),'r-','LineWidth',1.5);hold on;
xlim([10 80]);ylim([0.002,0.5]);
box off;
xlabel('freq (Hz)','Fontsize',fontsize);
ylabel('post-stim PSD','Fontsize',fontsize);


