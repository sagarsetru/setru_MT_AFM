function simplePlotFormat( xAxisTitle, yAxisTitle, xAxisFontSize, yAxisFontSize, TickValueFontSize )
%SimplePlotFormat.m does basic plot formatting
%    Sagar Setru
%    24 Sept 2015
%    
%    simplePlotFormat( xAxisTitle, yAxisTitle, xAxisFontSize, yAxisFontSize, TickValueFontSize )
%%

    xlabel(xAxisTitle,'FontSize',xAxisFontSize)
    ylabel(yAxisTitle,'FontSize',yAxisFontSize)
    ax = gca;
    ax.FontSize = TickValueFontSize;
    
end

