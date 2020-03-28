function plotUnInitDropSpectra(varargin)
%plotUnInitDropSpectra.m - fxn will plot multiple spectra based nargin
%
%
% Sagar Setru, 2020 03 26
% 
%
%
% nargin == 2: just final spectra and psp structure
%
% nargin == 4: all three (uncoated, init coated, droplets) and psp, IN THAT
% ORDER
%
% nargin == 3: three sets (un init, un drop, init drop), then psp
% follow that order
% last input is always psp structure
%%

psp = varargin{end};

figure; hold on; box on;

% just plot final droplet formation
if nargin == 2
    
    inputStruct = varargin{1};
    
    pathName = inputStruct.pathName;
    whichPlot = inputStruct.whichPlot;
    
    fNameStruct = loadSpectralDataFromDir(pathName);
    load(fNameStruct.avgSpectra)
    
    % check units, convert to nm as needed
    if floor(log10(avgSpectra(1))) < 0

        avgSpectra = avgSpectra*1e9;
        
        if floor(log10(avgSpectra(1))) > 3
            error('check units of spectra (m vs nm)!')
        end
        
        load(fNameStruct.stdSpectra)
        stdSpectra = stdSpectra*1e9;
        
        load(fNameStruct.spectra)
        P1s = P1s*1e9;
        
    else
        
        load(fNameStruct.stdSpectra)
        load(fNameStruct.spectra)
        
    end
    
    load(fNameStruct.f)
    
    [lmb] = plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot);
    
%     lpSpec = avgSpectra(2:12);
%     lpDrop = ifft(lpSpec);
    
    xlim([0 0.06])
    set(gca, 'XScale','log')
    simplePlotFormat( psp.xAxisLabel2, psp.yAxisLabel2, psp.xafz, psp.yafz, psp.tvfz, psp.axesLw, psp.doLatex )

    lgd = legend({['After droplet formation'],...
        ['\lambda_{max} = ',num2str(round(lmb)),' nm']},...
        'Location',psp.lgdLocSpec);
    legend boxoff
    lgd.FontSize = psp.lfz;
    
elseif nargin == 4
    
    % plot uncoated
    inputStruct = varargin{1};
    
    pathName = inputStruct.pathName;
    whichPlot = inputStruct.whichPlot;
    
    fNameStruct = loadSpectralDataFromDir(pathName);
    load(fNameStruct.avgSpectra)
    
    % check units, convert to nm as needed
    if floor(log10(avgSpectra(1))) < 0

        avgSpectra = avgSpectra*1e9;
        
        if floor(log10(avgSpectra(1))) > 3
            error('check units of spectra (m vs nm)!')
        end
        
        load(fNameStruct.stdSpectra)
        stdSpectra = stdSpectra*1e9;
        
        load(fNameStruct.spectra)
        P1s = P1s*1e9;
        
    else
        
        load(fNameStruct.stdSpectra)
        load(fNameStruct.spectra)
        
    end
    
    load(fNameStruct.f)
    
    plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot)
    
    
    % plot init coated
    inputStruct = varargin{2};
    
    pathName = inputStruct.pathName;
    whichPlot = inputStruct.whichPlot;
    
    fNameStruct = loadSpectralDataFromDir(pathName);
    load(fNameStruct.avgSpectra)
    
    % check units, convert to nm as needed
    if floor(log10(avgSpectra(1))) < 0

        avgSpectra = avgSpectra*1e9;
        
        if floor(log10(avgSpectra(1)))  > 3
            error('check units of spectra (m vs nm)!')
        end
        
        load(fNameStruct.stdSpectra)
        stdSpectra = stdSpectra*1e9;
        
        load(fNameStruct.spectra)
        P1s = P1s*1e9;
        
    else
        
        load(fNameStruct.stdSpectra)
        load(fNameStruct.spectra)
        
    end
    
    load(fNameStruct.f)

    plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot)
    
    
    % plot droplet coated
    inputStruct = varargin{3};
    
    pathName = inputStruct.pathName;
    whichPlot = inputStruct.whichPlot;
    
    fNameStruct = loadSpectralDataFromDir(pathName);
    load(fNameStruct.avgSpectra)
    
    % check units, convert to nm as needed
    if floor(log10(avgSpectra(1))) < 0

        avgSpectra = avgSpectra*1e9;
        
        if floor(log10(avgSpectra(1))) > 3
            error('check units of spectra (m vs nm)!')
        end
        
        load(fNameStruct.stdSpectra)
        stdSpectra = stdSpectra*1e9;
        
        load(fNameStruct.spectra)
        P1s = P1s*1e9;
        
    else
        
        load(fNameStruct.stdSpectra)
        load(fNameStruct.spectra)
        
    end
    
    load(fNameStruct.f)
    
    [lmb] = plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot);

    % adjust plot settings, 
    if psp.doXlimSpec
        xlim([psp.xminSpec psp.xmaxSpec])
    end
    
    if psp.doYlimSpec
        ylim([psp.yminSpec psp.ymaxSpec])
    end
    
    set(gca, 'XScale',psp.xscale)
    set(gca,'YScale',psp.yscale)
    simplePlotFormat( psp.xAxisLabel2, psp.yAxisLabel2, psp.xafz, psp.yafz, psp.tvfz, psp.axesLw, psp.doLatex )

    lgd = legend({'Uncoated',...
        'Initially coated',...
        'After droplet formation',...
        ['\lambda_{max} = ',num2str(round(lmb)),' nm']},...
        'Location',psp.lgdLocSpec);
    legend boxoff
    lgd.FontSize = psp.lfz;
    
elseif nargin == 3
    
    % get the two input structures
    inputStruct1 = varargin{1};
    inputStruct2 = varargin{2};
    
    % get the directories of which plots to do
    pathName1 = inputStruct1.pathName;
    pathName2 = inputStruct2.pathName;
    
    % get the identities of the plots to do
    whichPlot1 = inputStruct1.whichPlot;
    whichPlot2 = inputStruct2.whichPlot;
    
    % string together, and compare against this string to do plotting and
    % define the legend entries
    plotsToDo = [whichPlot1,whichPlot2];

    
    if strcmp(plotsToDo,'ui')
        
        fNameStruct = loadSpectralDataFromDir(pathName1);
        load(fNameStruct.avgSpectra)

        % check units, convert to nm as needed
        if floor(log10(avgSpectra(1))) < 0

            avgSpectra = avgSpectra*1e9;

            if floor(log10(avgSpectra(1))) > 3
                error('check units of spectra (m vs nm)!')
            end

            load(fNameStruct.stdSpectra)
            stdSpectra = stdSpectra*1e9;

            load(fNameStruct.spectra)
            P1s = P1s*1e9;

        else

            load(fNameStruct.stdSpectra)
            load(fNameStruct.spectra)

        end

        load(fNameStruct.f)
        
        plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot1)


        fNameStruct = loadSpectralDataFromDir(pathName2);
        load(fNameStruct.avgSpectra)

        % check units, convert to nm as needed
        if floor(log10(avgSpectra(1))) < 0

            avgSpectra = avgSpectra*1e9;

            if floor(log10(avgSpectra(1))) > 3
                error('check units of spectra (m vs nm)!')
            end

            load(fNameStruct.stdSpectra)
            stdSpectra = stdSpectra*1e9;

            load(fNameStruct.spectra)
            P1s = P1s*1e9;

        else

            load(fNameStruct.stdSpectra)
            load(fNameStruct.spectra)

        end

        plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot2)
        
        lgd = legend({'Uncoated',...
        'Initially coated'},...
        'Location',psp.lgdLocSpec);
        legend boxoff
        lgd.FontSize = psp.lfz;
    
    elseif strcmp(plotsToDo,'id')
        
        fNameStruct = loadSpectralDataFromDir(pathName1);
        load(fNameStruct.avgSpectra)

        % check units, convert to nm as needed
        if floor(log10(avgSpectra(1))) < 0

            avgSpectra = avgSpectra*1e9;

            if floor(log10(avgSpectra(1))) > 3
                error('check units of spectra (m vs nm)!')
            end

            load(fNameStruct.stdSpectra)
            stdSpectra = stdSpectra*1e9;

            load(fNameStruct.spectra)
            P1s = P1s*1e9;

        else

            load(fNameStruct.stdSpectra)
            load(fNameStruct.spectra)

        end
        
        load(fNameStruct.f)

        plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot1)


        fNameStruct = loadSpectralDataFromDir(pathName2);
        load(fNameStruct.avgSpectra)

        % check units, convert to nm as needed
        if floor(log10(avgSpectra(1))) < 0

            avgSpectra = avgSpectra*1e9;

            if floor(log10(avgSpectra(1))) > 3
                error('check units of spectra (m vs nm)!')
            end

            load(fNameStruct.stdSpectra)
            stdSpectra = stdSpectra*1e9;

            load(fNameStruct.spectra)
            P1s = P1s*1e9;

        else

            load(fNameStruct.stdSpectra)
            load(fNameStruct.spectra)

        end

        load(fNameStruct.f)
        
        [lmb] = plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot2);
            
        lgd = legend({'Initially coated',...
        'After droplet formation',...
        ['\lambda_{max} = ',num2str(round(lmb)),' nm']},...
        'Location',psp.lgdLocSpec);
        legend boxoff
        lgd.FontSize = psp.lfz;
    
    elseif strcmp(plotsToDo,'ud')
        
        fNameStruct = loadSpectralDataFromDir(pathName1);
        load(fNameStruct.avgSpectra)

        % check units, convert to nm as needed
        if floor(log10(avgSpectra(1))) < 0

            avgSpectra = avgSpectra*1e9;

            if floor(log10(avgSpectra(1))) > 3
                error('check units of spectra (m vs nm)!')
            end

            load(fNameStruct.stdSpectra)
            stdSpectra = stdSpectra*1e9;

            load(fNameStruct.spectra)
            P1s = P1s*1e9;

        else

            load(fNameStruct.stdSpectra)
            load(fNameStruct.spectra)

        end
        
        load(fNameStruct.f)

        plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot1)


        fNameStruct = loadSpectralDataFromDir(pathName2);
        load(fNameStruct.avgSpectra)

        % check units, convert to nm as needed
        if floor(log10(avgSpectra(1))) < 0

            avgSpectra = avgSpectra*1e9;

            if floor(log10(avgSpectra(1))) > 3
                error('check units of spectra (m vs nm)!')
            end

            load(fNameStruct.stdSpectra)
            stdSpectra = stdSpectra*1e9;

            load(fNameStruct.spectra)
            P1s = P1s*1e9;

        else

            load(fNameStruct.stdSpectra)
            load(fNameStruct.spectra)

        end
        
        load(fNameStruct.f)
    
        [lmb] = plotIndivAvgSpectra(f,avgSpectra,stdSpectra,P1s,psp,whichPlot2);
            
        lgd = legend({'Uncoated',...
        'After droplet formation',...
        ['\lambda_{max} = ',num2str(round(lmb)),' nm']},...
        'Location',psp.lgdLocSpec);
    legend boxoff
    lgd.FontSize = psp.lfz;
    
    else
        error('plot structures are not in proper order! order: u, i, d.')
    end
    
    % adjust plot settings, 
    if psp.doXlimSpec
        xlim([psp.xminSpec psp.xmaxSpec])
    end
    
    if psp.doYlimSpec
        ylim([psp.yminSpec psp.ymaxSpec])
    end
    
    set(gca, 'XScale',psp.xscale)
    set(gca,'YScale',psp.yscale)
    simplePlotFormat( psp.xAxisLabel2, psp.yAxisLabel2, psp.xafz, psp.yafz, psp.tvfz, psp.axesLw, psp.doLatex )

    
end

if psp.doSave == 1
    if psp.doScatter
        saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra_withScatter'])        
    else
        saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra'])
    end
end


