% plot the avalanche shape collapse for different inputs

fig = figure();
set(fig, 'Position', [100 100 1000 250]);
fontsize=11;


subplot 131
avshapecollapse(avgProfiles.rin0p4, 'plot');
box off;
ylabel('Scaled Avalanche Shapes', 'fontsize', fontsize);
xlabel('Scaled Avalanche Duration (t/T)', 'fontsize', fontsize);
title('r_{in}=0.4 /ms', 'fontsize', fontsize);


subplot 132
avshapecollapse(avgProfiles.rin0p65, 'plot');
box off;
xlabel('Scaled Avalanche Duration (t/T)', 'fontsize', fontsize);
title('r_{in}=0.65 /ms', 'fontsize', fontsize);

subplot 133
avshapecollapse(avgProfiles.rin0p9, 'plot');
box off;
xlabel('Scaled Avalanche Duration (t/T)', 'fontsize', fontsize);
title('r_{in}=0.9 /ms', 'fontsize', fontsize);
