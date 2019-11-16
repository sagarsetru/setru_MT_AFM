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
%imgIndPick = 1;
imgIndPick = size(img2,3);
%imgIndPick = 2;

figure(10); imagesc(img2(:,:,imgIndPick));
[xi,yi] = ginput(2);
close(figure(10));


%

ctest = improfile(img2(:,:,1),xi,yi);
cx1 = zeros(size(img2,3),size(ctest,1));
cy1 = zeros(size(img2,3),size(ctest,1));
c = zeros(size(img2,3),size(ctest,1));

for j = 1:size(img2,3)
    [cx1(j,:),cy1(j,:),c(j,:)] = improfile(img2(:,:,j),xi,yi);
    %c(j,:) = c(j,:)-min(c(j,:));
end

%% plot line profile along img
indShow = size(img2,3);
% indShow = 7;
% indShow = 4;
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


startTime = 0;
endTime = 97.75; %min

% for 4x tpx2 fl 2019 10 31, pan 2
% startTime = 0;
% endTime = 13; %min
% for kinesin, expt 2, frames 298-300
% startTime = 60; %min, 1:47 - 2:47
% endTime = 65; %min, 2:52

% for tpx2 satured, 2019 07 16
% startTime = -21.67;
% startTime = 0;
% endTime = 134.33; % min

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

doSave = 1;
doSmooth = 1;
% define fraction of line scan to smooth over
smoothWindowFraction = 2; 

% if any values above this number, remove them;
plot_yCutoff = 60;

doYLim = 0;
ylimMin = 0;
ylimMax = 50;
doXLim = 1;


tIndsPlot = [1:4];
%tIndsPlot = [6:37];
% tIndsPlot = [1:23];

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
% [6,7,37]
clear c_flattened
for t = tIndsPlot
    counter = counter+1;
    figure(1); hold on; box on;
    
    if doSmooth
        y=c(t,:)+ ( mean(c(t,:))-smooth(c(t,:),length(c)/smoothWindowFraction) )';%*1e9;
        
        % for publication plotting
%         if counter == 0 
%             y = y-mean(y)+25.47;
%         else
%             y = y-mean(y)+25.47+coatingData_mt1.film;
%         end
        %c(t,:) = y;
        c_flattened(counter+1,:) = y;

    else
        y = c(t,:);
        %y = c(t,:)-mean(c(t,:));
    end
    
   y(y>plot_yCutoff) = [];
   %y=smooth(y);
    figure(1); hold on; box on;

    %if doSmooth
    %    plot(0:pix_to_nm:size(y,2)*pix_to_nm-pix_to_nm,y,'color',my_col(t,:))
    %else
    xPlot = 0:pix_to_nm:size(y,2)*pix_to_nm-pix_to_nm;
%    if counter == 0        
%        plot(xPlot,y,'color','k','lineWidth',2)
%    elseif counter == 1
%        plot(xPlot,y,'color','b','lineWidth',2)
%    elseif counter == 2
%        plot(xPlot,y,'color','r','linewidth',2)
%    else
        plot(xPlot,y,'color',my_col(t,:))
        
%    end
    %end
end
%%{
%%{
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

% legend('Uncoated','Initially coated','After droplet formation')
% legend boxoff

xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'Length along MT (nm)', 'Height (nm)', xafz, yafz, tvfz )
%saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,['Instability surface vs time_',saveString_c])
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir2,'/','MT length vs time_',saveString_c])
end

save([saveDir2,'/doSmooth.mat'],'doSmooth')

if doSave
    if doSmooth
        save([saveDir2,'/highPassFiltered_',saveString_c,'.mat'],'c_flattened')
        save([saveDir2,'/highPassFilter_smoothWindowFraction.mat'],'smoothWindowFraction')
    end
end
%}
%% do fourier transform (see MATLAB example fft for explanation)


doSave = 1;
doPause = 0;
if doSmooth
    c_use = c_flattened;
else
    c_use = c;
end
    


%indsForSpectra = [17:23];
% indsForSpectra = [1:4];


% FOR PUBLICATION
% indsForSpectra = [6:37];
% indsForAverage = [29:37]-min(indsForSpectra)-1;

indsForSpectra = [1:23];
indsForAverage = [14:23]-min(indsForSpectra)-1;

indsForSpectra = [1:4];
indsForAverage = [1:4];
%indsForSpectra = [29:37];
%indsForSpectra = [3:4];

% define cutoff frequency
% f_cutoff = 0.0014;
f_cutoff = .00099; %units nm^-1
% f_cutoff = 0;
% c=c(1:2,:);
% c=c(2:3,:);
%c=[c(1,:);c(3,:)];

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
c_all = c_flattened(4:end,:);
saveDirName = 'MiddleTopMt';
saveDir_pvst = saveDir2;

%% get power at peak over time

% set to 1 to save data
doSave = 1;

% define cutoff frequency
f_cutoff = .00099; %units nm^-1
%f_cutoff = 0;

% define deltaT
dT = 4.283; %min

% define pixel to distance conversion
pix_to_nm = 2000/256;

% select ind at which to take power
% YOU HAVE TO CHANGE THIS PER LINE SCAN!!!
indPMax = 8;

clear P1s
clear pAtMax

pAtMax = zeros(size(c_all,1),1);

t_pMax = (0:(length(pAtMax)-1))*dT;

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

doSave = 0;

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

figure(2); hold on; box on;
semilogy(t_pMax1,pAtMax1,'-k','LineWidth',.5)
semilogy(t_pMax2,pAtMax2,'-k','LineWidth',.5)
semilogy(t_pMax3,pAtMax3,'-k','LineWidth',.5)
semilogy(t_pMax4,pAtMax4,'-k','LineWidth',.5)
semilogy(t_pMax5,pAtMax5,'-k','LineWidth',.5)
semilogy(t_pMax6,pAtMax6,'-k','LineWidth',.5)
semilogy(t_pMax7,pAtMax7,'-k','LineWidth',.5)
semilogy(t_pMax8,pAtMax8,'-k','LineWidth',.5)
semilogy(t_pMax9,pAtMax9,'-k','LineWidth',.5)
semilogy(t_pMax10,pAtMax10,'-k','LineWidth',.5)
semilogy(t_pMax11,pAtMax11,'-k','LineWidth',.5)



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
    };

set(gca, 'YScale','log')


xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'Time (min)', 'Power at most unstable frequency (nm/Hz)', xafz, yafz, tvfz )

ylim([0.1 4])
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir_pvst,'/','PeakPowerVsT_',saveDirName])
end


% average all power vs time via interpolation

doSave = 0;
tMaxPlot = 48; %min
doXLim = 0;

%pick delta t for linearized time
deltaTLin = 4;

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
    ];

pAvg = mean(pAll,2);
pSem = std(pAll,0,2)./sqrt(7);

tLinPlot = tLin(tLin < tMaxPlot);
pAvgPlot = pAvg(1:length(tLinPlot));
pSemPlot = pSem(1:length(tLinPlot));

%figure;
%box on;

% plot(tLin,pAvg)
% errorbar(tLin,pAvg,pSem)

plot(tLinPlot,pAvgPlot)
errorbar(tLinPlot,pAvgPlot,pSemPlot,'LineWidth',3,'color','k')


set(gca, 'YScale','log')
% ylim([.04 10])
ylim([0.1 4])
if doXLim
xlim([0 tMaxPlot])
end

% xafz = 14;
% yafz = 14;
% tvfz = 12;
% simplePlotFormat( 'Time (min)', 'Average |P(f_{RP})| +/- SEM (nm/Hz)', xafz, yafz, tvfz )

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir_pvst,'/','AvgPeakPowerVsT_individualCurvesOverlay'])
%         saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDir_pvst,'/','AvgPeakPowerVsT_',saveDirName])

end

%{
test = mean([pAtMax1(1:4),...
            pAtMax2(1:4),...
            pAtMax3(1:4),...
            pAtMax4(1:4)]);
testsem = std([pAtMax1(1:4),...
            pAtMax2(1:4),...
            pAtMax3(1:4),...
            pAtMax4(1:4)])/sqrt(4);
        errorbar(t_pMax1(1:4),test,testsem,'-kx','LineWidth',2)
      
  %}
set(gca, 'YScale','log')


xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 't (min)', '|P(f_{RP})| (nm/Hz)', xafz, yafz, tvfz )

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/PeakPowerVsT_all'])
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

%% pick line scan per frame (not great...)

% xi_pFr = zeros(size(img2,3),2);
% yi_pFr = zeros(size(img2,3),2);
% 
% for t = 1:size(img2,3)
%     %indPick = size(img2,3)+1-t;
%     indPick = t;
%     figure('units','normalized','outerposition',[0.2 0.2 .8 .8]); imagesc(img2(:,:,indPick));
%     [xi_pFr(indPick,:),yi_pFr(indPick,:)] = ginput(2);
% end

%%
    
    
% ctest = improfile(img2(:,:,1),xi(1,:),yi(1,:));
% cx1 = zeros(size(img,3),size(ctest,1));
% cy1 = zeros(size(img,3),size(ctest,1));
% c = zeros(size(img,3),size(ctest,1));

% for j = 1:size(img,3)
%     [cx1{j},cy1{j},c{j}] = improfile(img2(:,:,j),xi(j,:),yi(j,:));
%     %c(j,:) = c(j,:)-min(c(j,:));
% end
% %%
% for j = 1:numel(c)
%     figure(1); hold on ;
%     plot(c{j})
% end
%%
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
