function simplePlotFormat( xAxisTitle, yAxisTitle, xAxisFontSize, yAxisFontSize, TickValueFontSize, axesLineWidth, doLatex )
%SimplePlotFormat.m does basic plot formatting
%    Sagar Setru
%    24 Sept 2015
%    
%    simplePlotFormat( xAxisTitle, yAxisTitle, xAxisFontSize, yAxisFontSize, TickValueFontSize, axesLineWidth, doLatex )
%%

    if doLatex
        
        xlabel(xAxisTitle,'FontSize',xAxisFontSize,'Interpreter','latex')
        ylabel(yAxisTitle,'FontSize',yAxisFontSize,'Interpreter','latex')
        ax = gca;
        ax.FontSize = TickValueFontSize;
        set(gca,'LineWidth',axesLineWidth,'TickLabelInterpreter','latex')
        
    else
        
        xlabel(xAxisTitle,'FontSize',xAxisFontSize)
        ylabel(yAxisTitle,'FontSize',yAxisFontSize)
        ax = gca;
        ax.FontSize = TickValueFontSize;
        set(gca,'LineWidth',axesLineWidth)
        
    end
    
end

