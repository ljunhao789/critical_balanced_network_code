function [sigmaNuZInv, sigmaNuZInvStd, logCoeff] = sizegivdurwls2(sizes, durations, varargin)
%% Parse command line for variable inputs
durMin = min(durations);
durMax = max(durations);
plotFlag = false;

iVarArg = 1;
while iVarArg <= length(varargin)
    argOkay = true;
    if ischar(varargin{iVarArg}),
        switch varargin{iVarArg},
            case 'durmin',  durMin = max([durMin,varargin{iVarArg+1}]);
            case 'durmax',  durMax = min([durMax,varargin{iVarArg+1}]);
            case 'plot',    plotFlag = true;
            case 'color',    color = varargin{iVarArg+1};
            case 'plotline', plotlineflag=varargin{iVarArg+1};
            otherwise, 
                argOkay = false;
        end
    end
    if ~argOkay
%         disp(['(SIZEGIVDURWLS) Ignoring invalid argument #' num2str(iVarArg+1)]);
    end
    iVarArg = iVarArg + 1;
end



%% Process data

% find unique durations
unqDurations = unique(durations);
nUnqDurs = length(unqDurations);

% make histogram of duration values
durHist = histc(durations, unqDurations);

% calculate average size given durations
sizeGivDur = zeros(1, nUnqDurs);

for iUnqDur = 1:nUnqDurs
    sizeGivDur(iUnqDur) = mean(sizes(durations == unqDurations(iUnqDur)));
end

% remove NaN values
sizeGivDur = sizeGivDur(isfinite(sizeGivDur));

%% Prepare data

% Logarithmically transform unique durations and average sizes
logUnqDurs = log10(unqDurations)'; 
logSizeGivDur = log10(sizeGivDur)';

% find minimum and maximum duration histogram indices
durMinInd = find(unqDurations == durMin);
durMaxInd = find(unqDurations == durMax);

% create the design matrix for least squares
X = [logUnqDurs(durMinInd:durMaxInd), ones([durMaxInd - durMinInd + 1,1])];

%% Perform the weighted least squares fit
[B,S] = lscov(X, logSizeGivDur(durMinInd:durMaxInd), ...
    durHist(durMinInd:durMaxInd));

% extract parameter values
sigmaNuZInv = B(1);
logCoeff = B(2);
sigmaNuZInvStd = S(1);

% convert 1/(sigma nu z) standard deviation to string
sigmaNuZInvStdStr = num2str(sigmaNuZInvStd);

% determine shorter string length, 1/(sigma nu z) estimate or standard dev.
minStrLen = min(length(num2str(sigmaNuZInv)), length(sigmaNuZInvStdStr));

% trim 1/(sigma nu z) standard deviation to minimum string length
sigmaNuZInvStdStr = sigmaNuZInvStdStr(1:minStrLen);


%% Plot (optional)

if plotFlag
    
    % calculate scaling coefficient for the fit
    coeff = 10^logCoeff;
    
%     figure; hold on
    
%     scatter(unqDurations,sizeGivDur,10,color,'filled');
    plot(unqDurations,sizeGivDur,'-','Color',color,'LineWidth',1.5);hold on;
    if plotlineflag==1
        plot(unqDurations(durMinInd:durMaxInd),...
            coeff*(unqDurations(durMinInd:durMaxInd).^sigmaNuZInv)*2, 'k-.');hold on;
    end
    set(gca, 'xscale', 'log');
    set(gca, 'yscale', 'log');
    box on;
    
    
end

