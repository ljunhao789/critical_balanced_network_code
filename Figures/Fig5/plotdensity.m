function [X,Y]=plotdensity(count_set,color,style)

C=tabulate(count_set);
notcontain=C(:,2)==0;
C(notcontain,:)=[]; % delete empty value
X=C(:,1);Y=C(:,3)/100;
loglog(X,Y,style,'Color',color,'LineWidth',1.5); hold on;% 
