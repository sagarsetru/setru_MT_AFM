% Script to plot individual line scans per MT (for reviewer response)
% Sagar Setru
% 2019 03 25
%%

addpath(genpath('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis'))

% for saving
saveDirMain =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra/';

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
psp.yAxisLabel2 = 'Power (nm)'; % for spectra
psp.xAxisLabel2 = 'Inverse wavelength 1/\lambda (nm^{-1})'; % for spectra
psp.lfz = 20;
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
psp.yscale = 'lin';

% set default smooth windows (smPlaneFrac may change; sm should be same throughout)
sm = 5;
smPlaneFrac = 3;

% set pix to nm
pix_to_nm = 2000/256;

% define cutoff frequency for plotting
psp.f_cutoff = .00099; %units nm^-1

psp.doSave = 1;
psp.saveDirMain = saveDirMain;

%% mt 1 (publication main fig)
psp.fname = 'mt1';

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

sm = 5;
smPlaneFrac = 3;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)


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


clear c
clear un
clear init
clear drop
clear h


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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
clear h

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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)


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
clear h


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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
clear h

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
plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
clear h

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
plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


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
clear h

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

% plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
sm = 5;
smPlaneFrac = 10;
psp.unStart = 0;
psp.initStart = 0;
psp.dropStart = 0;
plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


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
clear h

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
plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)
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
clear h

%% mt 9
psp.fname = 'mt9';

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
plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)

%
inputStruct1.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223';
inputStruct1.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,psp);

clear c
clear un
clear init
clear drop
clear h

%% mt 10
psp.fname = 'mt10';

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/c_cx_mt-x-7-124_cy_mt-y-156-230.mat')
drop = c(21,4:end);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-2-148_cy_mt-y-166-252/c_cx_mt-x-2-148_cy_mt-y-166-252.mat')
un = c(1,1:length(drop));

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-2-159_cy_mt-y-153-254/c_cx_mt-x-2-159_cy_mt-y-153-254.mat')
init = c(4,1:length(drop));

h = coatingData_mt10.film;

sm = 5;
smPlaneFrac = 3;
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)


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
clear h

%% mt 11 only drops
psp.fname = 'mt11';

h = coatingData_mt11.film;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153/c_cx_mt-x-96-253_cy_mt-y-31-153.mat')
drop = c(3,:);

sm = 5;
smPlaneFrac = 3;
plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


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
clear h

%% mt 12 only drops
psp.fname = 'mt12';

h = coatingData_mt12.film;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193/c_cx_mt-x-84-147_cy_mt-y-52-193.mat')
drop = c(1,:);

sm = 5;
smPlaneFrac = 3;
plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


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
clear h

%% mt 13 drop only
psp.fname = 'mt13';

for t = 4
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247/c_cx_mt-x-110-38_cy_mt-y-59-247.mat')
drop = c(t,:);

h = coatingData_mt13.film;

sm = 5;
smPlaneFrac = 3;
plotUncoatedInitFinal(ones(size(drop)),ones(size(drop)),drop,h,sm,smPlaneFrac,pix_to_nm,psp)


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
clear h

%% mt 14
psp.fname = 'mt14';

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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

end

inputStruct1.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-108-183_cy_mt-y-95-156';
inputStruct1.whichPlot = 'u';

inputStruct2.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-120-202_cy_mt-y-103-171';
inputStruct2.whichPlot = 'i';

inputStruct3.pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166';
inputStruct3.whichPlot = 'd';

psp.doScatter = 0;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
psp.doScatter = 1;
plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h

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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
clear h

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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
psp.lgdLocSpec = 'SouthWest';
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
clear h

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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h

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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h

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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h

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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h

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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h

%% mt 21
psp.fname = 'mt21';
h = coatingData_mt21.film;
psp.doSave = 0;
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
plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

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
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);
psp.doScatter = 1;
psp.lgdLocSpec = 'SouthWest';
% plotUnInitDropSpectra(inputStruct1,inputStruct2,inputStruct3,psp);
plotUnInitDropSpectra(inputStruct3,psp);

clear c
clear un
clear init
clear drop
clear h