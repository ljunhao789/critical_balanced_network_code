function y=see5trials(T_all,trialsToSee,allColor)
% rasterplot for 5 trials

neuronNum=size(T_all,1);

for j=1:5 % for each trial
    T=cell(neuronNum,1);
    for s=1:neuronNum
        T{s}=T_all{s,trialsToSee(j)};
        plot(T{s}-1000,((j-1)*neuronNum+s)*ones(1,length(T{s})),'.',...
            'Color',allColor(j,:),'MarkerSize',3);hold on;
    end
end
plot([0,0],[0,5*neuronNum],'k--','linewidth',1);hold on;
ylim([0,5*neuronNum]);


