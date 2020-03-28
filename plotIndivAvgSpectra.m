function [varargout] = plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot)
%plotIndivAvgSpectra.m - fxn plots avg spectra for individual mts
% Sagar Setru, 25 March 2020
%
%
%%

% get the cutoff frequency
f_cutoff = psp.f_cutoff;

% get the init frequency index based on cutoff
initFreqPlotInd = min(find(f>f_cutoff));

% get the to use
shape = psp.specMarkerStyle;

% if plotting uncoated
if strcmp(whichPlot,'u')
    
    col = psp.unColor;
    colShape = [col,shape];
    
% if plotting init coated
elseif strcmp(whichPlot,'i')
    
    col = psp.initColor;
    colShape = [col,shape];

% if plotting drop coated
elseif strcmp(whichPlot,'d')
    
    col = psp.dropColor;
    colShape = [col,shape];
    
    col_lmb = psp.lmbColor;
    shape_lmb = psp.lmbMarker;

    colShape_lmb = [col_lmb,shape_lmb];
    
    % get max value
    maxP = max(avgSpectra(:,initFreqPlotInd:end));
    iMax = avgSpectra==maxP;
    fMax = f(iMax);

    lmb = 1/fMax;
    varargout{1}=lmb;
    % lmbErr = std(1./maxF_all)/sqrt(length(maxF_all));

    
end



% errorbar(fMax,maxP,lmbErr,'horizontal','k.','MarkerSize',20,'LineWidth',psp.lw)



% errorbar(f(initFreqPlotInd:end),avgSpectra(:,initFreqPlotInd:end),stdSpectra(:,initFreqPlotInd:end)/sqrt(size(P1s,2)),col,'LineWidth',psp.lw)

% only do error bar plot for droplets
if strcmp(whichPlot,'d')
    
    errorbar(f(initFreqPlotInd:end),avgSpectra(:,initFreqPlotInd:end),stdSpectra(:,initFreqPlotInd:end)/sqrt(size(P1s,2)),col,'LineWidth',psp.lw)

    plot(fMax,maxP,colShape_lmb,'MarkerSize',psp.lmbMarkerSize,'LineWidth',psp.lw)
    
    if size(P1s,2) > 1
        if psp.doScatter
            plot(f(initFreqPlotInd:end),P1s(initFreqPlotInd:end,:),colShape,'MarkerSize',psp.specMarkerSize)
        end
    end
    
else
    
    plot(f(initFreqPlotInd:end),avgSpectra(:,initFreqPlotInd:end),col,'LineWidth',psp.lw)

end






end

