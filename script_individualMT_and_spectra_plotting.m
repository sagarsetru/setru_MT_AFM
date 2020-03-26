% Script to plot individual line scans per MT (for reviewer response)
% Sagar Setru
% 2019 03 25
%%

addpath(genpath('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis'))

% for saving
saveDirMain =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra';

% main path for running scripts to load height data
runDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/';

%% plot style parameters, for all plots
psp.unColor = 'k';
psp.initColor = 'b';
psp.dropColor = 'r';
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
psp.xmin = 0;
% psp.xmax = 1.2656e+03; % MAY HAVE TO CHANGE THIS
psp.ymin = 20;
psp.ymax = 60; % MAY HAVE TO CHANGE THIS
psp.dAsp = [488   15.0000    1.0000];
psp.xTicks = [0:200:1200];

% set default smooth windows (smPlaneFrac may change)
sm = 5;
smPlaneFrac = 3;

% set pix to nm
pix_to_nm = 2000/256;

% define cutoff frequency for plotting
f_cutoff = .00099; %units nm^-1

doSave = 0;
%% mt 1 (publication main fig)
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


plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt1_lineScans'])

end

% load spectra data

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171';
fNameStruct = loadSpectralDataFromDir(pathName);
load(fNameStruct.avgSpectra)
load(fNameStruct.stdSpectra)
load(fNameStruct.spectra)
load(fNameStruct.f)
if ~strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    clear indsForAverage
end
    
plotIndivAvgSpectra(f,avgSpectra*10e8,stdSpectra*10e8,f_cutoff,P1s.*10e8,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt1_avgSpectra'])

end

clear c
clear un
clear init
clear drop
clear h

clear f
clear P1s
clear avgSpectra
clear stdSpectra

%% mt 2

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
c=c*10e8;

h = coatingData_mt2.film;
sm = 5;
smPlaneFrac = 3;
un = c(6,:);
un(un==0)=[];

init = c(8,:);
init(init==0)=[];

drop = c(37,:);
drop(drop==0)=[];

plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt2_lineScans'])

end

% load and plot spectra
pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250';
fNameStruct = loadSpectralDataFromDir(pathName);
load(fNameStruct.avgSpectra)
load(fNameStruct.stdSpectra)
load(fNameStruct.spectra)
load(fNameStruct.f)
if ~strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    clear indsForAverage
end

plotIndivAvgSpectra(f,avgSpectra*10e8,stdSpectra*10e8,f_cutoff,P1s.*10e8,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt2_avgSpectra'])

end

clear c
clear un
clear init
clear drop
clear h

clear f
clear P1s
clear avgSpectra
clear stdSpectra

%% mt 3

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
c=c*10e8;

h = coatingData_mt3.film;
sm = 5;
smPlaneFrac = 3;
un = c(6,:);
un(un==0)=[];

init = c(8,:);
init(init==0)=[];

drop = c(37,:);
drop(drop==0)=[];

plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt3_lineScans'])

end

% load and plot spectra
pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236';
fNameStruct = loadSpectralDataFromDir(pathName);
load(fNameStruct.avgSpectra)
load(fNameStruct.stdSpectra)
load(fNameStruct.spectra)
load(fNameStruct.f)
if ~strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    clear indsForAverage
end

plotIndivAvgSpectra(f,avgSpectra*10e8,stdSpectra*10e8,f_cutoff,P1s.*10e8,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt3_avgSpectra'])

end

clear c
clear un
clear init
clear drop
clear h

clear f
clear P1s
clear avgSpectra
clear stdSpectra

%% mt4

run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_mt_45_20190713.m')

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/c_cx_mt-x-180-144_cy_mt-y-234-287.mat')
c=c*10e8;

h4_naked = 10e8*mt4naked00067.y;

h4_naked(isnan(h4_naked))=[];

h = coatingData_mt4.film;
sm = 5;
smPlaneFrac = 3;

un = h4_naked';
init = c(3,:);

drop = c(12,:);
drop(drop==0)=[];

plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt4_lineScans'])

end

% load and plot spectra
pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287';
fNameStruct = loadSpectralDataFromDir(pathName);
load(fNameStruct.avgSpectra)
load(fNameStruct.stdSpectra)
load(fNameStruct.spectra)
load(fNameStruct.f)
if ~strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    clear indsForAverage
end

plotIndivAvgSpectra(f,avgSpectra*10e8,stdSpectra*10e8,f_cutoff,P1s.*10e8,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt4_avgSpectra'])

end

clear un
clear init
clear drop
clear h

clear f
clear P1s
clear avgSpectra
clear stdSpectra

%% mt 5 spectra only

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117';
fNameStruct = loadSpectralDataFromDir(pathName);
load(fNameStruct.avgSpectra)
load(fNameStruct.stdSpectra)
load(fNameStruct.spectra)
load(fNameStruct.f)
if ~strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    clear indsForAverage
end

plotIndivAvgSpectra(f,avgSpectra*10e8,stdSpectra*10e8,f_cutoff,P1s.*10e8,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt5_avgSpectra'])

end

clear un
clear init
clear drop
clear h

clear f
clear P1s
clear avgSpectra
clear stdSpectra

%% mt 6 spectra only

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132';
fNameStruct = loadSpectralDataFromDir(pathName);
load(fNameStruct.avgSpectra)
load(fNameStruct.stdSpectra)
load(fNameStruct.spectra)
load(fNameStruct.f)
if ~strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    clear indsForAverage
end

plotIndivAvgSpectra(f,avgSpectra*10e8,stdSpectra*10e8,f_cutoff,P1s.*10e8,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt6_avgSpectra'])

end

clear un
clear init
clear drop
clear h

clear f
clear P1s
clear avgSpectra
clear stdSpectra

%% mt 7 LIKELY WILL NOT USE LINE SCANS... FROM DIFFERENT MTS

% load naked MT data
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191031_expt10_mtnaked.m')
expt10_20191031_mtnaked_table = expt1024681012141618bg1357911131517MtNakedframe39420191031;
clear expt1024681012141618bg1357911131517MtNakedframe39420191031;

% load tpx2 init
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-173-159_cy_mt-y-2-118/c_cx_mt-x-173-159_cy_mt-y-2-118.mat')
% run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191031_expt10_mt4xTpx2flcoated.m')
% expt10_20191031_mt4xtpx2fl_table = expt10246bg135Mt4xTpx2flCoatedframe39620191031;
% clear expt10246bg135MtNakedframe39620191031;

% h7_naked = [expt10_20191031_mtnaked_table.y]*10e8;
% h7_naked(isnan(h7_naked))=[];

h7_tpx2_4x = [expt10_20191031_mt4xtpx2fl_table.y2]*10e8;
h7_tpx2_4x(isnan(h7_tpx2_4x))=[];


un = h7_naked';
% init = h7_tpx2_4x';
init = c(1,:);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490/c_cx_mt-x-167-329_cy_mt-y-2-490.mat')
drop = c(1,end-150:end);
% drop = c(1,:);
drop(drop==0)=[];
drop=flip(drop);
h = coatingData_mt7.film;
sm = 5;
smPlaneFrac = 1;

% psp.ymax=60;
% psp.xTicks=0:200:1200;

plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt7_lineScans_eachDifferent'])

end

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490';
fNameStruct = loadSpectralDataFromDir(pathName);
load(fNameStruct.avgSpectra)
load(fNameStruct.stdSpectra)
load(fNameStruct.spectra)
load(fNameStruct.f)
if ~strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    clear indsForAverage
end

plotIndivAvgSpectra(f,avgSpectra*10e8,stdSpectra*10e8,f_cutoff,P1s.*10e8,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt7_avgSpectra'])

end

clear un
clear init
clear drop
clear h

clear f
clear P1s
clear avgSpectra
clear stdSpectra

%% mt 8
pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364';
fNameStruct = loadSpectralDataFromDir(pathName);
load(fNameStruct.avgSpectra)
load(fNameStruct.stdSpectra)
load(fNameStruct.spectra)s
load(fNameStruct.f)
if ~strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    clear indsForAverage
end

plotIndivAvgSpectra(f,avgSpectra*10e8,stdSpectra*10e8,f_cutoff,P1s.*10e8,psp)

if doSave == 1
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'mt8_avgSpectra'])

end

clear un
clear init
clear drop
clear h

clear f
clear P1s
clear avgSpectra
clear stdSpectra
