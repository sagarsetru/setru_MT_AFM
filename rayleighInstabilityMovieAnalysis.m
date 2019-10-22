%% Rayleigh instability movie analysis
% Sagar Setru
% 2019 08 20
%% add paths

addpath(genpath('/Users/sagarsetru/Documents/Princeton/shaevitz/kinetochores/code/analysis/'))
addpath(genpath('/Users/sagarsetru/Documents/MATLAB/'))
addpath(genpath('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis'))


%% load rayleigh instability movie or control movie
fullFileName = uipickfiles;
%fullFileName = {'../data/2019 07 16/expt1/Stack_225-261.tif'}
%fullFileName = {'../data/2019 07 13/Stack_tpx2_20190713_68-89.tif'}
verbose = 1;
[img] = readTifStackToMatrix(fullFileName{1}, verbose);

[pathname,fname] = fileparts(fullFileName{1});

saveDir1 = [pathname,'/',fname];

if ~isdir(saveDir1)
    mkdir(saveDir1)
end
cd(saveDir1)
load('translationCoords_xc.mat')
load('translationCoords_yc.mat')
%% define point in image for registering all frames

xc = zeros(size(img,3),1);
yc = zeros(size(img,3),1);


for j = 1:size(img,3)
    
    figure(2); imagesc(img(:,:,j));
    [xc_lsFig(j),yc_lsFig(j)] = ginput(1);
    close(figure(2))
    
end
save([saveDir1,'/translationCoords_xc_lsFig.mat'],'xc_lsFig')
save([saveDir1,'/translationCoords_yc_lsFig.mat'],'yc_lsFig')

%% translate movie

removeFrames = 0;
fr_rem = [];
[img2] = center2DImg(img,xc,yc,removeFrames,fr_rem);
%[img2] = center2DImg(img,xc_lsFig,yc_lsFig,removeFrames,fr_rem);

%% save translated img (in units of nm!!)
% saveImgMatrixToTiffStack(img2.*1e9,pathname,[fname,'_translated2'],'int16')

%% pick line profile
%imgIndPick = 3;
%imgIndPick = 1;
imgIndPick = size(img2,3);
%imgIndPick = 12;

figure(10); imagesc(img2(:,:,imgIndPick));
[xi,yi] = ginput(2);
close(figure(10));


%%

ctest = improfile(img2(:,:,1),xi,yi);
cx1 = zeros(size(img,3),size(ctest,1));
cy1 = zeros(size(img,3),size(ctest,1));
c = zeros(size(img,3),size(ctest,1));

for j = 1:size(img,3)
    [cx1(j,:),cy1(j,:),c(j,:)] = improfile(img2(:,:,j),xi,yi);
    %c(j,:) = c(j,:)-min(c(j,:));
end
%% plot line profile along img
indShow = 8;
figure; imagesc(img2(:,:,indShow));
hold on;
plot(cx1(end,:),cy1(end,:),'g','LineWidth',2)

%% plot line profile along img in entire movie
for j = 1:size(img2,3)
    figure(1); imagesc(img2(:,:,j));
    hold on;
    plot(cx1(end,:),cy1(end,:),'g','LineWidth',2)
    pause;
end

%%
saveString_cx = ['cx_mt-x-',num2str(round(cx1(1))),'-',num2str(round(cx1(1,end)))];
saveString_cy = ['cy_mt-y-',num2str(round(cy1(1))),'-',num2str(round(cy1(1,end)))];
saveString_c = ['c_',saveString_cx,'_',saveString_cy];

%saveDir2 = [saveDir1,'/controlScans_',saveString_c];
%saveDir2 = [saveDir1,'/xc2yc2_',saveString_c];
saveDir2 = [saveDir1,'/',saveString_c];

if ~isdir(saveDir2)
    mkdir(saveDir2)
end

%%
save([saveDir2,'/',saveString_cx,'.mat'],'cx1')
save([saveDir2,'/',saveString_cy,'.mat'],'cy1')
save([saveDir2,'/',saveString_c,'.mat'],'c')

%%

% for kinesin, expt 2, frames 298-300
% startTime = 60; %min, 1:47 - 2:47
% endTime = 65; %min, 2:52

% for tpx2 satured, 2019 07 16
startTime = -21.67;
startTime = 0;
endTime = 134.33; % min

% for kinesin saturated, 20190715, frames 197-202
% startTime = 152; %min (times: 21:03 - 18:31)
% endTime = 174; %min (times: 21:25 - 18:31)

% for naked mt, 20190715, frames 137-143
% startTime = 0; %min, time 16:27
% endTime = 26; %min, time 16:53

% for naked mt, 20190713, frames 0-4
% startTime = 0; %min, time 1533
% endTime = 38; %min, time 1611

% for tpx2 satured, 20190713, frames 68-89
% startTime = 0; %min, time: 22:41
% endTime = 89; %min, time: 00:10 (following day)

% for tpx2 satured, 20190713, frames 98-113
%startTime = 137; %min, (time: 00:58 - 22:41
%endTime = 198; %min, time: 01:59 

% 2019 07 13 frames 90-91
% startTime = 94;% min, time 00:15
% endTime = 98; %min, time 00:19

% 2019 07 12 frame 30

my_col = jet(round(size(c,1)));

nLines = size(c,1);

% pixDist = sqrt( ( xi(2)-xi(1) ).^2 + ( yi(2)-yi(1) ).^2 );

%%

% if any values above this number, remove them;
plot_yCutoff = 10000;

doYLim = 0;
ylimMin = -30;
ylimMax = 30;

doSave = 0;
% for 2019 07 16
pix_to_nm = 2000/256;

% % for 2019 07 15
% pix_to_nm = 2000/256;

% % for 2019 07 13, frames 68-89
% pix_to_nm = 2000/256;

% for 2019 07 13, frames 0-4 (naked mts)
% pix_to_nm = 5000/256;

% for 2019 07 13, frames 98-113
%pix_to_nm = 2000/256;

% for 2019 07 12, frame 30
%pix_to_nm = 1310/356;

%for 2019 07 12, frame 11
%pix_to_nm = 2000/512;
counter=-1;
for t = [7:nLines]
    counter = counter+1;
    figure(1); hold on; box on;
    y=c(t,:)*1e9;
   % y = y-mean(y);
    y(y>plot_yCutoff) = [];
%     y = y-mean(y)+counter*12;
    %y(y>15)=[];
    %y(y<-15)=[];
%     plot(0:pix_to_nm:length(y)*pix_to_nm-pix_to_nm,y,'color',my_col(t,:),'LineWidth',2)
    %plot(0:pix_to_nm:size(c1(t,:),2)*pix_to_nm-pix_to_nm,smooth(c1(t,:)*1e9)-min(smooth(c1(t,:)*1e9)),'color',my_col(t,:))
    plot(0:pix_to_nm:size(y,2)*pix_to_nm-pix_to_nm,y,'color',my_col(t,:))

end

colormap(my_col)
colorbar('Ticks',[0, 1/4, 1/2, 3/4, 1],...
        'TickLabels',{[num2str(round(startTime)),' min'],...
        [num2str(round(startTime+((endTime-startTime)/4+4))),' min'],...
        [num2str(round(startTime+((endTime-startTime)/2+4))),' min'],...
        [num2str(round(startTime+(3*(endTime-startTime)/4+4))),' min'],...
        [num2str(round(endTime)),' min']},...
        'FontSize',12)
    
if doYLim
    ylim([ylimMin ylimMax])
end

xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'Length along MT (nm)', 'MT surface topology (nm)', xafz, yafz, tvfz )
%saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,['Instability surface vs time_',saveString_c])
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir2,'/','MT length vs time_',saveString_c])
end
%% do fourier transform (see MATLAB example fft for explanation)


doSave = 1;

indsForSpectra = [8:12];
% indsForSpectra = [1:2];
%indsForSpectra = [29:37];
%indsForSpectra = [3:4];

% define cutoff frequency
f_cutoff = .00099; %units nm^-1

[P1s,...
    f,...
    maxF_all,...
    indsForSpectra,...
    avgSpectra,...
    stdSpectra,...
    maxAmplitude,...
    maxF,...
    spacing] = spectralAnalysisAndPlotting(c,...
    indsForSpectra,...
    f_cutoff,...
    pix_to_nm,...
    doSave,...
    saveDir2,...
    saveString_c);

maxAmplitude
maxF
spacing


%
%% pick line scan per frame (not great...)

xi_pFr = zeros(size(img2,3),2);
yi_pFr = zeros(size(img2,3),2);

for t = 1:size(img2,3)
    %indPick = size(img2,3)+1-t;
    indPick = t;
    figure('units','normalized','outerposition',[0.2 0.2 .8 .8]); imagesc(img2(:,:,indPick));
    [xi_pFr(indPick,:),yi_pFr(indPick,:)] = ginput(2);
end

%%
    
    
% ctest = improfile(img2(:,:,1),xi(1,:),yi(1,:));
% cx1 = zeros(size(img,3),size(ctest,1));
% cy1 = zeros(size(img,3),size(ctest,1));
% c = zeros(size(img,3),size(ctest,1));

for j = 1:size(img,3)
    [cx1{j},cy1{j},c{j}] = improfile(img2(:,:,j),xi(j,:),yi(j,:));
    %c(j,:) = c(j,:)-min(c(j,:));
end
%%
for j = 1:numel(c)
    figure(1); hold on ;
    plot(c{j})
end

%% load fiji line scans

lineScanFiles = uipickfiles;
%%

Values_Mt = importfile_FijiLineScan(lineScanFiles{end}, 2, 218);

c_all = zeros(numel(lineScanFiles),size(Values_Mt.Y,1));

for j = 1:numel(lineScanFiles)
    
    fName = lineScanFiles{j};
    
    Values_Mt = importfile_FijiLineScan(fName, 2, 218);
    
    c_all(j,:) = Values_Mt.Y(1:size(c_all,2));
    
end

%% get power at peak over time

%c_all = c;
% define cutoff frequency
f_cutoff = .00099; %units nm^-1

% select ind at which to take power
indPMax = 2;
%maxF_all = zeros(size(indsForSpectra),1);


pix_to_nm = 2000/256;


clear P1s
clear pAtMax2
for j = 1:size(c_all,1)
    
    %ind = indsForSpectra(j);
    
    lineScan = c_all(j,:)';
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
    
    pAtMax2(j) = a(indPMax);
    
    % get freq vector
    f_cut = f(initFreqPlotInd:end);
    
    figure(2); hold on;
    plot(f_cut,a)
    set(gca, 'XScale','log')
    
    % get max frequency for this scan
    maxA_i = find(a==max(a));
    maxF_all(j) = f_cut(maxA_i);
%     pause;
end
%maxF_all

% find index
initFreqPlotInd = min(find(f>f_cutoff));

xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'f (nm^{-1})', '|P(f)|', xafz, yafz, tvfz )
%%
doSave = 0;
%figure; loglog((1:length(pAtMax))*4.33,pAtMax,'-o')
%figure; semilogx((1:length(pAtMax))*4.33,pAtMax,'-o')
figure(1); hold on; box on;
%semilogy((0:(length(pAtMax1)-1))*4.33,pAtMax1,'-o')
semilogy((0:(length(pAtMax2)-1))*4.33,pAtMax2,'-o')

set(gca, 'YScale','log')


xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 't (min)', '|P(f_{RP})| (nm/Hz)', xafz, yafz, tvfz )
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,'PeakPowerVsT_topLeftMT')
%     saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,'PeakPowerVsT_topLeftMT')
end

%%

%{
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
%}