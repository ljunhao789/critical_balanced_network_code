function [X,Y]=plotdensity(count_set,color)
% frequency plot of the count_set
C=tabulate(count_set);
notcontain=C(:,2)==0;
C(notcontain,:)=[]; % remove empty bins
X=C(:,1);Y=C(:,3)/100;
loglog(X,Y,'-','Color',color,'LineWidth',1.7); hold on; 
