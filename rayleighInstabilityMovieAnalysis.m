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
%
[img] = readTifStackToMatrix(fullFileName{1}, verbose);

[pathname,fname] = fileparts(fullFileName{1});

saveDir1 = [pathname,'/',fname];

if ~isdir(saveDir1)
    mkdir(saveDir1)
end
cd(saveDir1)

% set to 1 if doing translation in matlab by clicking
doTranslate = 0;


% load('translationCoords_xc.mat')
% load('translationCoords_yc.mat')
%% define point in image for registering all frames

if doTranslate
    xc = zeros(size(img,3),1);
    yc = zeros(size(img,3),1);


    for j = 1:size(img,3)

        figure(2); imagesc(img(:,:,j));
        [xc(j),yc(j)] = ginput(1);
        close(figure(2))

    end
    
    save([saveDir1,'/translationCoords_xc.mat'],'xc')
    save([saveDir1,'/translationCoords_yc.mat'],'yc')
    
end
%% translate movie

if doTranslate
    removeFrames = 0;
    fr_rem = [];
    [img2] = center2DImg(img,xc,yc,removeFrames,fr_rem);
    %[img2] = center2DImg(img,xc_lsFig,yc_lsFig,removeFrames,fr_rem);

    % save translated img (in units of nm!!)
    % saveImgMatrixToTiffStack(img2.*1e9,pathname,[fname,'_translated2'],'int16')
else
    img2 = img;
    clear img;
end


%% pick line profile
%imgIndPick = 3;
imgIndPick = 1;
% imgIndPick = size(img2,3);
% imgIndPick = 2;

figure(10); imagesc(img2(:,:,imgIndPick));
[xi,yi] = ginput(2);
close(figure(10));

ctest = improfile(img2(:,:,1),xi,yi);
cx1 = zeros(size(img2,3),size(ctest,1));
cy1 = zeros(size(img2,3),size(ctest,1));
c = zeros(size(img2,3),size(ctest,1));

for j = 1:size(img2,3)
    [cx1(j,:),cy1(j,:),c(j,:)] = improfile(img2(:,:,j),xi,yi);
    %c(j,:) = c(j,:)-min(c(j,:));
end

%% plot line profile along img
indShow = 1;
% indShow = size(img2,3);
% indShow = 7;
% indShow = 6;
figure; imagesc(img2(:,:,indShow));
hold on;
plot(cx1(end,:),cy1(end,:),'g','LineWidth',2)

%% plot line profile along img in entire movie
% for j = 1:size(img2,3)
%     figure(1); imagesc(img2(:,:,j));
%     hold on;
%     plot(cx1(end,:),cy1(end,:),'g','LineWidth',2)
%     %pause;
% end

%%
saveString_cx = ['cx_mt-x-',num2str(round(cx1(1))),'-',num2str(round(cx1(1,end)))];
saveString_cy = ['cy_mt-y-',num2str(round(cy1(1))),'-',num2str(round(cy1(1,end)))];
saveString_c = ['c_',saveString_cx,'_',saveString_cy];

% saveDir2 = [saveDir1,'/controlScans_',saveString_c];
% saveDir2 = [saveDir1,'/xc2yc2_',saveString_c];

% saveDir2 = [saveDir1,'/',saveString_c];
saveDir2 = [saveDir1,'/uncoated/',saveString_c];
% saveDir2 = [saveDir1,'/initCoated/',saveString_c];
% saveDir2 = [saveDir1,'/forPub/',saveString_c];


if ~isdir(saveDir2)
    mkdir(saveDir2)
end

%%
save([saveDir2,'/',saveString_cx,'.mat'],'cx1')
save([saveDir2,'/',saveString_cy,'.mat'],'cy1')
save([saveDir2,'/',saveString_c,'.mat'],'c')

%%


startTime = 0;
endTime = 0; %min

my_col = jet(round(size(c,1)));

nLines = size(c,1);

% pixDist = sqrt( ( xi(2)-xi(1) ).^2 + ( yi(2)-yi(1) ).^2 );

%%

% tIndsPlot = [3:39];
% tIndsPlot = [1:17];

doSave = 0;
doSmooth = 1; % set to 1 FOR PUB
% define fraction of line scan to smooth over
smoothWindowFraction = 3; 
% smoothWindowFraction = 2; 

% FOR PUBLICATION, see:
%     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261_affine/c_cx_mt-x-22-184_cy_mt-y-51-160'

% tIndsPlot = [6,8,37];
% tIndsPlot = [6,8,21];
tIndsPlot = [1];
SmoothPub1 = 5;
SmoothPub2 = 5;
SmoothPub3 = 5;
lwPub = 2;

doYLim = 1;
ylimMin = 20; % FOR PUB
% ylimMin = 0;
ylimMax = 50;
doXLim = 1;



% if any values above this number, remove them;
plot_yCutoff = 60;


% for 2019 07 16
pix_to_nm = 2000/256;

counter = -1;
clear c_flattened
for t = tIndsPlot
    counter = counter+1;
%     figure; hold on; box on;
    
    if doSmooth
        y=c(t,:)+ ( mean(c(t,:))-smooth(c(t,:),length(c)/smoothWindowFraction) )';%*1e9;
        
        % for publication plotting
        if counter == 0 
            y = y-mean(y)+25.47;
        else
            y = y-mean(y)+25.47+coatingData_mt1.film;
        end
        
        %c(t,:) = y;
        c_flattened(counter+1,:) = y;

    else
        y = c(t,:);
        %y = c(t,:)-mean(c(t,:));
    end
    
   y(y>plot_yCutoff) = [];
   %y=smooth(y);
    figure(tIndsPlot(end)); hold on; box on;

    %if doSmooth
    %    plot(0:pix_to_nm:size(y,2)*pix_to_nm-pix_to_nm,y,'color',my_col(t,:))
    %else
    xPlot = 0:pix_to_nm:size(y,2)*pix_to_nm-pix_to_nm;
   if counter == 0        
       plot(xPlot,smooth(y,SmoothPub1),'color','k','lineWidth',lwPub)
   elseif counter == 1
       plot(xPlot,smooth(y,SmoothPub2),'color','b','lineWidth',lwPub)
   elseif counter == 2
       plot(xPlot,smooth(y,SmoothPub3),'color','r','linewidth',lwPub)
   else
        plot(xPlot,y,'color',my_col(t,:))
        
   end
    %end
end
%%{
%{
colormap(my_col)
colorbar('Ticks',[0, 1/4, 1/2, 3/4, 1],...
        'TickLabels',{[num2str(round(startTime)),' min'],...
        [num2str(round(startTime+((endTime-startTime)/4+4))),' min'],...
        [num2str(round(startTime+((endTime-startTime)/2+4))),' min'],...
        [num2str(round(startTime+(3*(endTime-startTime)/4+4))),' min'],...
        [num2str(round(endTime)),' min']},...
        'FontSize',12)
    %}




if doYLim
    ylim([ylimMin ylimMax])
end

if doXLim
    xlim([min(xPlot) max(xPlot)])
end

% lgd = legend({'Uncoated','Initially coated','After droplet formation'},...
%     'Interpreter','latex',...
%     'Position',[.63 .37 .1 .1]);
lgd = legend({'Uncoated','Initially coated','After droplet formation'},...
    'Position',[.63 .37 .1 .1]);
legend boxoff
lgd.FontSize = 20;


xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;
% doLatex = 1;
% simplePlotFormat( 'Length along MT (nm)', 'Height (nm)', xafz, yafz, tvfz, axesLw, doLatex )
%saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,['Instability surface vs time_',saveString_c])

doLatex = 0;
simplePlotFormat( 'Length along microtubule (nm)', 'Height (nm)', xafz, yafz, tvfz, axesLw, doLatex )

% for pub
% saveDirMain = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures';

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir2,'/','MT length vs time_',saveString_c])
%     saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir2,'/','uncoated_initCoated_final_',saveString_c])
%     saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_uncoated_initCoated_final_',saveString_c])

end

% save([saveDir2,'/doSmooth.mat'],'doSmooth')

if doSave
    if doSmooth
        save([saveDir2,'/highPassFiltered_',saveString_c,'.mat'],'c_flattened')
        save([saveDir2,'/highPassFilter_smoothWindowFraction.mat'],'smoothWindowFraction')
    end
end
%}
%% do fourier transform (see MATLAB example fft for explanation)

% indsForSpectra = [1:37];
% indsForAverage = [10:37];%-min(indsForSpectra);
% indsForSpectra = [1:17];
% indsForAverage = [12:17];
indsForSpectra = [1];
indsForAverage = [1];


doSave = 1;
doPause = 0;
if doSmooth
    c_use = c_flattened;
else
    c_use = c;
end
    

% FOR PUBLICATION
% indsForSpectra = [6:37];
% indsForAverage = [29:37]-min(indsForSpectra)-1;


% define cutoff frequency
% f_cutoff = 0.0014;
f_cutoff = .00099; %units nm^-1


[P1s,...
    f,...
    maxF_all,...
    indsForSpectra,...
    avgSpectra,...
    stdSpectra,...
    maxAmplitude,...
    maxF,...
    spacing,...
    initFreqPlotInd,...
    f_cut,...
    plottedSpectra,...
    plottedFreq] = spectralAnalysisAndPlotting(c_use,...
    indsForSpectra,...
    f_cutoff,...
    pix_to_nm,...
    doSave,...
    saveDir2,...
    saveString_c,...
    doPause,...
    my_col,...
    startTime,...
    endTime,...
    indsForAverage);

maxAmplitude
maxF
spacing
%% for figure plotting for final pub

figure(3); hold on; box on;
plot(f_cut,P1s(initFreqPlotInd:end,1),'k','LineWidth',2)
plot(f_cut,P1s(initFreqPlotInd:end,2),'b','LineWidth',2)
plot(f_cut,P1s(initFreqPlotInd:end,end),'r','LineWidth',2)
% plot(f_cut,P1s(initFreqPlotInd:end,end-1),'k')
% plot(f_cut,P1s(initFreqPlotInd:end,end-2),'k')
xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'Frequency (nm^{-1})','Power (nm/Hz)', xafz, yafz, tvfz )
legend('Uncoated','Initially coated','After droplet formation')
legend boxoff
%plot(f_cut,P1s(initFreqPlotInd:end,end-1))
%plot(f_cut,P1s(initFreqPlotInd:end,end-2))
% plot(f_cut,P1s(initFreqPlotInd:end,end-3))
% plot(f_cut,P1s(initFreqPlotInd:end,end-4))
% plot(f_cut,P1s(initFreqPlotInd:end,end-5))

% legend(


%


%% load fiji line scans, for plotting peak vs t

lineScanFiles = uipickfiles;

%% 

% initialize matrix for loading values from fiji line scans
Values_Mt = importfile_FijiLineScan(lineScanFiles{end}, 2, 218);
c_all = zeros(numel(lineScanFiles),size(Values_Mt.Y,1));

% load the values taken from Fiji line scans into a matrix
for j = 1:numel(lineScanFiles)
    
    % get file name
    fName = lineScanFiles{j};
    
    % get the values
    Values_Mt = importfile_FijiLineScan(fName, 2, 218);
    
    % load into matrix
    c_all(j,:) = Values_Mt.Y(1:size(c_all,2));
    
    % get savedirectory
    [saveDir_pvst,saveDirName] = fileparts(fName);
    
end
%%

% c_all = c(4:end,:);
if doSmooth
    c_all = c_flattened(1:end,:);
else
    c_all = c;
end
saveDirName = 'topLeftMt';
saveDir_pvst = saveDir2;

%% get power at peak over time

% set to 1 to save data
doSave = 0;

% define cutoff frequency
f_cutoff = .00099; %units nm^-1
%f_cutoff = 0;

% define deltaT
dT = 4.25; %min

% define pixel to distance conversion
pix_to_nm = 2000/256;

% select ind at which to take power
% YOU HAVE TO CHANGE THIS PER LINE SCAN!!!
indPMax = 9;

clear P1s
clear pAtMax

pAtMax = zeros(size(c_all,1),1);

t_pMax = (0:(length(pAtMax))-1)*dT;

% for top left mt from 2019 10 16: removing blurry middle frame
if strcmp(saveDir_pvst,'/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 16 tpx2 brb80/expt2/valuesForPowerVsT_TopLeftMt')
    t_pMax(end) = t_pMax(end)+dT
end

my_col = jet(round(size(c_all,1)));

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
    
    pAtMax(j) = P1(indPMax);
    
    
    % get freq vector
    f_cut = f(initFreqPlotInd:end);
    
    figure(10); hold on;
    plot(f_cut,a,'color',my_col(j,:))
    set(gca, 'XScale','log')
    %pause
    % get max frequency for this scan
    maxA_i = find(a==max(a));
    maxF_all(j) = f_cut(maxA_i);
%     pause;
end
%maxF_all

% find index, then use this at the top of the loop 
% indToUseForPMax = find(f==mode(maxF_all))

xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'f (nm^{-1})', '|P(f)|', xafz, yafz, tvfz )


if doSave
    save([saveDir_pvst,'/powerAtMaxF_',saveDirName,'.mat'],'pAtMax')
    save([saveDir_pvst,'/powerAtMaxF_',saveDirName,'_tStamps.mat'],'t_pMax')
    save([saveDir_pvst,'/powerAtMaxF_',saveDirName,'_indforPeakF.mat'],'indPMax')
    save([saveDir_pvst,'/powerAtMaxF_',saveDirName,'_peakF_inLineScans.mat'],'maxF_all')
end
%

% doSave = 0;


%figure; loglog((1:length(pAtMax))*4.33,pAtMax,'-o')
%figure; semilogx((1:length(pAtMax))*4.33,pAtMax,'-o')
figure(1); hold on; box on;
%semilogy((0:(length(pAtMax1)-1))*4.33,pAtMax1,'-o')
semilogy(t_pMax,pAtMax,'-o')
set(gca, 'YScale','log')


xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 't (min)', '|P(f_{RP})| (nm/Hz)', xafz, yafz, tvfz )


%%
saveDirMain = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures';

% set to 1 to use amplitude spectrum, otherwise uses power
doAmpSpec = 1;


doSave = 1;

doYLim = 1;
yMinPlot = 0.1;
yMaxPlot = 4;

if ~doAmpSpec
    yMinPlot = yMinPlot.^2;
    yMaxPlot = yMaxPlot.^2;
end

doXLim = 1;
tMaxPlot = 150;

%pick delta t for linearized time
deltaTLin = 4.25;

%max for averaging
tMaxPlotAvg = 51; %min

% set to 1 to do bootstrp analysis for mean and conf int
doBootStrp = 1;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/powerAtMaxF_Values_37_bottomRightMt_tStamps.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/powerAtMaxF_Values_37_bottomRightMt.mat')
t_pMax1 = t_pMax;
pAtMax1 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/powerAtMaxF_Values_37_topLeftMt_tStamps.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/powerAtMaxF_Values_37_topLeftMt.mat')
t_pMax2 = t_pMax;
pAtMax2 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 16 tpx2 brb80/expt2/valuesForPowerVsT_TopLeftMt/powerAtMaxF_Values_7_topLeft.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 16 tpx2 brb80/expt2/valuesForPowerVsT_TopLeftMt/powerAtMaxF_Values_7_topLeft_tStamps.mat')
t_pMax3 = t_pMax;
pAtMax3 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 16 tpx2 brb80/expt2/valuesForPowerVsT_BottomAcrossMt/powerAtMaxF_Values_8_bottomAcross.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 16 tpx2 brb80/expt2/valuesForPowerVsT_BottomAcrossMt/powerAtMaxF_Values_8_bottomAcross_tStamps.mat')
t_pMax4 = t_pMax;
pAtMax4 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/powerAtMaxF_LeftBottomMt_tStamps.mat')
t_pMax5 = t_pMax;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/powerAtMaxF_LeftBottomMt.mat')
pAtMax5 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166/powerAtMaxF_RightMt_tStamps.mat')
t_pMax6 = t_pMax;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166/powerAtMaxF_RightMt.mat')
pAtMax6 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/powerAtMaxF_LeftMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/powerAtMaxF_LeftMt_tStamps.mat')
t_pMax7 = t_pMax;
pAtMax7 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-219-249_cy_mt-y-142-167/powerAtMaxF_RightTinyMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-219-249_cy_mt-y-142-167/powerAtMaxF_RightTinyMt_tStamps.mat')
t_pMax8 = t_pMax;
pAtMax8 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/powerAtMaxF_LeftTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/powerAtMaxF_LeftTopMt_tStamps.mat')
t_pMax9 = t_pMax;
pAtMax9 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83/powerAtMaxF_RightTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83/powerAtMaxF_RightTopMt_tStamps.mat')
t_pMax10 = t_pMax;
pAtMax10 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-123-178_cy_mt-y-57-119/powerAtMaxF_MiddleTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-123-178_cy_mt-y-57-119/powerAtMaxF_MiddleTopMt_tStamps.mat')
t_pMax11 = t_pMax;
pAtMax11 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/powerAtMaxF_MiddleTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/powerAtMaxF_MiddleTopMt_tStamps.mat')
t_pMax12 = t_pMax;
pAtMax12 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/powerAtMaxF_MiddleTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/powerAtMaxF_MiddleTopMt_tStamps.mat')
t_pMax13 = t_pMax;
pAtMax13 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123/powerAtMaxF_AcrossMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123/powerAtMaxF_AcrossMt_tStamps.mat')
t_pMax14 = t_pMax;
pAtMax14 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192/powerAtMaxF_AcrossBottomMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192/powerAtMaxF_AcrossBottomMt_tStamps.mat')
t_pMax15 = t_pMax;
pAtMax15 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120/powerAtMaxF_TopMiddlMt_tStamps.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120/powerAtMaxF_TopMiddlMt.mat')
t_pMax16 = t_pMax;
pAtMax16 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71/powerAtMaxF_diagonalMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71/powerAtMaxF_diagonalMt_tStamps.mat')
t_pMax17 = t_pMax;
pAtMax17 = pAtMax;


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-181-206_cy_mt-y-44-251/powerAtMaxF_rightMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-181-206_cy_mt-y-44-251/powerAtMaxF_rightMt_tStamps.mat')
t_pMax18 = t_pMax;
pAtMax18 = pAtMax;


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249/powerAtMaxF_middleMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249/powerAtMaxF_middleMt_tStamps.mat')
t_pMax19 = t_pMax;
pAtMax19 = pAtMax;


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4/powerAtMaxF_topLeftMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4/powerAtMaxF_topLeftMt_tStamps.mat')
t_pMax20 = t_pMax;
pAtMax20 = pAtMax;


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250/powerAtMaxF_bottomLeftMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250/powerAtMaxF_bottomLeftMt_tStamps.mat')
t_pMax21 = t_pMax;
pAtMax21 = pAtMax;


figure; hold on; box on;


time_powerAtPeak = {...
    t_pMax1,...
    t_pMax2,...
    t_pMax3,...
    t_pMax4,...
    t_pMax5,...
    t_pMax6,...
    t_pMax7,...
    t_pMax8,...
    t_pMax9,...
    t_pMax10,...
    t_pMax11,...
    t_pMax12,...
    t_pMax13,...
    t_pMax14,...
    t_pMax15,...
    t_pMax16,...
    t_pMax17,...
    t_pMax18,...
    t_pMax19,...
    t_pMax20,...
    t_pMax21,...
    };

power_powerAtPeak = {...
    pAtMax1,...
    pAtMax2,...
    pAtMax3,...
    pAtMax4,...
    pAtMax5,...
    pAtMax6,...
    pAtMax7,...
    pAtMax8,...
    pAtMax9,...
    pAtMax10,...
    pAtMax11,...
    pAtMax12,...
    pAtMax13,...
    pAtMax14,...
    pAtMax15,...
    pAtMax16,...
    pAtMax17,...
    pAtMax18,...
    pAtMax19,...
    pAtMax20,...
    pAtMax21,...
    };

set(gca, 'YScale','log')

% xafz = 24;
% yafz = 24;
% tvfz = 20;
% axesLw = 2;
% doLatex = 1;
% simplePlotFormat( 'Time (min)', 'Power at most unstable frequency (nm/Hz)', xafz, yafz, tvfz, axesLw, doLatex )


%{
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir_pvst,'/','PeakPowerVsT_',saveDirName])
end
%}

% average all power vs time via interpolation

% get all the time vectors
t_all = [...
    t_pMax1,...
    t_pMax2,...
    t_pMax3,...
    t_pMax4,...
    t_pMax5,...
    t_pMax6,...
    t_pMax7,...
    t_pMax8,...
    t_pMax9,...
    t_pMax10,...
    t_pMax11,...
    t_pMax12,...
    t_pMax13,...
    t_pMax14,...
    t_pMax15,...
    t_pMax16,...
    t_pMax17,...
    t_pMax18,...
    t_pMax19,...
    t_pMax20,...
    t_pMax21,...
    ];
t_all = sort(t_all);

t_min = min(t_all);
t_max = max(t_all);

tLin = [t_min:deltaTLin:t_max];


p1i = interp1(t_pMax1(:),pAtMax1(:),tLin(:),'linear','extrap');
p2i = interp1(t_pMax2(:),pAtMax2(:),tLin(:),'linear','extrap');
p3i = interp1(t_pMax3(:),pAtMax3(:),tLin(:),'linear','extrap');
p4i = interp1(t_pMax4(:),pAtMax4(:),tLin(:),'linear','extrap');
p5i = interp1(t_pMax5(:),pAtMax5(:),tLin(:),'linear','extrap');
p6i = interp1(t_pMax6(:),pAtMax6(:),tLin(:),'linear','extrap');
p7i = interp1(t_pMax7(:),pAtMax7(:),tLin(:),'linear','extrap');
p8i = interp1(t_pMax8(:),pAtMax8(:),tLin(:),'linear','extrap');
p9i = interp1(t_pMax9(:),pAtMax9(:),tLin(:),'linear','extrap');
p10i = interp1(t_pMax10(:),pAtMax10(:),tLin(:),'linear','extrap');
p11i = interp1(t_pMax11(:),pAtMax11(:),tLin(:),'linear','extrap');
p12i = interp1(t_pMax12(:),pAtMax12(:),tLin(:),'linear','extrap');
p13i = interp1(t_pMax13(:),pAtMax13(:),tLin(:),'linear','extrap');
p14i = interp1(t_pMax14(:),pAtMax14(:),tLin(:),'linear','extrap');
p15i = interp1(t_pMax15(:),pAtMax15(:),tLin(:),'linear','extrap');
p16i = interp1(t_pMax16(:),pAtMax16(:),tLin(:),'linear','extrap');
p17i = interp1(t_pMax17(:),pAtMax17(:),tLin(:),'linear','extrap');
p18i = interp1(t_pMax18(:),pAtMax18(:),tLin(:),'linear','extrap');
p19i = interp1(t_pMax19(:),pAtMax19(:),tLin(:),'linear','extrap');
p20i = interp1(t_pMax20(:),pAtMax20(:),tLin(:),'linear','extrap');
p21i = interp1(t_pMax21(:),pAtMax21(:),tLin(:),'linear','extrap');



pAll = [p1i,...
    p2i,...
    p3i,...
    p4i,...
    p5i,...
    p6i,...
    p7i,...
    p8i,...
    p9i,...
    p10i,...
    p11i,...
    p12i,...
    p13i,...
    p14i,...
    p15i,...
    p16i,...
    p17i,...
    p18i,...
    p19i,...
    p20i,...
    p21i,...
    ];


 
if doBootStrp
    
    nboot = 10000;
    pAvg = bootstrp(nboot,@mean,pAll');
    pci = bootci(nboot,@mean,pAll');
    
    tLinPlot = tLin(tLin < tMaxPlotAvg);
    pAvgPlot = pAvg(:,1:length(tLinPlot));
    pci = pci(:,1:length(tLinPlot));
    
    alphaValCi=.5;
    
    if doAmpSpec
        plot(tLinPlot,mean(pAvgPlot),'Color','k','LineWidth',2)
        shadedplot(tLinPlot,pci(1,:),pci(2,:),alphaValCi,'k','k');
    else
        plot(tLinPlot,mean(pAvgPlot).^2,'Color','k','LineWidth',2)
        shadedplot(tLinPlot,pci(1,:).^2,pci(2,:).^2,alphaValCi,'k','k');
    end
    
else

    if doAmpSpec
        pAvg = mean(pAll,2);
        pSem = std(pAll,0,2)./sqrt(size(pAll,2));
    else
        pAvg = mean(pAll.^2,2);
        pSem = std(pAll.^2,0,2)./sqrt(size(pAll,2));
    end

    tLinPlot = tLin(tLin < tMaxPlotAvg);
    pAvgPlot = pAvg(1:length(tLinPlot));
    pSemPlot = pSem(1:length(tLinPlot));
    p1 = errorbar(tLinPlot,pAvgPlot,pSemPlot,'LineWidth',2,'color','k');

end

% guideToEyeX = [min(tLinPlot):tLinPlot(10)];
% guideToEyeY = exp(.023*guideToEyeX)-.5;

opacityVal2 = .75;

indMinFit = 1;
indMaxFit = 6;

if doBootStrp == 1
    
    X = tLinPlot(indMinFit:indMaxFit);
    
    if doAmpSpec
        yInit = mean(pAvgPlot);
        Y = yInit(indMinFit:indMaxFit)';
    else
        yInit = mean(pAvgPlot).^2;
        Y = yInit(indMinFit:indMaxFit)';
    end
    % Y = mean(pAvgPlot(indMinFit:indMaxFit));

else
    
    X = tLinPlot(indMinFit:indMaxFit);
    Y = pAvgPlot(indMinFit:indMaxFit);
    
end


log_y = log(Y);
A = zeros(length(X), 2);
A(:, 1) = X;
A(:, 2) = ones(size(A(:, 1)));

soln = inv(A'*A)*A'*log_y;
a = soln(1);
C = exp(soln(2));

exp_fit = C*exp(a*X);

p2=plot(X,exp_fit,'r-','LineWidth',4);
p2.Color(4) = opacityVal2;

%goodness of fit calc

% residual sum of squares
ss_res = sum((exp_fit'-Y).^2);

% total sum of squares, ie variance
ss_tot = var(Y);

% get rSquared
rSquared = 1 - (ss_res/ss_tot)
X(end)


set(gca, 'YScale','log')

if doYLim
    ylim([yMinPlot yMaxPlot])
end

if doXLim
    xlim([0 tMaxPlot])
end

xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;
% doLatex = 1;
doLatex = 0;

if doAmpSpec
    simplePlotFormat( 'Time \itt\rm (min)', 'Spectral amplitude (nm)', xafz, yafz, tvfz, axesLw, doLatex )
else
    simplePlotFormat( 'Time \itt\rm (min)', 'Spectral power (nm^2)', xafz, yafz, tvfz, axesLw, doLatex )
end

% do legend
% legend({'Mean peak power',...
%     '$\propto e^{\sigma_{\mathrm{max}} t}$'},...
%     'Interpreter','latex',...
%     'Location','Southeast')
% legend({'Mean peak power',...
%     '\propto e^{\sigma_{max} t}'},...
%     'Location','Southeast')
legend({'Mean peak power',...
    '\propto exp(\sigma_{max}\itt\rm)'},...
    'Location','Southeast')
legend boxoff
%, $\sigma=0.03$ min$^{-1}$'

opacityVal=.25;

ps = '.k';


if doAmpSpec
    p1=semilogy(t_pMax1,pAtMax1,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax2,pAtMax2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax3,pAtMax3,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax4,pAtMax4,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax5,pAtMax5,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax6,pAtMax6,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax7,pAtMax7,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax8,pAtMax8,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax9,pAtMax9,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax10,pAtMax10,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax11,pAtMax11,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax12,pAtMax12,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax13,pAtMax13,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax14,pAtMax14,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax15,pAtMax15,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax16,pAtMax16,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax17,pAtMax17,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax18,pAtMax18,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax19,pAtMax19,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax20,pAtMax20,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax21,pAtMax21,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
else
    p1=semilogy(t_pMax1,pAtMax1.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax2,pAtMax2.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax3,pAtMax3.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax4,pAtMax4.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax5,pAtMax5.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax6,pAtMax6.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax7,pAtMax7.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax8,pAtMax8.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax9,pAtMax9.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax10,pAtMax10.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax11,pAtMax11.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax12,pAtMax12.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax13,pAtMax13.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax14,pAtMax14.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax15,pAtMax15.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax16,pAtMax16.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax17,pAtMax17.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax18,pAtMax18.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax19,pAtMax19.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax20,pAtMax20.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

    p1=semilogy(t_pMax21,pAtMax21.^2,ps,'LineWidth',.5);
    p1.Color(4) = opacityVal;
    set(get(get(p1(1),'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

end


if doSave
    if doBootStrp
        if doAmpSpec
            saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_AvgPeakPowerVsT_individualCurvesOverlay_bootstrp'])
            save([saveDirMain,'/sigmaFit_bootStrp.mat'],'a')
            save([saveDirMain,'/rSquaredFit_bootStrp.mat'],'rSquared')
        else
            saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_AvgPeakPowerVsT_individualCurvesOverlay_bootstrp_powerSpec'])
            save([saveDirMain,'/sigmaFit_bootStrp_powerSpec.mat'],'a')
            save([saveDirMain,'/rSquaredFit_bootStrp_powerSpec.mat'],'rSquared')
        end
    else
        if doAmpSpec
            saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_AvgPeakPowerVsT_individualCurvesOverlay'])
            save([saveDirMain,'/sigmaFit.mat'],'a')
            save([saveDirMain,'/rSquaredFit.mat'],'rSquared')
        else
            saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_AvgPeakPowerVsT_individualCurvesOverlay_powerSpec'])
            save([saveDirMain,'/sigmaFit_powerSpec.mat'],'a')
            save([saveDirMain,'/rSquaredFit_powerSpec.mat'],'rSquared')
        end
    end
%         saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir_pvst,'/','AvgPeakPowerVsT_',saveDirName])
end

%{
set(gca, 'YScale','log')


xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 't (min)', '|P(f_{RP})| (nm/Hz)', xafz, yafz, tvfz )

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/PeakPowerVsT_all'])
end
%}

%% make pub figure panel
% figure; hold on;
% 
% imgPlot = img(:,:,8);
% imgPlot = imgPlot - min(imgPlot(:));
% % imgPlot = medfilt2(imgPlot,[2 2]);
% subplot(3,1,1); imagesc( imgPlot );
% 
% colorbar;
% colormap hsv
% 
% imgPlot = img(:,:,14);
% imgPlot = imgPlot - min(imgPlot(:));
% % imgPlot = medfilt2(imgPlot,[2 2]);
% subplot(3,1,2); imagesc( imgPlot );
% 
% colorbar;
% colormap hsv

doSave = 0;

maxVal = 56;

minVal = 0;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/topoImgPlot.mat')
% imgPlot = img;
% imgPlot = imgPlot - min(imgPlot(:));
imgPlot(imgPlot>maxVal)=maxVal;
imgPlot(imgPlot<minVal)=minVal;
% imgPlot = medfilt2(imgPlot,[2 2]);
% imgPlot = medfilt2(imgPlot,[2 2]);
% subplot(3,1,3); imagesc( imgPlot );
%
medFiltVal = 5;
figure; imagesc( medfilt2(imgPlot(:,10:170),[medFiltVal medFiltVal]) );
set(gca,'xtick',[])
set(gca,'ytick',[])
% set(gca,'visible','off')
box on
set(gca,'LineWidth',2)
% set(gca,'LineWidth',4)

% mycolormap = customcolormap([0 0.18 0.3 1], [1 0 0; 0 0 1; .5 .5 .5; 0 0 0]);

mycolormap = customcolormap([0 0.1 0.3 0.5 0.7 1], [.6 0 0; .8 0 0; .7 .7 .7; .5 .5 .5; .3 .3 .3; .2 .2 .2]);
% mycolormap = customcolormap([0 0.1 0.3 1], [.6 0 0; .8 0 0; .7 .7 .7; .2 .2 .2]);

mycolormap = customcolormap([0 0.1 0.3 1], [1 0 0; 1 0 0; .5 .5 .5; 0 0 0]);

% pool white brown
% mycolormap = customcolormap(linspace(0,1,11), {'#523107','#523107','#bf812c','#e2c17e','#f3e9c4','#f6f4f4','#cae9e3','#81cdc1','#379692','#01665e','#003d2e'});

% red white blue ORIGINAL
mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#b5172f','#d75f4e','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});

% red white blue COLORS EDITED
% mycolormap = customcolormap(linspace(0,1,11), {'#68011d','#68011d','#b5172f','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});

% red white blue LINSPACE EDITED
mycolormap = customcolormap([0 .09 .18 .27 .36 .5 .6 .7 .8 .9 1], {'#68011d','#68011d','#b5172f','#f7a580','#fedbc9','#f5f9f3','#d5e2f0','#93c5dc','#4295c1','#2265ad','#062e61'});

% red yellow blue
% mycolormap = customcolormap(linspace(0,1,11), {'#a60026','#d83023','#f66e44','#faac5d','#ffdf93','#ffffbd','#def4f9','#abd9e9','#73add2','#4873b5','#313691'});

% pastel jet
% mycolormap = customcolormap([0 .25 .5 .75 1], {'#9d0142','#f66e45','#ffffbb','#65c0ae','#5e4f9f'});

% mycolormap = customcolormap([0 .3 .8 1], {'#fbeed7','#ffba5a','#ff7657','#665c84'});
c = colorbar;
% c = colorbar('westoutside');
% colorbar('westoutside')
colormap(mycolormap)
caxis([0 50])
% colormap jet
% colormap parula
% colormap hot
c.LineWidth = 2;
% c.LineWidth = 4;

c.FontSize = 16;
% c.FontSize = 32;

% c.TickLabelInterpreter = 'latex';
% ylabel(c,'Height (nm)','FontSize',20,'Interpreter','latex');
ylabel(c,'Height (nm)','FontSize',20);
% ylabel(c,'Height (nm)','FontSize',40);

daspect([1 1 1])
% daspect([120 161 1])
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_afmTimeLapse_RedWhiteBlue2'])
end
%%
colormap parula
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_afmTimeLapse_parula'])
end

%% make ct tpx2 topography

doSave = 0;

minVal = 0;
maxVal = 35;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/ct_tpx2_topo/imgTopo_raw_ct_tpx2.mat')

imgTopo_ct_tpx2(imgTopo_ct_tpx2>maxVal)=maxVal;
imgTopo_ct_tpx2(imgTopo_ct_tpx2<minVal)=minVal;
% imgPlot = medfilt2(imgPlot,[2 2]);
% imgPlot = medfilt2(imgPlot,[2 2]);
% subplot(3,1,3); imagesc( imgPlot );
%
figure; imagesc( imgTopo_ct_tpx2 );
set(gca,'xtick',[])
set(gca,'ytick',[])
% set(gca,'visible','off')
box on
 set(gca,'LineWidth',2)

c = colorbar;
colormap jet
% colormap hot
c.LineWidth = 2;
c.FontSize = 16;
c.Ticks = [0,10,20,30];
% c.TickLabelInterpreter = 'latex';
% ylabel(c,'Height (nm)','FontSize',20,'Interpreter','latex');
ylabel(c,'Height (nm)','FontSize',20);
% daspect([size(imgTopo_ct_tpx2,1) size(imgTopo_ct_tpx2,2) 1])
% daspect([1 1 1])

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/ct_tpx2_topo/','sansSerif_afm_ctTopo_jet'])
end
% 
% colormap parula
% if doSave
%     saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_afmTimeLapse_parula'])
% end

%% make kinesin topography

doSave = 0;

minVal = 0;
maxVal = 35;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/kinesin_topo/imgTopo_raw_kin.mat')

imgTopo_kin(imgTopo_kin>maxVal)=maxVal;
imgTopo_kin(imgTopo_kin<minVal)=minVal;
% imgPlot = medfilt2(imgPlot,[2 2]);
% imgPlot = medfilt2(imgPlot,[2 2]);
% subplot(3,1,3); imagesc( imgPlot );
%
figure; imagesc( imgTopo_kin );
set(gca,'xtick',[])
set(gca,'ytick',[])
% set(gca,'visible','off')
box on
 set(gca,'LineWidth',2)

c = colorbar;
colormap jet
% colormap hot
c.LineWidth = 2;
c.FontSize = 16;
c.Ticks = [0,10,20,30];
% c.TickLabelInterpreter = 'latex';
% ylabel(c,'Height (nm)','FontSize',20,'Interpreter','latex');
ylabel(c,'Height (nm)','FontSize',20);
% daspect([size(imgTopo_ct_tpx2,1) size(imgTopo_ct_tpx2,2) 1])
% daspect([1 1 1])

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/kinesin_topo/','sansSerif_afm_kinTopo_jet'])
end
% 
% colormap parula
% if doSave
%     saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_afmTimeLapse_parula'])
% end

%% quick pick line profile
% DO TO REVISE AFM PLOT, IF NEEDED
[xi,yi] = ginput(2);
close(figure(10));

% ctest = improfile(imgPlot(:,:,1),xi,yi);
% cx1 = zeros(size(imgPlot,3),size(ctest,1));
% cy1 = zeros(size(imgPlot,3),size(ctest,1));
% c = zeros(size(imgPlot,3),size(ctest,1));


    [cx1,cy1,c] = improfile(imgPlot,xi,yi);


%% quick edit of plotted fig
% open('PowerSpectrum_c_cx_mt-x-22-184_cy_mt-y-51-160.fig')
open('MT length vs time_c_cx_mt-x-22-184_cy_mt-y-51-160.fig')
lines = findobj(gcf,'Type','Line');
for i = 1:numel(lines)
  lines(i).LineWidth = 2.0;
end
   xafz = 14;
    yafz = 14;
    tvfz = 12;
    simplePlotFormat( 'Wavenumber (nm^{-1})', 'Power (nm/Hz)', xafz, yafz, tvfz )
    saveDir =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261_affine/c_cx_mt-x-22-184_cy_mt-y-51-160';
%%
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir,'/PowerSpectrum_c_cx_mt-x-22-184_cy_mt-y-51-160_lw2'])
