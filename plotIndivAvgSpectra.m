function plotIndivAvgSpectra(f,avgSpectra,stdSpectra,f_cutoff,P1s,psp)
%plotIndivAvgSpectra.m - fxn plots avg spectra for individual mts
% Sagar Setru, 25 March 2020
%
%
%%
initFreqPlotInd = min(find(f>f_cutoff));

% get max value
maxP = max(avgSpectra(:,initFreqPlotInd:end));
iMax = avgSpectra==maxP;
fMax = f(iMax);

lmb = 1/fMax;
% lmbErr = std(1./maxF_all)/sqrt(length(maxF_all));

figure; hold on; box on;
plot(fMax,maxP,'ko','MarkerSize',20,'LineWidth',psp.lw)
% errorbar(fMax,maxP,lmbErr,'horizontal','k.','MarkerSize',20,'LineWidth',psp.lw)

plot(f(initFreqPlotInd:end),P1s(initFreqPlotInd:end,:),'k.','MarkerSize',10)

errorbar(f(initFreqPlotInd:end),avgSpectra(:,initFreqPlotInd:end),stdSpectra(:,initFreqPlotInd:end)/sqrt(size(P1s,2)),'k','LineWidth',psp.lw)

xlim([0 0.06])
set(gca, 'XScale','log')
simplePlotFormat( psp.xAxisLabel2, psp.yAxisLabel2, psp.xafz, psp.yafz, psp.tvfz, psp.axesLw, psp.doLatex )
lgd = legend({['\lambda_{max} = ',num2str(round(lmb)),' nm']},...
    'Location','NorthEast');
legend boxoff
lgd.FontSize = psp.lfz;




end

