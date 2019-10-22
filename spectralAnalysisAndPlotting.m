function [P1s,f,maxF_all,indsForSpectra,avgSpectra,stdSpectra,maxAmplitude,maxF,spacing] = spectralAnalysisAndPlotting(c,indsForSpectra,f_cutoff,pix_to_nm,doSave,saveDir,saveString)
%spectralAnalysisAndPlotting.m - fxn to do fft of AFM line scans, saves
%plots, spectra, frequencies
% Sagar Setru, 2019 09 27


%%

% doSave = 0;
% 
% %indsForSpectra = [27:37];
% indsForSpectra = [3:4];
% 
% % define cutoff frequency
% f_cutoff = .00099; %units nm^-1


maxF_all = zeros(length(indsForSpectra),1);

for j = 1:length(indsForSpectra)
    
    ind = indsForSpectra(j);
    
    lineScan = c(ind,:)';
    Y = fft(lineScan);
    L = length(lineScan);

    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    P1s(:,j) = P1;
    f=(1/pix_to_nm)*(0:(L/2))/L;
    
    % find index
    initFreqPlotInd = min(find(f>f_cutoff));
    
    % get amplitude vector
    a = P1(initFreqPlotInd:end);
    
    % get freq vector
    f_cut = f(initFreqPlotInd:end);
    
    figure(2); hold on;
    plot(f_cut,a)
    
    % get max frequency for this scan
    maxA_i = find(a==max(a));
    maxF_all(j) = f_cut(maxA_i);
    
end
%maxF_all

% find index
initFreqPlotInd = min(find(f>f_cutoff));

xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'f (nm^{-1})', '|P(f)|', xafz, yafz, tvfz )
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir,'/','PowerSpectrum_',saveString])
end

if size(c,1) > 1
    avgSpectra = mean(P1s');
    stdSpectra = std(P1s');
    
    maxAmplitude = max(mean(P1s(initFreqPlotInd:end,:)'));
    maxF = f(find(avgSpectra==maxAmplitude));
    spacing = 1/maxF;

    figure; errorbar(f(initFreqPlotInd:end),avgSpectra(:,initFreqPlotInd:end),stdSpectra(:,initFreqPlotInd:end)/sqrt(size(P1s,2)))
    xafz = 14;
    yafz = 14;
    tvfz = 12;
    simplePlotFormat( 'f (nm^{-1})', 'Average |P(f)|', xafz, yafz, tvfz )
    if doSave
        saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir,'/','AveragePowerSpectrum_',saveString])
    end
else
    maxAmplitude = max(P1s(initFreqPlotInd:end));
    maxF = f(find(P1s==maxAmplitude));
    spacing = 1/maxF;
end

if doSave
    save([saveDir,'/','spectra_',saveString,'.mat'],'P1s')
    save([saveDir,'/','frequencies_',saveString,'.mat'],'f')
    save([saveDir,'/','maxFrequencies_',saveString,'.mat'],'maxF_all')
    save([saveDir,'/','f_cutoff_',saveString,'.mat'],'f_cutoff')
    save([saveDir,'/','indsForSpectra_',saveString,'.mat'],'indsForSpectra')
    save([saveDir,'/','avgSpectra_',saveString,'.mat'],'avgSpectra')
    save([saveDir,'/','stdSpectra_',saveString,'.mat'],'stdSpectra')
    save([saveDir,'/','maxAmplitude_',saveString,'.mat'],'maxAmplitude')
    save([saveDir,'/','maxFrequency_',saveString,'.mat'],'maxF')
    save([saveDir,'/','spacing_',saveString,'.mat'],'spacing')
    disp('DONE SAVING')
end
end

