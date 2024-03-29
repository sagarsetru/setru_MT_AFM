% Script to plot individual line scans per MT (for reviewer response)
% Sagar Setru
% 2019 03 25
%%

addpath(genpath('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis'))

% for saving
psp.doSave = 1;
psp.saveDirMain =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra/';

% main path for running scripts to load height data
runDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/';

%% plot style parameters, for all plots

% colors for line scans
psp.unColor = 'k';
psp.initColor = 'b';
psp.dropColor = 'r';
psp.missingLineSpec = ':';

% wavelength marker properties
psp.lmbColor = 'k';
psp.lmbMarker = 'o';
psp.lmbMarkerSize = 20;

% whether to follow specified x or y lim
psp.doXlimSpec = 1;
psp.doYlimSpec = 0;

% for plotting psd vs asd
psp.doPsd = 1;
if psp.doPsd == 1
    psp.yAxisLabel2 = 'Spectral power (nm^2)';
else
    psp.yAxisLabel2 = 'Spectral amplitude (nm)'; % for spectra
end
psp.xAxisLabel2 = 'Inverse wavelength 1/\lambda (nm^{-1})'; % for spectra

% for plotting individual power spectra data points as scatter
psp.doScatter = 0;
psp.specMarkerStyle = '.';
psp.specMarkerSize = 5;

% line widths, font sizes, axes labels, legend font sizes
psp.lw = 2;
psp.xafz = 24;
psp.yafz = 24;
psp.tvfz = 20;
psp.axesLw = 2;
psp.doLatex = 0;
psp.xAxisLabel = 'Length along microtubule (nm)';
psp.yAxisLabel = 'Height (nm)';
% psp.lfz = 20;
psp.lfz = 15;
psp.lgdLocSpec = 'NorthEast';

% limits, aspect ratio, tick marks for line scan plots
psp.xmin = 0;
% psp.xmax = 1.2656e+03; % MAY HAVE TO CHANGE THIS
psp.ymin = 20;
psp.ymax = 60; % MAY HAVE TO CHANGE THIS
% psp.dAsp = [488   15.0000    1.0000];
psp.dAsp = [375   15.0000    1.0000];
psp.xTicks = [0:200:4000];


% for spectra
psp.xminSpec = 0;
psp.xmaxSpec = 0.06;
psp.yminSpec = 0;
psp.ymaxSpec = 2.5;
psp.xscale = 'log';
psp.yscale = 'log';

% set default smooth windows (smPlaneFrac may change; sm should be same throughout)
sm = 5;
smPlaneFrac = 3;

% set pix to nm
pix_to_nm = 2000/256;

% define cutoff frequency for plotting
psp.f_cutoff = .00099; %units nm^-1

% to close figures at end per mt (for batch generation)
psp.doClose = 1;

% if you want to fix the aspect ratio
psp.fixAsp = 1;

% if you want to show errorbars for uncoated or init
psp.doError_u_i = 0;

%% mt 1 (publication main fig)
psp.fname = 'mt1';
psp.doPsd = 1;
% psp.doSave = 0;

doPubFig = 0;

if doPubFig
    psp.fname = '/sansSerif_uncoated_initCoated_final_c_cx_mt-x-22-184_cy_mt-y-51-160';
    psp.fixAsp = 0;
    psp.ymax = 55;
    psp.dAsp = 0;
end
% 3 from 2019 07 16
% run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_mt_123_20190716.m')

% get path to save data in
% [saveDir]=fileparts(filename);
% load line scan data and compute for mt1, 2019 07 16

% % load data from table
% h1_naked = 10e8*mt123naked00228.y;
% % h1_bg_naked = mt123naked00228.y1;
% h1_tpx2 = 10e8*mt123tpx200231.y;
% % h1_bg_tpx2 = mt123tpx200231.y1;
% h1_naked(isnan(h1_naked))=[];
% h1_tpx2(isnan(h1_tpx2))=[];
% 

% % load scan after drop formation
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/c_cx_mt-x-74-232_cy_mt-y-66-171.mat')
% 
% % load the indices for spectra
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/indsForSpectra_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')

% load film height
h = coatingData_mt1.film;

% load data
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261_affine/c_cx_mt-x-22-184_cy_mt-y-51-160/c_cx_mt-x-22-184_cy_mt-y-51-160.mat')

un = c(6,:);
init = c(8,:);
drop = c(37,:);

sm = 1;
smPlaneFrac = 3;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

if doPubFig
    lgd = legend({'Uncoated','Initially coated','After droplet formation'},...
        'Position',[.6 .35 .1 .1]);
    legend boxoff
    lgd.FontSize = 20;
end

if doPubFig
    if psp.doSave == 1

        if sm == 1
            
             saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_noSmooth'])
           
        else
            
            saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname])
        
        end
    end
end
%%

% load spectra data
% load and plot spectra
inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/uncoated/c_cx_mt-x-119-197_cy_mt-y-115-174';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-69-187_cy_mt-y-66-145';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171';
inputStruct3.whichPlot = 'd';

psp.doScatter=0;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
psp.doScatter=1;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);

        saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra_forSupFig'])

%     lgd = legend({'Uncoated',...
%         'Initially coated',...
%         'After droplet formation',...
%         ['\lambda_{max} = ',num2str(248),' nm']},...
%         'Position',[.685 .77 .1 .1]);
%     legend boxoff
%     lgd.FontSize = psp.lfz;
%     
    
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 2
psp.fname = 'mt2';

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
c=c*10e8;

h = coatingData_mt2.film;
un = c(6,:);
un(un==0)=[];

init = c(8,:);
init(init==0)=[];

drop = c(37,:);
drop(drop==0)=[];

sm = 5;
smPlaneFrac = 3;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

% load and plot spectra
inputStruct1.pathName =  '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/uncoated/c_cx_mt-x-158-209_cy_mt-y-263-234';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-168-229_cy_mt-y-256-222';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp)
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp)


clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 3
psp.fname = 'mt3';

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
c=c*10e8;

h = coatingData_mt3.film;

un = c(6,:);
un(un==0)=[];

init = c(8,:);
init(init==0)=[];

drop = c(35,:);
drop(drop==0)=[];
drop=flip(drop);

sm = 5;
smPlaneFrac = 0;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)


% load and plot spectra
inputStruct1.pathName =  '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/uncoated/c_cx_mt-x-202-229_cy_mt-y-263-232';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName =  '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/initCoated/c_cx_mt-x-167-221_cy_mt-y-255-225';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236';
inputStruct3.whichPlot = 'd';

% psp.ymaxSpec = 6;
psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);


clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt4

psp.fname = 'mt4';
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_mt_45_20190713.m')

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/c_cx_mt-x-180-144_cy_mt-y-234-287.mat')
c=c*10e8;

h4_naked = 10e8*mt4naked00067.y;

h4_naked(isnan(h4_naked))=[];

h = coatingData_mt4.film;


un = h4_naked';
init = c(3,:);

drop = c(11,:);
drop(drop==0)=[];

sm = 5;
smPlaneFrac = 3;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/uncoated/c_cx_mt-x-153-183_cy_mt-y-268-225';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-146-180_cy_mt-y-285-231';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287';
inputStruct3.whichPlot = 'd';

% psp.ymaxSpec = 4;
psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);


clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 5 drops only
psp.fname = 'mt5';

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117/c_cx_mt-x-114-179_cy_mt-y-92-117.mat')
drop = c(11,:)*1e9;

h = coatingData_mt5.film;

sm = 5;
smPlaneFrac = 0;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
%plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)

inputStruct.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117';
inputStruct.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 6 drops only

psp.fname = 'mt6';
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132/c_cx_mt-x-219-209_cy_mt-y-3-132.mat')
drop = c(2,:)*1e9;

h = coatingData_mt6.film;

sm = 5;
smPlaneFrac = 0;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
%plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


inputStruct0.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132';
inputStruct0.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct0,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct0,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 7 MAKE CLEAR THAT LINE SCANS FROM DIFFERENT MTS
% actually just using dummy height line

% % load naked MT data
% run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191031_expt10_mtnaked.m')
% expt10_20191031_mtnaked_table = expt1024681012141618bg1357911131517MtNakedframe39420191031;
% clear expt1024681012141618bg1357911131517MtNakedframe39420191031;
% 
% % load 4x TPX2 coated Mt data
% run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191031_expt10_mt4xTpx2flcoated.m')
% expt10_20191031_mt4xtpx2fl_table = expt10246bg135Mt4xTpx2flCoatedframe39620191031;
% clear expt10246bg135MtNakedframe39620191031;
% 
% % load tpx2 init
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-173-159_cy_mt-y-2-118/c_cx_mt-x-173-159_cy_mt-y-2-118.mat')
% % load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-35-112_cy_mt-y-2-74/c_cx_mt-x-35-112_cy_mt-y-2-74.mat')
% % load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-254-187_cy_mt-y-29-131/c_cx_mt-x-254-187_cy_mt-y-29-131.mat')
% 
% % run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191031_expt10_mt4xTpx2flcoated.m')
% % expt10_20191031_mt4xtpx2fl_table = expt10246bg135Mt4xTpx2flCoatedframe39620191031;
% % clear expt10246bg135MtNakedframe39620191031;
% 
% h7_naked = [expt10_20191031_mtnaked_table.y]*10e8;
% h7_naked(isnan(h7_naked))=[];
% 
% h7_tpx2_4x = [expt10_20191031_mt4xtpx2fl_table.y2]*10e8;
% h7_tpx2_4x(isnan(h7_tpx2_4x))=[];
% 
% 
% un = h7_naked';
% % init = h7_tpx2_4x';
% init = c(1,:);
% init=flip(init);

psp.fname = 'mt7';
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490/c_cx_mt-x-167-329_cy_mt-y-2-490.mat')
% drop = c(1,1:155);
% drop = c(1,end-154:end);
drop = c(1,:);
drop(drop==0)=[];
drop=flip(drop);
h = coatingData_mt7.film;


% psp.ymax=60;
% psp.xTicks=0:200:4000;

% %plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
sm = 5;
smPlaneFrac = 10;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
%plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490';
inputStruct2.whichPlot = 'd';

inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-173-159_cy_mt-y-2-118';
inputStruct1.whichPlot = 'i';

inputStruct0.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/mt_expt10_Tpx2fl_4x.0_00394/uncoated/c_cx_mt-x-86-158_cy_mt-y-138-249';
inputStruct0.whichPlot = 'u';

% psp.ymaxSpec = 2.5;
psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct0,inputStruct1,inputStruct2,psp);

psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct0,inputStruct1,inputStruct2,psp);


clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 8
psp.fname = 'mt8';

for t = 3
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364/c_cx_mt-x-237-461_cy_mt-y-43-364.mat')
% drop = c(2,80:196);
% drop = c(2,end-135:end-10);
% drop = c(2,end-154:end);
% drop = c(2,130:250);
% drop = c(3,1:155);
drop = c(t,:);

h = coatingData_mt8.film;

sm = 5;
smPlaneFrac = 8;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
%plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)
end
%

inputStruct1.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364';
inputStruct1.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 9
psp.fname = 'mt9';
doSave = 0;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223/c_cx_mt-x-233-209_cy_mt-y-8-223.mat')
% drop = c(2,80:196);
% drop = c(2,end-135:end-10);
drop = c(2,end-154:end);
% drop = c(1,end-154:end);
% drop = c(2,130:250);
% drop = c(3,1:155);
% drop = c(3,:);

h = coatingData_mt8.film;

sm = 5;
smPlaneFrac = 0;
%plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)

%
inputStruct1.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223';
inputStruct1.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,psp);
% if doSave
%     saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra'])
% end
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 10
psp.fname = 'mt10';
psp.doSave = 1;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/c_cx_mt-x-7-124_cy_mt-y-156-230.mat')
drop = c(21,4:end);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-2-148_cy_mt-y-166-252/c_cx_mt-x-2-148_cy_mt-y-166-252.mat')
un = c(1,1:length(drop));

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-2-159_cy_mt-y-153-254/c_cx_mt-x-2-159_cy_mt-y-153-254.mat')
init = c(4,1:length(drop));

h = coatingData_mt10.film;

sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)


inputStruct1.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-2-148_cy_mt-y-166-252';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-2-159_cy_mt-y-153-254';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 11 only drops
psp.fname = 'mt11';

h = coatingData_mt11.film;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153/c_cx_mt-x-96-253_cy_mt-y-31-153.mat')
drop = c(3,:);

sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


%
inputStruct1.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153';
inputStruct1.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 12 only drops
psp.fname = 'mt12';

h = coatingData_mt12.film;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193/c_cx_mt-x-84-147_cy_mt-y-52-193.mat')
drop = c(1,:);

sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


%
inputStruct1.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193';
inputStruct1.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 13 drop only
psp.fname = 'mt13';

for t = 4
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247/c_cx_mt-x-110-38_cy_mt-y-59-247.mat')
drop = c(t,:);

h = coatingData_mt13.film;

sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


end
%

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 14
psp.fname = 'mt14';
psp.doSave = 1;
psp.doClose = 0;

for t=[22]
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-108-183_cy_mt-y-95-156/c_cx_mt-x-108-183_cy_mt-y-95-156.mat')
un = c(1,:);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-120-202_cy_mt-y-103-171/c_cx_mt-x-120-202_cy_mt-y-103-171.mat')
init = c(3,:);
init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166/c_cx_mt-x-113-197_cy_mt-y-99-166.mat')
drop = c(t,:);

h = coatingData_mt14.film;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%%
psp.fname = 'mt14';
doSave = 0;
psp.lgdLocSpec = 'SouthWest';
inputStruct1.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-108-183_cy_mt-y-95-156';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-120-202_cy_mt-y-103-171';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra'])
end

psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; 
if psp.doClose == 1; close all; end

%% mt 15
psp.fname = 'mt15';
psp.doSave = 1;
for t=[21]
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
init = c(3,1:end);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224/c_cx_mt-x-75-124_cy_mt-y-75-224.mat')
drop = c(t,:);

psp.unStart = 17*pix_to_nm;
psp.initStart = 0;
psp.dropStart = 0;
h = coatingData_mt15.film;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 16
psp.fname = 'mt16';
h = coatingData_mt16.film;
psp.doSave = 1;
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_26-29_20191028_rigidBody/c_cx_mt-x-154-168_cy_mt-y-126-171/c_cx_mt-x-154-168_cy_mt-y-126-171.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_26-29_20191028_rigidBody/c_cx_mt-x-154-168_cy_mt-y-126-171';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 17
psp.fname = 'mt17';
h = coatingData_mt17.film;
psp.doSave = 1;
for t=[2]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-56-89_cy_mt-y-55-15/c_cx_mt-x-56-89_cy_mt-y-55-15.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-56-89_cy_mt-y-55-15';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 18
psp.fname = 'mt18';
h = coatingData_mt18.film;
psp.doSave = 1;
if psp.doSave == 1;
    disp(psp.fname);
end
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-124-189_cy_mt-y-108-143/c_cx_mt-x-124-189_cy_mt-y-108-143.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-124-189_cy_mt-y-108-143';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 19
psp.fname = 'mt19';
h = coatingData_mt19.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-115-166_cy_mt-y-95-108/c_cx_mt-x-115-166_cy_mt-y-95-108.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-115-166_cy_mt-y-95-108';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 20
psp.fname = 'mt20';
h = coatingData_mt20.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-153-179_cy_mt-y-2-73/c_cx_mt-x-153-179_cy_mt-y-2-73.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-153-179_cy_mt-y-2-73';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 20
psp.fname = 'mt20';
h = coatingData_mt20.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-153-179_cy_mt-y-2-73/c_cx_mt-x-153-179_cy_mt-y-2-73.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-153-179_cy_mt-y-2-73';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 21
psp.fname = 'mt21';
h = coatingData_mt21.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[1]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_33-36_20191028_rigidBody/c_cx_mt-x-193-250_cy_mt-y-106-67/c_cx_mt-x-193-250_cy_mt-y-106-67.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_33-36_20191028_rigidBody/c_cx_mt-x-193-250_cy_mt-y-106-67';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 22
psp.fname = 'mt22';
h = coatingData_mt22.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[17]
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-3-84_cy_mt-y-27-43/c_cx_mt-x-3-84_cy_mt-y-27-43.mat')
un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-7-84_cy_mt-y-14-31/c_cx_mt-x-7-84_cy_mt-y-14-31.mat')
init = c(4,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/c_cx_mt-x-9-73_cy_mt-y-15-29.mat')
drop = c(t,:);
% init = ones(size(drop));
% un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-3-84_cy_mt-y-27-43';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-7-84_cy_mt-y-14-31';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 23
psp.fname = 'mt23';
h = coatingData_mt23.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t=[12:21]
for t = 12
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93/c_cx_mt-x-161-210_cy_mt-y-29-93.mat')
init = c(4,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83/c_cx_mt-x-169-200_cy_mt-y-44-83.mat')
drop = c(t,:);
% init = ones(size(drop));
% un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 2;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 24
psp.fname = 'mt24';
h = coatingData_mt24.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[1]
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93/c_cx_mt-x-161-210_cy_mt-y-29-93.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-164-249_cy_mt-y-113-228/c_cx_mt-x-164-249_cy_mt-y-113-228.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-164-249_cy_mt-y-113-228';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 25
psp.fname = 'mt25';
h = coatingData_mt25.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[1]
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93/c_cx_mt-x-161-210_cy_mt-y-29-93.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-32-122_cy_mt-y-144-112/c_cx_mt-x-32-122_cy_mt-y-144-112.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-32-122_cy_mt-y-144-112';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 26
psp.fname = 'mt26';
h = coatingData_mt26.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[2]
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93/c_cx_mt-x-161-210_cy_mt-y-29-93.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-195-243_cy_mt-y-177-247/c_cx_mt-x-195-243_cy_mt-y-177-247.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end

% inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-195-243_cy_mt-y-177-247';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 27
psp.fname = 'mt27';
h = coatingData_mt27.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[1]
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93/c_cx_mt-x-161-210_cy_mt-y-29-93.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-173-253_cy_mt-y-16-57/c_cx_mt-x-173-253_cy_mt-y-16-57.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end

% inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-173-253_cy_mt-y-16-57';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 28
psp.fname = 'mt28';
h = coatingData_mt28.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[1]
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93/c_cx_mt-x-161-210_cy_mt-y-29-93.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-171-315_cy_mt-y-493-406/c_cx_mt-x-171-315_cy_mt-y-493-406.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-171-315_cy_mt-y-493-406';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 29
psp.fname = 'mt29';
h = coatingData_mt29.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[1]
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93/c_cx_mt-x-161-210_cy_mt-y-29-93.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-229-355_cy_mt-y-281-362/c_cx_mt-x-229-355_cy_mt-y-281-362.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 2;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-229-355_cy_mt-y-281-362';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 30
psp.fname = 'mt30';
h = coatingData_mt30.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[2]
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/wood1`s hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93/c_cx_mt-x-161-210_cy_mt-y-29-93.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-3-99_cy_mt-y-32-4/c_cx_mt-x-3-99_cy_mt-y-32-4.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-3-99_cy_mt-y-32-4';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 31
psp.fname = 'mt31';
h = coatingData_mt31.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[1]
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/wood1`s hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93/c_cx_mt-x-161-210_cy_mt-y-29-93.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-208-374_cy_mt-y-246-12/c_cx_mt-x-208-374_cy_mt-y-246-12.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-208-374_cy_mt-y-246-12';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 32 DUPLICAT,E DO NOT PLOT!
% psp.fname = 'mt32';
% h = coatingData_mt32.film;
% psp.doSave = 1;
% if psp.doSave == 1
%     disp(psp.fname);
% end
% % for t=[8:15]
% for t=9
% % for t = 12
% % load('/Users/sagarsetru/Documents/Princeton/wood1`s hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% % un = c(1,:);
% % % un = flip(un);
% % 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/initCoated/c_cx_mt-x-118-215_cy_mt-y-105-41/c_cx_mt-x-118-215_cy_mt-y-105-41.mat')
% init = c(3,:);
% % init=flip(init);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/c_cx_mt-x-113-215_cy_mt-y-108-41.mat')
% drop = c(t,:);
% % init = ones(size(drop));
% un = ones(size(drop));
% 
% psp.unStart = 0*pix_to_nm;
% psp.initStart = 0*pix_to_nm;
% psp.dropStart = 0*pix_to_nm;
% sm = 5;
% smPlaneFrac = 1;
% %plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
% 
% end
% %
% % inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% % inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =      '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/initCoated/c_cx_mt-x-118-215_cy_mt-y-105-41';
% inputStruct2.whichPlot = 'i';
% 
% inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41';
% inputStruct3.whichPlot = 'd';
% 
% psp.doScatter = 0;
% psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% % plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% % plotUnInitDropSpectra(inputStruct3,psp);
% psp.doScatter = 1;
% psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% % plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% % plotUnInitDropSpectra(inputStruct3,psp);
% 
% clear c
% clear un
% clear init
% clear drop
% clear h; if psp.doClose == 1; close all; end

%% mt 33
psp.fname = 'mt33';
h = coatingData_mt33.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t=[1:4]
for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/wood1`s hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90/c_cx_mt-x-154-203_cy_mt-y-22-90.mat')
% un = c(1,:);
% % un = flip(un);
% 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/initCoated/c_cx_mt-x-118-215_cy_mt-y-105-41/c_cx_mt-x-118-215_cy_mt-y-105-41.mat')
init = c(3,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-275-371_cy_mt-y-148-16/c_cx_mt-x-275-371_cy_mt-y-148-16.mat')
drop = c(t,:);
% init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
% inputStruct1.whichPlot = 'u';

inputStruct2.pathName =  '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/initCoated/c_cx_mt-x-118-215_cy_mt-y-105-41';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-275-371_cy_mt-y-148-16';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 34
psp.fname = 'mt34';
h = coatingData_mt34.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t=[8:11]
for t=[11]
% for t=1
% for t = 12
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/uncoated/c_cx_mt-x-2-144_cy_mt-y-109-95/c_cx_mt-x-2-144_cy_mt-y-109-95.mat')
un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/initCoated/c_cx_mt-x-5-227_cy_mt-y-143-125/c_cx_mt-x-5-227_cy_mt-y-143-125.mat')
init = c(3,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123/c_cx_mt-x-14-253_cy_mt-y-143-123.mat')
drop = c(t,:);
% init = ones(size(drop));
% un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 10;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% psp.lfz=15;
inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/uncoated/c_cx_mt-x-2-144_cy_mt-y-109-95';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName =      '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/initCoated/c_cx_mt-x-5-227_cy_mt-y-143-125';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

% restore default lgd font size
% psp.lfz = 20;

%% mt 35
psp.fname = 'mt35';
h = coatingData_mt35.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[10]
% for t=[11]
% for t=1
% for t = 12
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/uncoated/c_cx_mt-x-41-183_cy_mt-y-114-148/c_cx_mt-x-41-183_cy_mt-y-114-148.mat')
un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/initCoated/c_cx_mt-x-111-245_cy_mt-y-162-195/c_cx_mt-x-111-245_cy_mt-y-162-195.mat')
init = c(3,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192/c_cx_mt-x-106-232_cy_mt-y-161-192.mat')
drop = c(t,:);
% init = ones(size(drop));
% un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/uncoated/c_cx_mt-x-41-183_cy_mt-y-114-148';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/initCoated/c_cx_mt-x-111-245_cy_mt-y-162-195';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 36
psp.fname = 'mt36';
h = coatingData_mt36.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[8]
% for t=[11]
% for t=1
% for t = 12
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117/c_cx_mt-x-114-127_cy_mt-y-3-117.mat')
init = c(4,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120/c_cx_mt-x-113-128_cy_mt-y-7-120.mat')
drop = c(t,:);
% drop = flip(drop);
% init = ones(size(drop));
% un = ones(size(drop));

psp.unStart = 29*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120/';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 37
psp.fname = 'mt37';
h = coatingData_mt37.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[2]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117/c_cx_mt-x-114-127_cy_mt-y-3-117.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-67-150_cy_mt-y-168-138/c_cx_mt-x-67-150_cy_mt-y-168-138.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-67-150_cy_mt-y-168-138';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 38
psp.fname = 'mt38';
h = coatingData_mt38.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[2]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117/c_cx_mt-x-114-127_cy_mt-y-3-117.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-211-247_cy_mt-y-126-63/c_cx_mt-x-211-247_cy_mt-y-126-63.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-211-247_cy_mt-y-126-63';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 39
psp.fname = 'mt39';
h = coatingData_mt39.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[3]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117/c_cx_mt-x-114-127_cy_mt-y-3-117.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-41-117_cy_mt-y-162-123/c_cx_mt-x-41-117_cy_mt-y-162-123.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-41-117_cy_mt-y-162-123';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 40
psp.fname = 'mt40';
h = coatingData_mt40.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[3]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117/c_cx_mt-x-114-127_cy_mt-y-3-117.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-4-149_cy_mt-y-75-121/c_cx_mt-x-4-149_cy_mt-y-75-121.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-4-149_cy_mt-y-75-121';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 41
psp.fname = 'mt41';
h = coatingData_mt41.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[3]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117/c_cx_mt-x-114-127_cy_mt-y-3-117.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-3-110_cy_mt-y-174-128/c_cx_mt-x-3-110_cy_mt-y-174-128.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-3-110_cy_mt-y-174-128';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 42
psp.fname = 'mt42';
h = coatingData_mt42.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[1]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117/c_cx_mt-x-114-127_cy_mt-y-3-117.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-229-204_cy_mt-y-132-251/c_cx_mt-x-229-204_cy_mt-y-132-251.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-229-204_cy_mt-y-132-251';
inputStruct3.whichPlot = 'd';
% psp.lfz=15;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end
% psp.lfz=20;

%% mt 43
psp.fname = 'mt43';
h = coatingData_mt43.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[3]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117/c_cx_mt-x-114-127_cy_mt-y-3-117.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-165-167_cy_mt-y-148-253/c_cx_mt-x-165-167_cy_mt-y-148-253.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-165-167_cy_mt-y-148-253';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 44
psp.fname = 'mt44';
h = coatingData_mt44.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t=[1]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117/c_cx_mt-x-114-127_cy_mt-y-3-117.mat')
% init = c(4,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-110-76_cy_mt-y-162-235/c_cx_mt-x-110-76_cy_mt-y-162-235.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-110-76_cy_mt-y-162-235';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 45
psp.fname = 'mt45';
h = coatingData_mt45.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71/indsForAverage_c_cx_mt-x-27-237_cy_mt-y-244-71.mat')
% for t=[21,26,31,34,36]
for t = 21
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73/c_cx_mt-x-28-233_cy_mt-y-244-73.mat')
init = c(3,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71/c_cx_mt-x-27-237_cy_mt-y-244-71.mat')
drop = c(t,:);
% drop = flip(drop);
% init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 46
psp.fname = 'mt46';
h = coatingData_mt46.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t = [1]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73/c_cx_mt-x-28-233_cy_mt-y-244-73.mat')
% init = c(3,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_114-116_affine/c_cx_mt-x-379-442_cy_mt-y-2-207/c_cx_mt-x-379-442_cy_mt-y-2-207.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_114-116_affine/c_cx_mt-x-379-442_cy_mt-y-2-207';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 47
psp.fname = 'mt47';
h = coatingData_mt47.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t = [2]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73/c_cx_mt-x-28-233_cy_mt-y-244-73.mat')
% init = c(3,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-76-308_cy_mt-y-3-321/c_cx_mt-x-76-308_cy_mt-y-3-321.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 5;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-76-308_cy_mt-y-3-321';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 48
psp.fname = 'mt48';
h = coatingData_mt48.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t = [2]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73/c_cx_mt-x-28-233_cy_mt-y-244-73.mat')
% init = c(3,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-65-305_cy_mt-y-233-445/c_cx_mt-x-65-305_cy_mt-y-233-445.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-65-305_cy_mt-y-233-445';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 49
psp.fname = 'mt49';
h = coatingData_mt49.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t = [2]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73/c_cx_mt-x-28-233_cy_mt-y-244-73.mat')
% init = c(3,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-178-10_cy_mt-y-203-283/c_cx_mt-x-178-10_cy_mt-y-203-283.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-178-10_cy_mt-y-203-283';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 50
psp.fname = 'mt50';
h = coatingData_mt50.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t = [1]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73/c_cx_mt-x-28-233_cy_mt-y-244-73.mat')
% init = c(3,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-224-171_cy_mt-y-355-508/c_cx_mt-x-224-171_cy_mt-y-355-508.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-224-171_cy_mt-y-355-508';
inputStruct3.whichPlot = 'd';

% psp.lfz = 15;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end
% psp.lfz = 20;

%% mt 51
psp.fname = 'mt51';
h = coatingData_mt51.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
for t = [1]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3/c_cx_mt-x-117-114_cy_mt-y-71-3.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73/c_cx_mt-x-28-233_cy_mt-y-244-73.mat')
% init = c(3,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-234-355_cy_mt-y-352-315/c_cx_mt-x-234-355_cy_mt-y-352-315.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/uncoated/c_cx_mt-x-117-114_cy_mt-y-71-3';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-234-355_cy_mt-y-352-315';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 52
psp.fname = 'mt52';
h = coatingData_mt52.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t = [12:17]
for t = [17:17]
% for t=[11]
% for t=1
% for t = 12
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246/c_cx_mt-x-205-255_cy_mt-y-90-246.mat')
% un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-183-207_cy_mt-y-45-253/c_cx_mt-x-183-207_cy_mt-y-45-253.mat')
init = c(1,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-180-207_cy_mt-y-42-253/c_cx_mt-x-180-207_cy_mt-y-42-253.mat')
drop = c(t,:);
% drop = flip(drop);
% init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 5;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246';
% inputStruct1.whichPlot = 'u';

inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-183-207_cy_mt-y-45-253';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-180-207_cy_mt-y-42-253';
inputStruct3.whichPlot = 'd';

% psp.lfz = 15;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end
% psp.lfz=20;

%% mt 53
psp.fname = 'mt53';
h = coatingData_mt53.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t = [12:17]
for t = [13]

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246/c_cx_mt-x-205-255_cy_mt-y-90-246.mat')
% un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-74-124_cy_mt-y-103-246/c_cx_mt-x-74-124_cy_mt-y-103-246.mat')
init = c(1,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249/c_cx_mt-x-75-123_cy_mt-y-103-249.mat')
drop = c(t,:);
% drop = flip(drop);
% init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246';
% inputStruct1.whichPlot = 'u';

inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-74-124_cy_mt-y-103-246';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249';
inputStruct3.whichPlot = 'd';

% psp.lfz = 15;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end
% psp.lfz=20;

%% mt 54
psp.fname = 'mt54';
h = coatingData_mt54.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t = [12:17]
for t = [17]

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246/c_cx_mt-x-205-255_cy_mt-y-90-246.mat')
% un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-51-23_cy_mt-y-3-117/c_cx_mt-x-51-23_cy_mt-y-3-117.mat')
init = c(1,:);
init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4/c_cx_mt-x-23-50_cy_mt-y-117-4.mat')
drop = c(t,:);
% drop = flip(drop);
% init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246';
% inputStruct1.whichPlot = 'u';

inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-51-23_cy_mt-y-3-117';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4';
inputStruct3.whichPlot = 'd';

% psp.lfz = 15;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end
% psp.lfz=20;

%% mt 55
psp.fname = 'mt55';
h = coatingData_mt55.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t = [12:17]
for t = [12]

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246/c_cx_mt-x-205-255_cy_mt-y-90-246.mat')
% un = c(1,:);
% un = flip(un);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214/c_cx_mt-x-2-60_cy_mt-y-174-214.mat')
init = c(1,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250/c_cx_mt-x-6-105_cy_mt-y-178-250.mat')
drop = c(t,:);
% drop = flip(drop);
% init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 3;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246';
% inputStruct1.whichPlot = 'u';

inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250';
inputStruct3.whichPlot = 'd';

% psp.lfz = 15;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end
% psp.lfz=20;

%% mt 56
psp.fname = 'mt56';
h = coatingData_mt56.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t = [12:17]
for t = [1]

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246/c_cx_mt-x-205-255_cy_mt-y-90-246.mat')
% un = c(1,:);
% un = flip(un);

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214/c_cx_mt-x-2-60_cy_mt-y-174-214.mat')
% init = c(1,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-170-369_cy_mt-y-121-176/c_cx_mt-x-170-369_cy_mt-y-121-176.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246';
% inputStruct1.whichPlot = 'u';

% inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-170-369_cy_mt-y-121-176';
inputStruct3.whichPlot = 'd';

% psp.lfz = 15;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end
% psp.lfz=20;

%% mt 57
psp.fname = 'mt57';
h = coatingData_mt57.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t = [12:17]
for t = [3]

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246/c_cx_mt-x-205-255_cy_mt-y-90-246.mat')
% un = c(1,:);
% un = flip(un);

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214/c_cx_mt-x-2-60_cy_mt-y-174-214.mat')
% init = c(1,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-216-503_cy_mt-y-173-504/c_cx_mt-x-216-503_cy_mt-y-173-504.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 5;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246';
% inputStruct1.whichPlot = 'u';

% inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-216-503_cy_mt-y-173-504';
inputStruct3.whichPlot = 'd';

% psp.lfz = 15;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end
% psp.lfz=20;

%% mt 58
psp.fname = 'mt58';
h = coatingData_mt58.film;
psp.doSave = 1;
if psp.doSave == 1
    disp(psp.fname);
end
% for t = [12:17]
for t = [3]

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246/c_cx_mt-x-205-255_cy_mt-y-90-246.mat')
% un = c(1,:);
% un = flip(un);

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214/c_cx_mt-x-2-60_cy_mt-y-174-214.mat')
% init = c(1,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-260-464_cy_mt-y-334-506/c_cx_mt-x-260-464_cy_mt-y-334-506.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
%plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246';
% inputStruct1.whichPlot = 'u';

% inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-260-464_cy_mt-y-334-506';
inputStruct3.whichPlot = 'd';

% psp.lfz = 15;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end
% psp.lfz=20;

%%{

%% mt kinesin
psp.fixAsp = 0;
psp.fname = 'mt_kinesin';
h = 2.9;
psp.ymax = 35;
psp.doSave = 0;
if psp.doSave == 1
    disp(psp.fname);
end
% for t = [12:17]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_26-28_20191108_rigidBody/c_cx_mt-x-95-145_cy_mt-y-1-86/c_cx_mt-x-95-145_cy_mt-y-1-86.mat')
for t = [3]

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246/c_cx_mt-x-205-255_cy_mt-y-90-246.mat')
% un = c(1,:);
% un = flip(un);

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214/c_cx_mt-x-2-60_cy_mt-y-174-214.mat')
% init = c(1,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt1 kinesin/tifStacks_expt1Kinesin_20191108/Stack_expt1_8-11_20191108_rigidBody/c_cx_mt-x-24-85_cy_mt-y-155-217/c_cx_mt-x-24-85_cy_mt-y-155-217.mat')
drop = c(t,:);
% drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end

%%
psp.doSave = 0;
inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt1 kinesin/tifStacks_expt1Kinesin_20191108/Stack_expt1_8-11_20191108_rigidBody/c_cx_mt-x-24-85_cy_mt-y-155-217';
inputStruct3.whichPlot = 'u';

% psp.lfz = 15;
psp.doError_u_i = 1;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

if psp.doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra'])

end



%% mt cttpx2
psp.fixAsp = 0;
psp.fname = 'mt_ct_tpx2';
h = 3.7;
psp.ymax = 35;
psp.doSave = 0;
if psp.doSave == 1
    disp(psp.fname);
end
% for t = [12:17]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_26-28_20191108_rigidBody/c_cx_mt-x-95-145_cy_mt-y-1-86/c_cx_mt-x-95-145_cy_mt-y-1-86.mat')
% for t = 1:size(c,1)
for t = 3

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246/c_cx_mt-x-205-255_cy_mt-y-90-246.mat')
% un = c(1,:);
% un = flip(un);

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214/c_cx_mt-x-2-60_cy_mt-y-174-214.mat')
% init = c(1,:);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166/c_cx_mt-x-76-109_cy_mt-y-254-166.mat')
drop = c(t,:);
drop = flip(drop);
init = ones(size(drop));
un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
if psp.doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_lineScans'])

end

%%
psp.doSave = 1;
inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166';
inputStruct3.whichPlot = 'u';

% psp.lfz = 15;
psp.doError_u_i = 1;
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
% 
% psp.doScatter = 1;
% psp.lgdLocSpec = 'NorthEast';
% % plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
% % plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);
%}
%% mt 4 for pub
psp.fname = 'mt46';
h = coatingData_mt46.film;
psp.doSave = 0;
doSave = 0;
if psp.doSave == 1
    disp(psp.fname);
end
for t = [1]
% for t=[11]
% for t=1
% for t = 12
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/uncoated/c_cx_mt-x-3-68_cy_mt-y-62-8/c_cx_mt-x-3-68_cy_mt-y-62-8.mat')
un = c(1,:);
% % un = flip(un);
% 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73/c_cx_mt-x-28-233_cy_mt-y-244-73.mat')
init = c(3,:);
% % init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_114-116_affine/c_cx_mt-x-379-442_cy_mt-y-2-207/c_cx_mt-x-379-442_cy_mt-y-2-207.mat')
drop = c(t,:);
% drop = flip(drop);
% init = ones(size(drop));
% un = ones(size(drop));

% psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;

sm = 5;
smPlaneFrac = 0;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_lineScans_forPub'])
end
%%
psp.fname = 'mt46';
psp.doSave = 0;
doSave = 0;
inputStruct1.pathName =      '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/uncoated/c_cx_mt-x-3-68_cy_mt-y-62-8';
inputStruct1.whichPlot = 'u';
% 
inputStruct2.pathName =      '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_114-116_affine/c_cx_mt-x-379-442_cy_mt-y-2-207';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra_forPub'])
end

psp.doScatter = 1;
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
% plotUnInitDropSpectra(inputStruct3,psp);

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra_withScatter_forPub'])
end

clear c
clear un
clear init
clear drop
clear h; 
% if psp.doClose == 1; close all; end

%% mt 9 for pub
psp.fname = 'mt9';
psp.doSave = 0;
doSave = 0;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223/c_cx_mt-x-233-209_cy_mt-y-8-223.mat')
% drop = c(2,80:196);
% drop = c(2,end-135:end-10);
drop = c(2,end-154:end);
drop = c(2,:);
% drop = c(1,end-154:end);
% drop = c(2,130:250);
% drop = c(3,1:155);
% drop = c(3,:);
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-254-187_cy_mt-y-29-131/c_cx_mt-x-254-187_cy_mt-y-29-131.mat')
init = c(1,:);
un = ones(size(drop));
h = coatingData_mt8.film;

sm = 5;
smPlaneFrac = 5;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_lineScans_forPub'])
end
%%
doSave = 0;
psp.doSave = 0;
psp.lgdLocSpec = 'SouthWest';
inputStruct1.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223';
inputStruct1.whichPlot = 'd';

inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-254-187_cy_mt-y-29-131';
inputStruct2.whichPlot = 'i';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct2,inputStruct1,psp);
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra_forPub'])
end

psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct2,inputStruct1,psp);
if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_avgSpectra_withScatter_forPub'])
end

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 1a
psp.fname = 'mt1a';
% h = coatingData_mt17.film;

h = coatingData_mt1a.film;
psp.doClose = 0;

psp.doSave = 0;
for t=[9]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_2_fr136_fr148/Stack_rigid/c_cx_mt-x-9-155_cy_mt-y-175-191/c_cx_mt-x-9-155_cy_mt-y-175-191.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));

psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_2_fr136_fr148/Stack_rigid/c_cx_mt-x-9-155_cy_mt-y-175-191';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 2a
psp.fname = 'mt2a';
% h = coatingData_mt17.film;
 
h = coatingData_mt2a.film;
psp.doClose = 0;
 
psp.doSave = 0;
for t=[9]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_2_fr136_fr148/Stack_rigid/c_cx_mt-x-115-205_cy_mt-y-100-131/c_cx_mt-x-115-205_cy_mt-y-100-131.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end
%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';
 
inputStruct3.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_2_fr136_fr148/Stack_rigid/c_cx_mt-x-115-205_cy_mt-y-100-131';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 3a
psp.fname = 'mt3a';
% h = coatingData_mt17.film;
 
h = coatingData_mt3a.film;
psp.doClose = 0;
 
psp.doSave = 0;
for t=[4]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_3_fr149_fr153/Stack_affine/c_cx_mt-x-141-90_cy_mt-y-135-247/c_cx_mt-x-141-90_cy_mt-y-135-247.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end
%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';
 
inputStruct3.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_3_fr149_fr153/Stack_affine/c_cx_mt-x-141-90_cy_mt-y-135-247';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 4a
psp.fname = 'mt4a';
 
h = coatingData_mt4a.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[1]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_4_fr154_fr158/Stack_rigid/c_cx_mt-x-157-61_cy_mt-y-90-241/c_cx_mt-x-157-61_cy_mt-y-90-241.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';
 
inputStruct3.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_4_fr154_fr158/Stack_rigid/c_cx_mt-x-157-61_cy_mt-y-90-241';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 5a
psp.fname = 'mt5a';
 
h = coatingData_mt5a.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[1]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_4_fr154_fr158/Stack_rigid/c_cx_mt-x-246-180_cy_mt-y-245-91/c_cx_mt-x-246-180_cy_mt-y-245-91.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';
 
inputStruct3.pathName =      '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_4_fr154_fr158/Stack_rigid/c_cx_mt-x-246-180_cy_mt-y-245-91';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 6a
psp.fname = 'mt6a';
 
h = coatingData_mt6a.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[4]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_5_fr159_fr163/Stack_rigid/c_cx_mt-x-189-77_cy_mt-y-8-254/c_cx_mt-x-189-77_cy_mt-y-8-254.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';
 
inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_5_fr159_fr163/Stack_rigid/c_cx_mt-x-189-77_cy_mt-y-8-254';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 7a
psp.fname = 'mt7a';
 
h = coatingData_mt7a.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[2]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_6_fr164_fr168/Stack_rigid/c_cx_mt-x-90-193_cy_mt-y-249-2/c_cx_mt-x-90-193_cy_mt-y-249-2.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_1_lowest/movie_6_fr164_fr168/Stack_rigid/c_cx_mt-x-90-193_cy_mt-y-249-2';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 1c
psp.fname = 'mt1c';
 
h = coatingData_mt1c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_1_fr206_fr221/Stack_affine/c_cx_mt-x-4-160_cy_mt-y-169-5/c_cx_mt-x-4-160_cy_mt-y-169-5.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_1_fr206_fr221/Stack_affine/c_cx_mt-x-4-160_cy_mt-y-169-5';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 2c
psp.fname = 'mt2c';
 
h = coatingData_mt2c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_1_fr206_fr221/Stack_affine/c_cx_mt-x-4-160_cy_mt-y-169-5/c_cx_mt-x-4-160_cy_mt-y-169-5.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_1_fr206_fr221/Stack_affine/c_cx_mt-x-91-253_cy_mt-y-253-149';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 3c
psp.fname = 'mt3c';
 
h = coatingData_mt3c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[4]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_2_fr222_fr226/Stack_rigid/c_cx_mt-x-77-248_cy_mt-y-2-97/c_cx_mt-x-77-248_cy_mt-y-2-97.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_2_fr222_fr226/Stack_rigid/c_cx_mt-x-77-248_cy_mt-y-2-97';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 4c
psp.fname = 'mt4c';
 
h = coatingData_mt4c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[1]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_2_fr222_fr226/Stack_rigid/c_cx_mt-x-7-187_cy_mt-y-57-140/c_cx_mt-x-7-187_cy_mt-y-57-140.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_2_fr222_fr226/Stack_rigid/c_cx_mt-x-7-187_cy_mt-y-57-140';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 5c
psp.fname = 'mt5c';
 
h = coatingData_mt5c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[5]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_2_fr222_fr226/Stack_rigid/c_cx_mt-x-197-254_cy_mt-y-253-185/c_cx_mt-x-197-254_cy_mt-y-253-185.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_2_fr222_fr226/Stack_rigid/c_cx_mt-x-197-254_cy_mt-y-253-185';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 6c
psp.fname = 'mt6c';
 
h = coatingData_mt6c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_3_fr227_fr231/Stack_affine/c_cx_mt-x-164-252_cy_mt-y-195-90/c_cx_mt-x-164-252_cy_mt-y-195-90.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_3_fr227_fr231/Stack_affine/c_cx_mt-x-164-252_cy_mt-y-195-90';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 7c
psp.fname = 'mt7c';
 
h = coatingData_mt7c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[2]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_3_fr227_fr231/Stack_affine/c_cx_mt-x-88-141_cy_mt-y-1-175/c_cx_mt-x-88-141_cy_mt-y-1-175.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_3_fr227_fr231/Stack_affine/c_cx_mt-x-88-141_cy_mt-y-1-175';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 8c
psp.fname = 'mt8c';
 
h = coatingData_mt8c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_4_fr232_fr236/Stack_affine/c_cx_mt-x-78-86_cy_mt-y-252-10/c_cx_mt-x-78-86_cy_mt-y-252-10.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_4_fr232_fr236/Stack_affine/c_cx_mt-x-78-86_cy_mt-y-252-10';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end

%% mt 9c
psp.fname = 'mt9c';
 
h = coatingData_mt9c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_4_fr232_fr236/Stack_affine/c_cx_mt-x-169-212_cy_mt-y-187-10/c_cx_mt-x-169-212_cy_mt-y-187-10.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_4_fr232_fr236/Stack_affine/c_cx_mt-x-169-212_cy_mt-y-187-10';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end


%% mt 10c
psp.fname = 'mt10c';
 
h = coatingData_mt10c.film;
psp.doClose = 0;
 
psp.doSave = 1;
for t=[3]
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
% un = c(1,:);
% % un = flip(un);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204/c_cx_mt-x-80-118_cy_mt-y-86-204.mat')
% init = c(3,1:end);
% init=flip(init);
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_4_fr232_fr236/Stack_affine/c_cx_mt-x-252-186_cy_mt-y-59-182/c_cx_mt-x-252-186_cy_mt-y-59-182.mat')
drop = c(t,:);
init = ones(size(drop));
un = ones(size(drop));
 
psp.unStart = 0*pix_to_nm;
psp.initStart = 0*pix_to_nm;
psp.dropStart = 0*pix_to_nm;
sm = 5;
smPlaneFrac = 1;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
 
end

%%
% inputStruct1.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
% inputStruct1.whichPlot = 'u';
% 
% inputStruct2.pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
% inputStruct2.whichPlot = 'i';

inputStruct3.pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/AFM Data Reviewer 3/Wednesday_20190930_mt_4_highest/movie_4_fr232_fr236/Stack_affine/c_cx_mt-x-252-186_cy_mt-y-59-182';
inputStruct3.whichPlot = 'd';
 
psp.doScatter = 0;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'NorthEast';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
 
clear c
clear un
clear init
clear drop
clear h; if psp.doClose == 1; close all; end