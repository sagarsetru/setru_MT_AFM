% Sagar Setru
% 2019 09 27


% Change the current folder to the folder of this m-file
% add to path
%cd('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis')

addpath(genpath('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis'))

% import MT naked and TPX2 height measurements from txt files
% run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadMtHeightDataAndTheoryCurve.m')


% for saving
saveDirMain = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures';

% main path for running scripts to load height data
runDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/';
%% import MT naked and TPX2 height measurements from txt files for MTs 1, 2,
% 3 from 2019 07 16
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_mt_123_20190716.m')

% get path to save data in
[saveDir]=fileparts(filename);
%% load line scan data and compute for mt1, 2019 07 16

% load data from table
h1_naked = mt123naked00228.y;
h1_bg_naked = mt123naked00228.y1;
h1_tpx2 = mt123tpx200231.y;
h1_bg_tpx2 = mt123tpx200231.y1;

% load input data for naked mt
inputData_mt1.h_naked = h1_naked;
inputData_mt1.h_bg_naked = h1_bg_naked;

% load input data for tpx2 coated mt
inputData_mt1.h_tpx2 = h1_tpx2;
inputData_mt1.h_bg_tpx2 = h1_bg_tpx2;

% lets user select cut off (will ignore any provided via input)
selectCutOff = 0;

if selectCutOff == 0
    
    % load cut off for removing any schmutz in background signal for naked mt
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi1bgn.mat')
    inputData_mt1.yibgn = yi1bgn;
%     clear yi1bgn

    % load cut off for removing any schmutz in background signal for tpx2
    % coated mt
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi1bgtp.mat')
    inputData_mt1.yibgtp = yi1bgtp;
%     clear yi1bgtp
    
end

% load input data from fourier analysis
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/spacing_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/spacing_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')

% load the max frequencies for all line scans used (used to get denominator
% for calculating standard error of mean)
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/maxFrequencies_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/maxFrequencies_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')
lmb_mt1 = spacing;

inputData_mt1.lmb = lmb_mt1;
inputData_mt1.maxF_all = maxF_all;
clear spacing
clear maxF_all

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt1] = fxn_mtFilmAndRatioCalc(inputData_mt1,selectCutOff);

% save outputData to mat file
save([saveDir,'/coatingData_mt1.mat'],'coatingData_mt1')
save([saveDirMain,'/coatingData_mt1.mat'],'coatingData_mt1')
%% load line scan data and compute for mt2, 2019 07 16

% load height profiles
h2_naked = mt123naked00228.y2;
h2_bg_naked = mt123naked00228.y3;
h2_tpx2 = mt123tpx200231.y2;
h2_bg_tpx2 = mt123tpx200231.y3;

% load input data for naked mt
inputData_mt2.h_naked = h2_naked;
inputData_mt2.h_bg_naked = h2_bg_naked;

% load input data for tpx2 coated mt
inputData_mt2.h_tpx2 = h2_tpx2;
inputData_mt2.h_bg_tpx2 = h2_bg_tpx2;

selectCutOff = 0;

% correct for peaks in bg line scan
if selectCutOff == 0
    
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi2bgn.mat')
    inputData_mt2.yibgn = yi2bgn;
%     clear yi2bgn
    
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi2bgtp.mat')
    inputData_mt2.yibgtp = yi2bgtp;
%     clear yi2bgtp
    
end

%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-215_cy_mt-y-287-232/spacing_c_cx_mt-x-112-215_cy_mt-y-287-232.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/spacing_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
lmb_mt2 = spacing;
inputData_mt2.lmb = lmb_mt2;

%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-215_cy_mt-y-287-232/maxFrequencies_c_cx_mt-x-112-215_cy_mt-y-287-232.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/maxFrequencies_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
inputData_mt2.maxF_all = maxF_all;

clear spacing
clear maxF_all

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt2] = fxn_mtFilmAndRatioCalc(inputData_mt2,selectCutOff);

% save outputData to mat file
save([saveDir,'/coatingData_mt2.mat'],'coatingData_mt2')
save([saveDirMain,'/coatingData_mt2.mat'],'coatingData_mt2')

%% load line scan data and compute for mt3, 2019 07 16

selectCutOff = 0;

h3_naked = mt123naked00228.y4;
h3_bg_naked = mt123naked00228.y5;
h3_tpx2 = mt123tpx200231.y4;
h3_bg_tpx2 = mt123tpx200231.y5;

% load input data for naked mt
inputData_mt3.h_naked = h3_naked;
inputData_mt3.h_bg_naked = h3_bg_naked;

% load input data for tpx2 coated mt
inputData_mt3.h_tpx2 = h3_tpx2;
inputData_mt3.h_bg_tpx2 = h3_bg_tpx2;

% correct for peaks in bg line scan
if selectCutOff == 0
    
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi3bgn.mat')
    inputData_mt3.yibgn = yi3bgn;
%     clear yi3bgn;
    
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi3bgtp.mat')
    inputData_mt3.yibgtp = yi3bgtp;
%     clear yi3bgtp;
    
end

%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-224-190_cy_mt-y-240-286/spacing_c_cx_mt-x-224-190_cy_mt-y-240-286.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/spacing_c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
lmb_mt3 = spacing;
inputData_mt3.lmb = lmb_mt3;

%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-224-190_cy_mt-y-240-286/maxFrequencies_c_cx_mt-x-224-190_cy_mt-y-240-286.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/maxFrequencies_c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
inputData_mt3.maxF_all = maxF_all;

clear spacing
clear maxF_all

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt3] = fxn_mtFilmAndRatioCalc(inputData_mt3,selectCutOff);

% save outputData to mat file
save([saveDir,'/coatingData_mt3.mat'],'coatingData_mt3')
save([saveDirMain,'/coatingData_mt3.mat'],'coatingData_mt3')

%% import MT naked and TPX2 height measurements from txt files for MTs 4
% for mt 5, only TPX2 height measurements (25 is assumed for naked)

run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_mt_45_20190713.m')

% get path to save data in
[saveDir]=fileparts(filename);

%% load line scan and compute for mt4, 2018 07 13

selectCutOff = 0;

h4_naked = mt4naked00067.y;
h4_bg_naked = mt4naked00067.y1;
h4_tpx2 = mt45tpx200070.y2; 
h4_bg_tpx2 = mt45tpx200070.y3;

% load input data for naked mt
inputData_mt4.h_naked = h4_naked;
inputData_mt4.h_bg_naked = h4_bg_naked;

% load input data for tpx2 coated mt
inputData_mt4.h_tpx2 = h4_tpx2;
inputData_mt4.h_bg_tpx2 = h4_bg_tpx2;
 
if selectCutOff == 0
    
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/yi4bgtp.mat')
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/yi4bgn.mat')
    inputData_mt4.yibgn = yi4bgn;
    inputData_mt4.yibgtp = yi4bgtp;
%     clear yi4bgn
%     clear yi4bgtp
    
end

%load('../data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-148-179_cy_mt-y-285-238/spacing_c_cx_mt-x-148-179_cy_mt-y-285-238.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/spacing_c_cx_mt-x-180-144_cy_mt-y-234-287.mat')
lmb_mt4 = spacing;

inputData_mt4.lmb = lmb_mt4;

%load('../data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-148-179_cy_mt-y-285-238/maxFrequencies_c_cx_mt-x-148-179_cy_mt-y-285-238.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/maxFrequencies_c_cx_mt-x-180-144_cy_mt-y-234-287.mat')

inputData_mt4.maxF_all = maxF_all;

clear spacing
clear maxF_all

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt4] = fxn_mtFilmAndRatioCalc(inputData_mt4,selectCutOff);

% save outputData to mat file
save([saveDir,'/coatingData_mt4.mat'],'coatingData_mt4')
save([saveDirMain,'/coatingData_mt4.mat'],'coatingData_mt4')

%% mt 5, 2019 07 13

h5_tpx2 = mt45tpx200070.y; 
h5_bg_tpx2 = mt45tpx200070.y1;
% since naked was not measured for mt5, assume 25
h5_naked = 25e-9;
h5_bg_naked = 0;

inputData_mt5.h_tpx2 = h5_tpx2;
inputData_mt5.h_bg_tpx2 = h5_bg_tpx2;

inputData_mt5.h_naked = h5_naked;
inputData_mt5.h_bg_naked = h5_bg_naked;

selectCutOff = 0;

if selectCutOff == 0

    % correct for peaks in bg line scan
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/yi5bgtp.mat')
    inputData_mt5.yibgtp = yi5bgtp;
%     clear yi5bgtp;
    
    % set dummy value for this
    inputData_mt5.yibgn = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117/spacing_c_cx_mt-x-114-179_cy_mt-y-92-117.mat')
lmb_mt5 = spacing;

inputData_mt5.lmb = lmb_mt5;

%load('../data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-178-115_cy_mt-y-119-94/maxFrequencies_c_cx_mt-x-178-115_cy_mt-y-119-94.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117/maxFrequencies_c_cx_mt-x-114-179_cy_mt-y-92-117.mat')
inputData_mt5.maxF_all = maxF_all;

clear spacing;
clear maxF_all;

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt5] = fxn_mtFilmAndRatioCalc(inputData_mt5,selectCutOff);

save([saveDir,'/coatingData_mt5.mat'],'coatingData_mt5')
save([saveDirMain,'/coatingData_mt5.mat'],'coatingData_mt5')

%% mt 6, 2019 07 13
% will assume it to be close to the coating thickness of those MTs nearby

% remove errors in background manually for mt4 and mt5 before using mt4 and
% mt5 to guess value for height of mt6
h4_bg_tpx2(h4_bg_tpx2>yi4bgtp)=[];
h5_bg_tpx2(h5_bg_tpx2>yi5bgtp)=[];

% define tpx2 height as combo of mt4 and mt5 tpx2 coated heights
h6_tpx2 = [h4_tpx2; h5_tpx2]; 
h6_bg_tpx2 = [h4_bg_tpx2; h5_bg_tpx2];

% since naked was not measured for mt6, assume 25
h6_naked = 25e-9;
h6_bg_naked = 0;

inputData_mt6.h_tpx2 = h6_tpx2;
inputData_mt6.h_bg_tpx2 = h6_bg_tpx2;

inputData_mt6.h_naked = h6_naked;
inputData_mt6.h_bg_naked = h6_bg_naked;

selectCutOff = 0;
% set dummy values for cutoffs
if selectCutOff == 0
    inputData_mt6.yibgn = 1;
    inputData_mt6.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132/spacing_c_cx_mt-x-219-209_cy_mt-y-3-132.mat')
%load('../data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-218-197_cy_mt-y-7-250/spacing_c_cx_mt-x-218-197_cy_mt-y-7-250.mat')
lmb_mt6 = spacing;
inputData_mt6.lmb = lmb_mt6;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132/maxFrequencies_c_cx_mt-x-219-209_cy_mt-y-3-132.mat')
inputData_mt6.maxF_all = maxF_all;

clear spacing
clear maxF_all

% manually define saveDir here
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91';

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt6] = fxn_mtFilmAndRatioCalc(inputData_mt6,selectCutOff);

save([saveDir,'/coatingData_mt6.mat'],'coatingData_mt6')
save([saveDirMain,'/coatingData_mt6.mat'],'coatingData_mt6')

%% import data for expt 10, 2019 10 31
% for mt 7, 8

% load naked MT data
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191031_expt10_mtnaked.m')
expt10_20191031_mtnaked_table = expt1024681012141618bg1357911131517MtNakedframe39420191031;
clear expt1024681012141618bg1357911131517MtNakedframe39420191031;

% load 4x TPX2 coated Mt data
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191031_expt10_mt4xTpx2flcoated.m')
expt10_20191031_mt4xtpx2fl_table = expt10246bg135Mt4xTpx2flCoatedframe39620191031;
clear expt10246bg135MtNakedframe39620191031;

%% mt7

% define naked height as strung together height of all naked MTs measured
h7_naked = [...
    expt10_20191031_mtnaked_table.y;...
    expt10_20191031_mtnaked_table.y2;...
    expt10_20191031_mtnaked_table.y4;...
    expt10_20191031_mtnaked_table.y6;...
    expt10_20191031_mtnaked_table.y8;...
    expt10_20191031_mtnaked_table.y10;...
    expt10_20191031_mtnaked_table.y12;...
    expt10_20191031_mtnaked_table.y14;...
    expt10_20191031_mtnaked_table.y16;...
    ];

h7_bg_naked = [...
    expt10_20191031_mtnaked_table.y1;...
    expt10_20191031_mtnaked_table.y3;...
    expt10_20191031_mtnaked_table.y5;...
    expt10_20191031_mtnaked_table.y7;...
    expt10_20191031_mtnaked_table.y9;...
    expt10_20191031_mtnaked_table.y11;...
    expt10_20191031_mtnaked_table.y13;...
    expt10_20191031_mtnaked_table.y15;...
    expt10_20191031_mtnaked_table.y17;...
    ];

h7_tpx2_4x = [...
    expt10_20191031_mt4xtpx2fl_table.y;...
    expt10_20191031_mt4xtpx2fl_table.y2;...
    expt10_20191031_mt4xtpx2fl_table.y4;...
    ];

h7_bg_tpx2_4x = [...
    expt10_20191031_mt4xtpx2fl_table.y1;...
    expt10_20191031_mt4xtpx2fl_table.y3;...
    expt10_20191031_mt4xtpx2fl_table.y5;...
    ];

inputData_mt7.h_tpx2 = h7_tpx2_4x;
inputData_mt7.h_bg_tpx2 = h7_bg_tpx2_4x;

inputData_mt7.h_naked = h7_naked;
inputData_mt7.h_bg_naked = h7_bg_naked;


selectCutOff = 0;
% set dummy values for cutoffs
if selectCutOff == 0
    inputData_mt7.yibgn = 1;
    inputData_mt7.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490/spacing_c_cx_mt-x-167-329_cy_mt-y-2-490.mat')
lmb_mt7 = spacing;
inputData_mt7.lmb = lmb_mt7;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490/maxFrequencies_c_cx_mt-x-167-329_cy_mt-y-2-490.mat')
inputData_mt7.maxF_all = maxF_all;

clear spacing
clear maxF_all

% manually define saveDir here
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody';

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt7] = fxn_mtFilmAndRatioCalc(inputData_mt7,selectCutOff);

save([saveDir,'/coatingData_mt7.mat'],'coatingData_mt7')
save([saveDirMain,'/coatingData_mt7.mat'],'coatingData_mt7')

%% mt 8 (uses same thickness measurement as for mt7)
inputData_mt8.h_tpx2 = h7_tpx2_4x;
inputData_mt8.h_bg_tpx2 = h7_bg_tpx2_4x;

inputData_mt8.h_naked = h7_naked;
inputData_mt8.h_bg_naked = h7_bg_naked;

selectCutOff = 0;
% set dummy values for cutoffs
if selectCutOff == 0
    inputData_mt8.yibgn = 1;
    inputData_mt8.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364/spacing_c_cx_mt-x-237-461_cy_mt-y-43-364.mat')
lmb_mt8 = spacing;
inputData_mt8.lmb = lmb_mt8;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364/maxFrequencies_c_cx_mt-x-237-461_cy_mt-y-43-364.mat')
inputData_mt8.maxF_all = maxF_all;

clear spacing
clear maxF_all

% manually define saveDir here
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody';

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt8] = fxn_mtFilmAndRatioCalc(inputData_mt8,selectCutOff);

save([saveDir,'/coatingData_mt8.mat'],'coatingData_mt8')
save([saveDirMain,'/coatingData_mt8.mat'],'coatingData_mt8')

%% mt 9
% same naked mt thickness, but specific coated thickness

h9_tpx2_4x = [...
    expt10_20191031_mt4xtpx2fl_table.y;...
    ];

h9_bg_tpx2_4x = [...
    expt10_20191031_mt4xtpx2fl_table.y1;...
    ];

inputData_mt9.h_tpx2 = h9_tpx2_4x;
inputData_mt9.h_bg_tpx2 = h9_bg_tpx2_4x;

inputData_mt9.h_naked = h7_naked;
inputData_mt9.h_bg_naked = h7_bg_naked;

selectCutOff = 0;
% set dummy values for cutoffs
if selectCutOff == 0
    inputData_mt9.yibgn = 1;
    inputData_mt9.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223/spacing_c_cx_mt-x-233-209_cy_mt-y-8-223.mat')
lmb_mt9 = spacing;
inputData_mt9.lmb = lmb_mt9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223/maxFrequencies_c_cx_mt-x-233-209_cy_mt-y-8-223.mat')
inputData_mt9.maxF_all = maxF_all;

clear spacing
clear maxF_all

saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine';

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt9] = fxn_mtFilmAndRatioCalc(inputData_mt9,selectCutOff);

save([saveDir,'/coatingData_mt9.mat'],'coatingData_mt9')
save([saveDirMain,'/coatingData_mt9.mat'],'coatingData_mt9')

%% 2019 10 28, expt 2, 0.5x tpx2

% load naked mt height data
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191028_expt2_mtNaked.m');
expt2_20191028_mtNaked_table = expt224681012bg1357911MtNakedframe3720191028;
clear expt224681012bg1357911MtNakedframe3720191028;

% load tpx2 coated mt data
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191028_expt2_mtTpx2Coated_halfXConcentration.m');
expt2_20191028_mt_half_x_tpx2fl_table = expt2246810bg13579MtTpx2InitCoatingframe4120191028;
clear expt2246810bg13579MtTpx2InitCoatingframe4120191028;

%% mt 10, 2019 10 28, expt 2, 0.5x tpx2, 37-59, bottom left mt

% load data from table
h10_naked = expt2_20191028_mtNaked_table.y8;
h10_bg_naked = expt2_20191028_mtNaked_table.y9;

% load input data for tpx2 coated mt
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191028_expt2_mt10_Tpx2Coated.m')
h10_tpx2 = expt22bg1MtTpx2Coatedframe4120191028.y;
h10_bg_tpx2 = expt22bg1MtTpx2Coatedframe4120191028.y1;

% load input data for naked mt
inputData_mt10.h_naked = h10_naked;
inputData_mt10.h_bg_naked = h10_bg_naked;


inputData_mt10.h_tpx2 = h10_tpx2;
inputData_mt10.h_bg_tpx2 = h10_bg_tpx2;

% for this MT, need to trim data in background
selectCutOff = 0;
if selectCutOff == 0
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgn_mt10.mat')
    inputData_mt10.yibgn = yibgn;
    clear yibgn
    
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgtp_mt10.mat')
    inputData_mt10.yibgtp = yibgtp;
    clear yibgtp
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/spacing_c_cx_mt-x-7-124_cy_mt-y-156-230.mat')
lmb_mt10 = spacing;
inputData_mt10.lmb = lmb_mt10;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/maxFrequencies_c_cx_mt-x-7-124_cy_mt-y-156-230.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/indsForAverage_c_cx_mt-x-7-124_cy_mt-y-156-230.mat')

inputData_mt10.maxF_all = maxF_all(indsForAverage);

clear spacing
clear maxF_all
clear indsForAverage

saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt10] = fxn_mtFilmAndRatioCalc(inputData_mt10,selectCutOff);

if selectCutOff == 1
    
    yibgn = coatingData_mt10.yibgn;
    yibgtp = coatingData_mt10.yibgtp;
    
    save([saveDir,'/yibgn_mt10.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt10.mat'],'yibgtp')
end

save([saveDir,'/coatingData_mt10.mat'],'coatingData_mt10')
save([saveDirMain,'/coatingData_mt10.mat'],'coatingData_mt10')

%% mt 11, 2019 10 28, expt 2, 60-62, top right straight mt

% load data from table
h11_naked = expt2_20191028_mtNaked_table.y;
h11_bg_naked = expt2_20191028_mtNaked_table.y1;

% load input data for tpx2 coated mt
h11_tpx2 = expt2_20191028_mt_half_x_tpx2fl_table.y8;
h11_bg_tpx2 = expt2_20191028_mt_half_x_tpx2fl_table.y9;

% load input data for naked mt
inputData_mt11.h_naked = h11_naked;
inputData_mt11.h_bg_naked = h11_bg_naked;


inputData_mt11.h_tpx2 = h11_tpx2;
inputData_mt11.h_bg_tpx2 = h11_bg_tpx2;

% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt11.yibgn = 1;
    
    inputData_mt11.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153/spacing_c_cx_mt-x-96-253_cy_mt-y-31-153.mat')
lmb_mt11 = spacing;
inputData_mt11.lmb = lmb_mt11;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153/maxFrequencies_c_cx_mt-x-96-253_cy_mt-y-31-153.mat')
inputData_mt11.maxF_all = maxF_all;

clear spacing
clear maxF_all

saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt11] = fxn_mtFilmAndRatioCalc(inputData_mt11,selectCutOff);

if selectCutOff == 1
    
    yibgn = coatingData_mt11.yibgn;
    yibgtp = coatingData_mt11.yibgtp;
    
    save([saveDir,'/yibgn_mt11.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt11.mat'],'yibgtp')
end

save([saveDir,'/coatingData_mt11.mat'],'coatingData_mt11')
save([saveDirMain,'/coatingData_mt11.mat'],'coatingData_mt11')

%% mt 12, 2019 10 28, expt 2, frame 60-62, middle straight mt

% load data from table
h12_naked = expt2_20191028_mtNaked_table.y10;
h12_bg_naked = expt2_20191028_mtNaked_table.y11;

% load input data for tpx2 coated mt
h12_tpx2 = expt2_20191028_mt_half_x_tpx2fl_table.y2;
h12_bg_tpx2 = expt2_20191028_mt_half_x_tpx2fl_table.y3;

% load input data for naked mt
inputData_mt12.h_naked = h12_naked;
inputData_mt12.h_bg_naked = h12_bg_naked;


inputData_mt12.h_tpx2 = h12_tpx2;
inputData_mt12.h_bg_tpx2 = h12_bg_tpx2;

% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt12.yibgn = 1;
    
    inputData_mt12.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193/spacing_c_cx_mt-x-84-147_cy_mt-y-52-193.mat')
lmb_mt12 = spacing;
inputData_mt12.lmb = lmb_mt12;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193/maxFrequencies_c_cx_mt-x-84-147_cy_mt-y-52-193.mat')
inputData_mt12.maxF_all = maxF_all;

clear spacing
clear maxF_all

saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt12] = fxn_mtFilmAndRatioCalc(inputData_mt12,selectCutOff);

if selectCutOff == 1
    
    yibgn = coatingData_mt12.yibgn;
    yibgtp = coatingData_mt12.yibgtp;
    
    save([saveDir,'/yibgn_mt12.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt12.mat'],'yibgtp')
end

save([saveDir,'/coatingData_mt12.mat'],'coatingData_mt12')
save([saveDirMain,'/coatingData_mt12.mat'],'coatingData_mt12')

%% mt 13, 2019 10 28, expt 2, left mt, frame 68-72

% load data from table
h13_naked = [...
    expt2_20191028_mtNaked_table.y;...
    expt2_20191028_mtNaked_table.y2;...
    expt2_20191028_mtNaked_table.y4;...
    expt2_20191028_mtNaked_table.y6;...
    expt2_20191028_mtNaked_table.y8;...
    expt2_20191028_mtNaked_table.y10;...
    ];

h13_bg_naked = [...
    expt2_20191028_mtNaked_table.y1;...
    expt2_20191028_mtNaked_table.y3;...
    expt2_20191028_mtNaked_table.y5;...
    expt2_20191028_mtNaked_table.y7;...
    expt2_20191028_mtNaked_table.y9;...
    expt2_20191028_mtNaked_table.y11;...
    ];
    
% load input data for tpx2 coated mt
h13_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y;...
    expt2_20191028_mt_half_x_tpx2fl_table.y2;...
    expt2_20191028_mt_half_x_tpx2fl_table.y4;...
    expt2_20191028_mt_half_x_tpx2fl_table.y6;...
    expt2_20191028_mt_half_x_tpx2fl_table.y8;...
    ];
    
h13_bg_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y1;...
    expt2_20191028_mt_half_x_tpx2fl_table.y3;...
    expt2_20191028_mt_half_x_tpx2fl_table.y5;...
    expt2_20191028_mt_half_x_tpx2fl_table.y7;...
    expt2_20191028_mt_half_x_tpx2fl_table.y9;...
    ];
% load input data for naked mt
inputData_mt13.h_naked = h13_naked;
inputData_mt13.h_bg_naked = h13_bg_naked;


inputData_mt13.h_tpx2 = h13_tpx2;
inputData_mt13.h_bg_tpx2 = h13_bg_tpx2;

% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt13.yibgn = 1;
    
    inputData_mt13.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247/spacing_c_cx_mt-x-110-38_cy_mt-y-59-247.mat')
lmb_mt13 = spacing;
inputData_mt13.lmb = lmb_mt13;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247/maxFrequencies_c_cx_mt-x-110-38_cy_mt-y-59-247.mat')
inputData_mt13.maxF_all = maxF_all;

clear spacing
clear maxF_all

saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt13] = fxn_mtFilmAndRatioCalc(inputData_mt13,selectCutOff);

if selectCutOff == 1
    
    yibgn = coatingData_mt13.yibgn;
    yibgtp = coatingData_mt13.yibgtp;
    
    save([saveDir,'/yibgn_mt13.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt13.mat'],'yibgtp')
end

save([saveDir,'/coatingData_mt13.mat'],'coatingData_mt13')
save([saveDirMain,'/coatingData_mt13.mat'],'coatingData_mt13')

%% 2019 10 28, expt 1, 0.5x tpx2, 50-150nM

run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191028_expt1_mtNaked.m')
expt1_20191028_mtNaked = expt124bg13MtNakedframe120191028;
clear expt124bg13MtNakedframe120191028

run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/scripts_loadMtHeighData/loadMtHeightData_20191028_expt1_mtCoated.m')
expt1_20191028_mtCoated = expt124bg13MtTpx2InitCoatframe420191028;
clear expt124bg13MtTpx2InitCoatframe420191028;

%% mt 14, expt 1, 2019 10 28, 0.5x tpx2

% load data from table
h14_naked = expt1_20191028_mtNaked.y;
h14_bg_naked = expt1_20191028_mtNaked.y1;
h14_tpx2 = expt1_20191028_mtCoated.y;
h14_bg_tpx2 = expt1_20191028_mtCoated.y1;

% load input data for naked mt
inputData_mt14.h_naked = h14_naked;
inputData_mt14.h_bg_naked = h14_bg_naked;

% load input data for tpx2 coated mt
inputData_mt14.h_tpx2 = h14_tpx2;
inputData_mt14.h_bg_tpx2 = h14_bg_tpx2;

% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt14.yibgn = 1;
    
    inputData_mt14.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166/spacing_c_cx_mt-x-113-197_cy_mt-y-99-166.mat')
lmb_mt14 = spacing;
inputData_mt14.lmb = lmb_mt14;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166/maxFrequencies_c_cx_mt-x-113-197_cy_mt-y-99-166.mat')
inputData_mt14.maxF_all = maxF_all;

clear spacing
clear maxF_all

saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine';

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt14] = fxn_mtFilmAndRatioCalc(inputData_mt14,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt14.yibgn;
    yibgtp = coatingData_mt14.yibgtp;
    
    save([saveDir,'/yibgn_mt14.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt14.mat'],'yibgtp')
end

save([saveDir,'/coatingData_mt14.mat'],'coatingData_mt14')
save([saveDirMain,'/coatingData_mt14.mat'],'coatingData_mt14')
%% mt 15, expt 1, 2019 10 28, 0.5x tpx2
 
% load data from table
h15_naked = expt1_20191028_mtNaked.y2;
h15_bg_naked = expt1_20191028_mtNaked.y3;
h15_tpx2 = expt1_20191028_mtCoated.y2;
h15_bg_tpx2 = expt1_20191028_mtCoated.y3;
 
% load input data for naked mt
inputData_mt15.h_naked = h15_naked;
inputData_mt15.h_bg_naked = h15_bg_naked;
 
% load input data for tpx2 coated mt
inputData_mt15.h_tpx2 = h15_tpx2;
inputData_mt15.h_bg_tpx2 = h15_bg_tpx2;

% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt15.yibgn = 1;
    
    inputData_mt15.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/spacing_c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
lmb_mt15 = spacing;
inputData_mt15.lmb = lmb_mt15;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/maxFrequencies_c_cx_mt-x-81-117_cy_mt-y-87-200.mat')
inputData_mt15.maxF_all = maxF_all;

clear spacing
clear maxF_all

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt15] = fxn_mtFilmAndRatioCalc(inputData_mt15,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt15.yibgn;
    yibgtp = coatingData_mt15.yibgtp;
    
    save([saveDir,'/yibgn_mt15.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt15.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt15.mat'],'coatingData_mt15')
save([saveDirMain,'/coatingData_mt15.mat'],'coatingData_mt15')

%% mt 16, 2019 10 28, expt 1
 
% load input data for naked mt
inputData_mt16.h_naked = [h14_naked; h15_naked];
inputData_mt16.h_bg_naked = [h14_bg_naked; h15_bg_naked];
 
% load input data for tpx2 coated mt
inputData_mt16.h_tpx2 = [h14_tpx2; h15_tpx2];
inputData_mt16.h_bg_tpx2 = [h14_bg_tpx2; h15_bg_tpx2];

% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt16.yibgn = 1;
    
    inputData_mt16.yibgtp = 1;
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_26-29_20191028_rigidBody/c_cx_mt-x-154-168_cy_mt-y-126-171/spacing_c_cx_mt-x-154-168_cy_mt-y-126-171.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_26-29_20191028_rigidBody/c_cx_mt-x-154-168_cy_mt-y-126-171/maxFrequencies_c_cx_mt-x-154-168_cy_mt-y-126-171.mat')

lmb_mt16 = spacing;
inputData_mt16.lmb = lmb_mt16;
inputData_mt16.maxF_all = maxF_all;

clear spacing
clear maxF_all
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt16] = fxn_mtFilmAndRatioCalc(inputData_mt16,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt16.yibgn;
    yibgtp = coatingData_mt16.yibgtp;
    
    save([saveDir,'/yibgn_mt16.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt16.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt16.mat'],'coatingData_mt16')
save([saveDirMain,'/coatingData_mt16.mat'],'coatingData_mt16')

%% mt 17, 2019 10 28, expt 1
 
% load input data for naked mt
inputData_mt17.h_naked = [h14_naked; h15_naked];
inputData_mt17.h_bg_naked = [h14_bg_naked; h15_bg_naked];
 
% load input data for tpx2 coated mt
inputData_mt17.h_tpx2 = [h14_tpx2; h15_tpx2];
inputData_mt17.h_bg_tpx2 = [h14_bg_tpx2; h15_bg_tpx2];
 
% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt17.yibgn = 1;
    
    inputData_mt17.yibgtp = 1;
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-56-89_cy_mt-y-55-15/spacing_c_cx_mt-x-56-89_cy_mt-y-55-15.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-56-89_cy_mt-y-55-15/maxFrequencies_c_cx_mt-x-56-89_cy_mt-y-55-15.mat')

lmb_mt17 = spacing;
inputData_mt17.lmb = lmb_mt17;
inputData_mt17.maxF_all = maxF_all;
 
clear spacing
clear maxF_all
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt17] = fxn_mtFilmAndRatioCalc(inputData_mt17,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt17.yibgn;
    yibgtp = coatingData_mt17.yibgtp;
    
    save([saveDir,'/yibgn_mt17.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt17.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt17.mat'],'coatingData_mt17')
save([saveDirMain,'/coatingData_mt17.mat'],'coatingData_mt17')


%% mt 18, 2019 10 28, expt 1
 
% load input data for naked mt
inputData_mt18.h_naked = [h14_naked; h15_naked];
inputData_mt18.h_bg_naked = [h14_bg_naked; h15_bg_naked];
 
% load input data for tpx2 coated mt
inputData_mt18.h_tpx2 = [h14_tpx2; h15_tpx2];
inputData_mt18.h_bg_tpx2 = [h14_bg_tpx2; h15_bg_tpx2];
 
% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt18.yibgn = 1;
    
    inputData_mt18.yibgtp = 1;
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-124-189_cy_mt-y-108-143/spacing_c_cx_mt-x-124-189_cy_mt-y-108-143.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-124-189_cy_mt-y-108-143/maxFrequencies_c_cx_mt-x-124-189_cy_mt-y-108-143.mat')

lmb_mt18 = spacing;
inputData_mt18.lmb = lmb_mt18;
inputData_mt18.maxF_all = maxF_all;
 
clear spacing
clear maxF_all
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt18] = fxn_mtFilmAndRatioCalc(inputData_mt18,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt18.yibgn;
    yibgtp = coatingData_mt18.yibgtp;
    
    save([saveDir,'/yibgn_mt18.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt18.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt18.mat'],'coatingData_mt18')
save([saveDirMain,'/coatingData_mt18.mat'],'coatingData_mt18')

%% mt 19, 2019 10 28, expt 1
 
% load input data for naked mt
inputData_mt19.h_naked = [h14_naked; h15_naked];
inputData_mt19.h_bg_naked = [h14_bg_naked; h15_bg_naked];
 
% load input data for tpx2 coated mt
inputData_mt19.h_tpx2 = [h14_tpx2; h15_tpx2];
inputData_mt19.h_bg_tpx2 = [h14_bg_tpx2; h15_bg_tpx2];
 
% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt19.yibgn = 1;
    
    inputData_mt19.yibgtp = 1;
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-115-166_cy_mt-y-95-108/maxFrequencies_c_cx_mt-x-115-166_cy_mt-y-95-108.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-115-166_cy_mt-y-95-108/spacing_c_cx_mt-x-115-166_cy_mt-y-95-108.mat')

lmb_mt19 = spacing;
inputData_mt19.lmb = lmb_mt19;
inputData_mt19.maxF_all = maxF_all;
 
clear spacing
clear maxF_all
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt19] = fxn_mtFilmAndRatioCalc(inputData_mt19,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt19.yibgn;
    yibgtp = coatingData_mt19.yibgtp;
    
    save([saveDir,'/yibgn_mt19.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt19.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt19.mat'],'coatingData_mt19')
save([saveDirMain,'/coatingData_mt19.mat'],'coatingData_mt19')


%% mt 20, 2019 10 28, expt 1
 
% load input data for naked mt
inputData_mt20.h_naked = [h14_naked; h15_naked];
inputData_mt20.h_bg_naked = [h14_bg_naked; h15_bg_naked];
 
% load input data for tpx2 coated mt
inputData_mt20.h_tpx2 = [h14_tpx2; h15_tpx2];
inputData_mt20.h_bg_tpx2 = [h14_bg_tpx2; h15_bg_tpx2];
 
% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt20.yibgn = 1;
    
    inputData_mt20.yibgtp = 1;
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-153-179_cy_mt-y-2-73/maxFrequencies_c_cx_mt-x-153-179_cy_mt-y-2-73.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-153-179_cy_mt-y-2-73/spacing_c_cx_mt-x-153-179_cy_mt-y-2-73.mat')

lmb_mt20 = spacing;
inputData_mt20.lmb = lmb_mt20;
inputData_mt20.maxF_all = maxF_all;

clear spacing
clear maxF_all
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt20] = fxn_mtFilmAndRatioCalc(inputData_mt20,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt20.yibgn;
    yibgtp = coatingData_mt20.yibgtp;
    
    save([saveDir,'/yibgn_mt20.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt20.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt20.mat'],'coatingData_mt20')
save([saveDirMain,'/coatingData_mt20.mat'],'coatingData_mt20')

%% mt 21, 2019 10 28, expt 1
 
% load input data for naked mt
inputData_mt21.h_naked = [h14_naked; h15_naked];
inputData_mt21.h_bg_naked = [h14_bg_naked; h15_bg_naked];
 
% load input data for tpx2 coated mt
inputData_mt21.h_tpx2 = [h14_tpx2; h15_tpx2];
inputData_mt21.h_bg_tpx2 = [h14_bg_tpx2; h15_bg_tpx2];
 
% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt21.yibgn = 1;
    
    inputData_mt21.yibgtp = 1;
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_33-36_20191028_rigidBody/c_cx_mt-x-193-250_cy_mt-y-106-67/spacing_c_cx_mt-x-193-250_cy_mt-y-106-67.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_33-36_20191028_rigidBody/c_cx_mt-x-193-250_cy_mt-y-106-67/maxFrequencies_c_cx_mt-x-193-250_cy_mt-y-106-67.mat')

lmb_mt21 = spacing;
inputData_mt21.lmb = lmb_mt21;
inputData_mt21.maxF_all = maxF_all;
 
clear spacing
clear maxF_all
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt21] = fxn_mtFilmAndRatioCalc(inputData_mt21,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt21.yibgn;
    yibgtp = coatingData_mt21.yibgtp;
    
    save([saveDir,'/yibgn_mt21.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt21.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt21.mat'],'coatingData_mt21')
save([saveDirMain,'/coatingData_mt21.mat'],'coatingData_mt21')

%% mt 22, 2019 10 28, expt 2, 0.5x tpx2, 37-59, top left  mt

% load data from table
h22_naked = expt2_20191028_mtNaked_table.y4;
h22_bg_naked = expt2_20191028_mtNaked_table.y5;

% load input data for tpx2 coated mt
run([runDir,'loadMtHeightData_20191028_expt2_mt22_TopLeftMt_Tpx2Coated.m'])
h22_tpx2 = expt22bg1MtTpx2CoatedTopLeftMtframe4120191028.y;
h22_bg_tpx2 = expt22bg1MtTpx2CoatedTopLeftMtframe4120191028.y1;

% load input data for naked mt
inputData_mt22.h_naked = h22_naked;
inputData_mt22.h_bg_naked = h22_bg_naked;


inputData_mt22.h_tpx2 = h22_tpx2;
inputData_mt22.h_bg_tpx2 = h22_bg_tpx2;

% for this MT, need to trim data in background
selectCutOff = 0;
if selectCutOff == 0
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgn_mt10.mat')
    inputData_mt22.yibgn = yibgn;
    clear yibgn
    
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgtp_mt10.mat')
    inputData_mt22.yibgtp = yibgtp;
    clear yibgtp
end

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/spacing_c_cx_mt-x-9-73_cy_mt-y-15-29.mat')
lmb_mt22 = spacing;
inputData_mt22.lmb = lmb_mt22;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/maxFrequencies_c_cx_mt-x-9-73_cy_mt-y-15-29.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/indsForAverage_c_cx_mt-x-9-73_cy_mt-y-15-29.mat')

inputData_mt22.maxF_all = maxF_all(indsForAverage);

clear spacing
clear maxF_all
clear indsForAverage

saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt22] = fxn_mtFilmAndRatioCalc(inputData_mt22,selectCutOff);

if selectCutOff == 1
    
    yibgn = coatingData_mt22.yibgn;
    yibgtp = coatingData_mt22.yibgtp;
    
    save([saveDir,'/yibgn_mt22.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt22.mat'],'yibgtp')
end

save([saveDir,'/coatingData_mt22.mat'],'coatingData_mt22')
save([saveDirMain,'/coatingData_mt22.mat'],'coatingData_mt22')


%% mt 23, 2019 10 28, expt 2, 0.5x tpx2, 37-59, top left  mt
 
% load data from table
h23_naked = expt2_20191028_mtNaked_table.y6;
h23_bg_naked = expt2_20191028_mtNaked_table.y7;
 
% load input data for tpx2 coated mt
h23_tpx2 = expt2_20191028_mt_half_x_tpx2fl_table.y6;
h23_bg_tpx2 = expt2_20191028_mt_half_x_tpx2fl_table.y7;
 
% load input data for naked mt
inputData_mt23.h_naked = h23_naked;
inputData_mt23.h_bg_naked = h23_bg_naked;
 
 
inputData_mt23.h_tpx2 = h23_tpx2;
inputData_mt23.h_bg_tpx2 = h23_bg_tpx2;
 
% for this MT, need to trim data in background
selectCutOff = 0;
if selectCutOff == 0
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgn_mt10.mat')
    inputData_mt23.yibgn = yibgn;
    clear yibgn
    
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgtp_mt10.mat')
    inputData_mt23.yibgtp = yibgtp;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83/spacing_c_cx_mt-x-169-200_cy_mt-y-44-83.mat')
lmb_mt23 = spacing;
inputData_mt23.lmb = lmb_mt23;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83/maxFrequencies_c_cx_mt-x-169-200_cy_mt-y-44-83.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83/indsForAverage_c_cx_mt-x-169-200_cy_mt-y-44-83.mat')

inputData_mt23.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt23] = fxn_mtFilmAndRatioCalc(inputData_mt23,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt23.yibgn;
    yibgtp = coatingData_mt23.yibgtp;
    
    save([saveDir,'/yibgn_mt23.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt23.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt23.mat'],'coatingData_mt23')
save([saveDirMain,'/coatingData_mt23.mat'],'coatingData_mt23')
 

%% mt 24, 2019 10 28, expt 2, left mt, frame 68-72
 
% load data from table
h24_naked = [...
    expt2_20191028_mtNaked_table.y;...
    expt2_20191028_mtNaked_table.y2;...
    expt2_20191028_mtNaked_table.y4;...
    expt2_20191028_mtNaked_table.y6;...
    expt2_20191028_mtNaked_table.y8;...
    expt2_20191028_mtNaked_table.y10;...
    ];
 
h24_bg_naked = [...
    expt2_20191028_mtNaked_table.y1;...
    expt2_20191028_mtNaked_table.y3;...
    expt2_20191028_mtNaked_table.y5;...
    expt2_20191028_mtNaked_table.y7;...
    expt2_20191028_mtNaked_table.y9;...
    expt2_20191028_mtNaked_table.y11;...
    ];
    
% load input data for tpx2 coated mt
h24_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y;...
    expt2_20191028_mt_half_x_tpx2fl_table.y2;...
    expt2_20191028_mt_half_x_tpx2fl_table.y4;...
    expt2_20191028_mt_half_x_tpx2fl_table.y6;...
    expt2_20191028_mt_half_x_tpx2fl_table.y8;...
    ];
    
h24_bg_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y1;...
    expt2_20191028_mt_half_x_tpx2fl_table.y3;...
    expt2_20191028_mt_half_x_tpx2fl_table.y5;...
    expt2_20191028_mt_half_x_tpx2fl_table.y7;...
    expt2_20191028_mt_half_x_tpx2fl_table.y9;...
    ];
% load input data for naked mt
inputData_mt24.h_naked = h24_naked;
inputData_mt24.h_bg_naked = h24_bg_naked;
 
 
inputData_mt24.h_tpx2 = h24_tpx2;
inputData_mt24.h_bg_tpx2 = h24_bg_tpx2;
 
% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt24.yibgn = 1;
    
    inputData_mt24.yibgtp = 1;
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-214-229_cy_mt-y-234-198/spacing_c_cx_mt-x-214-229_cy_mt-y-234-198.mat')
lmb_mt24 = spacing;
inputData_mt24.lmb = lmb_mt24;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-214-229_cy_mt-y-234-198/maxFrequencies_c_cx_mt-x-214-229_cy_mt-y-234-198.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-214-229_cy_mt-y-234-198/indsForAverage_c_cx_mt-x-214-229_cy_mt-y-234-198.mat')

inputData_mt24.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt24] = fxn_mtFilmAndRatioCalc(inputData_mt24,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt24.yibgn;
    yibgtp = coatingData_mt24.yibgtp;
    
    save([saveDir,'/yibgn_mt24.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt24.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt24.mat'],'coatingData_mt24')
save([saveDirMain,'/coatingData_mt24.mat'],'coatingData_mt24')


%% mt 25, 2019 10 28, expt 2, left mt, frame 68-72
 
% load data from table
h25_naked = [...
    expt2_20191028_mtNaked_table.y;...
    expt2_20191028_mtNaked_table.y2;...
    expt2_20191028_mtNaked_table.y4;...
    expt2_20191028_mtNaked_table.y6;...
    expt2_20191028_mtNaked_table.y8;...
    expt2_20191028_mtNaked_table.y10;...
    ];
 
h25_bg_naked = [...
    expt2_20191028_mtNaked_table.y1;...
    expt2_20191028_mtNaked_table.y3;...
    expt2_20191028_mtNaked_table.y5;...
    expt2_20191028_mtNaked_table.y7;...
    expt2_20191028_mtNaked_table.y9;...
    expt2_20191028_mtNaked_table.y11;...
    ];
    
% load input data for tpx2 coated mt
h25_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y;...
    expt2_20191028_mt_half_x_tpx2fl_table.y2;...
    expt2_20191028_mt_half_x_tpx2fl_table.y4;...
    expt2_20191028_mt_half_x_tpx2fl_table.y6;...
    expt2_20191028_mt_half_x_tpx2fl_table.y8;...
    ];
    
h25_bg_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y1;...
    expt2_20191028_mt_half_x_tpx2fl_table.y3;...
    expt2_20191028_mt_half_x_tpx2fl_table.y5;...
    expt2_20191028_mt_half_x_tpx2fl_table.y7;...
    expt2_20191028_mt_half_x_tpx2fl_table.y9;...
    ];
% load input data for naked mt
inputData_mt25.h_naked = h25_naked;
inputData_mt25.h_bg_naked = h25_bg_naked;
 
 
inputData_mt25.h_tpx2 = h25_tpx2;
inputData_mt25.h_bg_tpx2 = h25_bg_tpx2;
 
% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt25.yibgn = 1;
    
    inputData_mt25.yibgtp = 1;
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-32-122_cy_mt-y-144-112/spacing_c_cx_mt-x-32-122_cy_mt-y-144-112.mat')
lmb_mt25 = spacing;
inputData_mt25.lmb = lmb_mt25;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-32-122_cy_mt-y-144-112/maxFrequencies_c_cx_mt-x-32-122_cy_mt-y-144-112.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-32-122_cy_mt-y-144-112/indsForAverage_c_cx_mt-x-32-122_cy_mt-y-144-112.mat')

inputData_mt25.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt25] = fxn_mtFilmAndRatioCalc(inputData_mt25,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt25.yibgn;
    yibgtp = coatingData_mt25.yibgtp;
    
    save([saveDir,'/yibgn_mt25.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt25.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt25.mat'],'coatingData_mt25')
save([saveDirMain,'/coatingData_mt25.mat'],'coatingData_mt25')






%% import mt QUICK TEST

% %run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadMtHeightData_mt1_3xTpx2Coated_12bg_3MtTpx2_20191025.m');
% baseDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/';
% fName1 = 'mt1_3xTpx2Coated_12bg_3MtTpx2_frame79_20191025';
% 
% mt13xTpx2Coated12bg3MtTpx220191025 = importfile_20191025_expt3_1([baseDir,fName1], 4, 147);
% 
% h7_bg_tpx2 = [mt13xTpx2Coated12bg3MtTpx220191025.y,...
%     mt13xTpx2Coated12bg3MtTpx220191025.y1];
% 
% h7_tpx2 = mt13xTpx2Coated12bg3MtTpx220191025.y2;
% 
% h7_bg_tpx2(isnan(h7_bg_tpx2)) = [];
% h7_tpx2(isnan(h7_tpx2)) = [];
% 
% (mean(h7_tpx2)-mean(h7_bg_tpx2))*1e9-25

%% with conc. noted

doSave = 0;

% load theory curve
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadRPTheoryCurve_nonDimensionalized.m')

h = filmHeight.e01;
lmb = wavelength.e01;%*1e3;
figure; hold on;
xafz = 14;
yafz = 14;
tvfz = 12;

tpData1 = 'r^';
tpData2 = 'gs';
tpData3 = 'b*';

tpLw = 1.5;
grid off

plot(h,lmb,'ko-','LineWidth',2)

plotLmbVsH(coatingData_mt10,tpData3,tpLw)
plotLmbVsH(coatingData_mt1,tpData1,tpLw)
plotLmbVsH(coatingData_mt7,tpData2,tpLw)

% 100-300nM, 1x
plotLmbVsH(coatingData_mt2,tpData1,tpLw)
plotLmbVsH(coatingData_mt3,tpData1,tpLw)
plotLmbVsH(coatingData_mt4,tpData1,tpLw)
plotLmbVsH(coatingData_mt5,tpData1,tpLw)
plotLmbVsH(coatingData_mt6,tpData1,tpLw)

% 400-1200nM, 3-4x
plotLmbVsH(coatingData_mt8,tpData2,tpLw)
plotLmbVsH(coatingData_mt9,tpData2,tpLw)


% 50-150nM, 0.5x
plotLmbVsH(coatingData_mt11,tpData3,tpLw)
plotLmbVsH(coatingData_mt12,tpData3,tpLw)
plotLmbVsH(coatingData_mt13,tpData3,tpLw)
plotLmbVsH(coatingData_mt14,tpData3,tpLw)
plotLmbVsH(coatingData_mt15,tpData3,tpLw)
plotLmbVsH(coatingData_mt16,tpData3,tpLw)
plotLmbVsH(coatingData_mt17,tpData3,tpLw)
plotLmbVsH(coatingData_mt18,tpData3,tpLw)
plotLmbVsH(coatingData_mt19,tpData3,tpLw)
plotLmbVsH(coatingData_mt20,tpData3,tpLw)
plotLmbVsH(coatingData_mt21,tpData3,tpLw)
plotLmbVsH(coatingData_mt22,tpData3,tpLw)
plotLmbVsH(coatingData_mt23,tpData3,tpLw)
plotLmbVsH(coatingData_mt24,tpData3,tpLw)
plotLmbVsH(coatingData_mt25,tpData3,tpLw)

%plot(mean([film_mt1 film_mt3 film_mt3 film_mt4 film_mt5 film_mt6]),229,'bo')
xlim([0 25])
ylim([0 .5])

gcf;
legend('f(h = a-s) = \lambda_{max}',...
    '50-150nM TPX2',...
    '100-300nM TPX2',...
    '400-1200nM TPX2')

legend('boxoff')
legend('Location','NorthWest')
simplePlotFormat( 'Film thickness (nm)', '\lambda_{RP} (\mum)', xafz, yafz, tvfz )
box on

if doSave
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/predicted and measured wavelength vs film thickness and tpx2 conc'])
    
end

%% make figure without conc noted
% set to 1 if saving figures
doSave = 0;


h = filmHeight.e01;
lmb = wavelength.e01;%*1e3;
figure; hold on;
xafz = 14;
yafz = 14;
tvfz = 12;

tpData1 = 'k^';
tpData2 = 'k^';
tpLw = 1.5;
grid off

plot(h,lmb,'o-','LineWidth',2)

plotLmbVsH(coatingData_mt1,tpData1,tpLw)
plotLmbVsH(coatingData_mt2,tpData1,tpLw)
plotLmbVsH(coatingData_mt3,tpData1,tpLw)
plotLmbVsH(coatingData_mt4,tpData1,tpLw)
plotLmbVsH(coatingData_mt5,tpData1,tpLw)
plotLmbVsH(coatingData_mt6,tpData1,tpLw)
plotLmbVsH(coatingData_mt7,tpData1,tpLw)
plotLmbVsH(coatingData_mt8,tpData1,tpLw)
plotLmbVsH(coatingData_mt9,tpData1,tpLw)
plotLmbVsH(coatingData_mt10,tpData1,tpLw)
plotLmbVsH(coatingData_mt11,tpData1,tpLw)
plotLmbVsH(coatingData_mt12,tpData1,tpLw)
plotLmbVsH(coatingData_mt13,tpData1,tpLw)
plotLmbVsH(coatingData_mt14,tpData1,tpLw)
plotLmbVsH(coatingData_mt15,tpData1,tpLw)


%plot(mean([film_mt1 film_mt3 film_mt3 film_mt4 film_mt5 film_mt6]),229,'bo')
xlim([0 25])
ylim([0 .5])

legend('f(h = a-s) = \lambda_{max}','TPX2 coated MT')
legend('boxoff')
legend('Location','NorthWest')
simplePlotFormat( 'Film thickness (nm)', '\lambda_{RP} (\mum)', xafz, yafz, tvfz )
box on

if doSave
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/predicted and measured wavelength vs film thickness'])
    
end


%% deprecated
%{
    save('film_mt1.mat','film_mt1')
    save('lmb_mt1.mat','lmb_mt1')
    save('errLmb_mt1.mat','errLmb_mt1')
    save('errFilm_mt1.mat','errFilm_mt1')
    save('filmRatio_mt1.mat','filmRatio_mt1')
    save('err_filmRatio_mt1.mat','err_filmRatio_mt1')
    save('lmbRatio_mt1.mat','lmbRatio_mt1')
    save('errLmbRatio_mt1.mat','errLmbRatio_mt1')
    
    save('film_mt2.mat','film_mt2')
    save('lmb_mt2.mat','lmb_mt2')
    save('errLmb_mt2.mat','errLmb_mt2')
    save('errFilm_mt2.mat','errFilm_mt2')
    save('filmRatio_mt2.mat','filmRatio_mt2')
    save('err_filmRatio_mt2.mat','err_filmRatio_mt2')
    save('lmbRatio_mt2.mat','lmbRatio_mt2')
    save('errLmbRatio_mt2.mat','errLmbRatio_mt2')
    
    save('film_mt3.mat','film_mt3')
    save('lmb_mt3.mat','lmb_mt3')
    save('errLmb_mt3.mat','errLmb_mt3')
    save('errFilm_mt3.mat','errFilm_mt3')
    save('filmRatio_mt3.mat','filmRatio_mt3')
    save('err_filmRatio_mt3.mat','err_filmRatio_mt3')
    save('lmbRatio_mt3.mat','lmbRatio_mt3')
    save('errLmbRatio_mt3.mat','errLmbRatio_mt3')
    
    save('film_mt4.mat','film_mt4')
    save('lmb_mt4.mat','lmb_mt4')
    save('errLmb_mt4.mat','errLmb_mt4')
    save('errFilm_mt4.mat','errFilm_mt4')
    save('filmRatio_mt4.mat','filmRatio_mt4')
    save('err_filmRatio_mt4.mat','err_filmRatio_mt4')
    save('lmbRatio_mt4.mat','lmbRatio_mt4')
    save('errLmbRatio_mt4.mat','errLmbRatio_mt4')
    
    save('film_mt5.mat','film_mt5')
    save('lmb_mt5.mat','lmb_mt5')
    save('errLmb_mt5.mat','errLmb_mt5')
    save('errFilm_mt5.mat','errFilm_mt5')
    save('filmRatio_mt5.mat','filmRatio_mt5')
    save('err_filmRatio_mt5.mat','err_filmRatio_mt5')
    save('lmbRatio_mt5.mat','lmbRatio_mt5')
    save('errLmbRatio_mt5.mat','errLmbRatio_mt5')
   
    save('film_mt6.mat','film_mt6')
    save('lmb_mt6.mat','lmb_mt6')
    save('errLmb_mt6.mat','errLmb_mt6')
    save('errFilm_mt6.mat','errFilm_mt6')
    save('filmRatio_mt6.mat','filmRatio_mt6')
    save('err_filmRatio_mt6.mat','err_filmRatio_mt6')
    save('lmbRatio_mt6.mat','lmbRatio_mt6')
    save('errLmbRatio_mt6.mat','errLmbRatio_mt6')
%}
    
%{
plot(h,lmb,'o-','LineWidth',2)
errorbar(film_mt1,lmb_mt1/1e3,errLmb_mt1,errLmb_mt1,errFilm_mt1,errFilm_mt1,tpData,'LineWidth',tpLw)
errorbar(film_mt2,lmb_mt2/1e3,errLmb_mt2,errLmb_mt2,errFilm_mt2,errFilm_mt2,tpData,'LineWidth',tpLw)
errorbar(film_mt3,lmb_mt3/1e3,errLmb_mt3,errLmb_mt3,errFilm_mt3,errFilm_mt3,tpData,'LineWidth',tpLw)
errorbar(film_mt4,lmb_mt4/1e3,errLmb_mt4,errLmb_mt4,errFilm_mt4,errFilm_mt4,tpData,'LineWidth',tpLw)
errorbar(film_mt5,lmb_mt5/1e3,errLmb_mt5,errLmb_mt5,errFilm_mt5,errFilm_mt5,tpData,'LineWidth',tpLw)
errorbar(film_mt6,lmb_mt6/1e3,errLmb_mt6,errLmb_mt6,errFilm_mt6,errFilm_mt6,tpData,'LineWidth',tpLw)
%errorbar(coatingData_mt6.film,lmb_mt6/1e3,errLmb_mt6,errLmb_mt6,errFilm_mt6,errFilm_mt6,'gs','LineWidth',tpLw)
%plot(coatingData_mt6.film,lmb_mt6/1e3,'bs');%,errLmb_mt6,errLmb_mt6,errFilm_mt6,errFilm_mt6,tpData,'LineWidth',tpLw)
%}

%{
plot(lmb,h,'o-')
errorbar(lmb_mt1,film_mt1,errFilm_mt1,'k+')
errorbar(lmb_mt2,film_mt2,errFilm_mt2,'k+')
errorbar(lmb_mt3,film_mt3,errFilm_mt3,'k+')
errorbar(lmb_mt4,film_mt4,errFilm_mt4,'+')
errorbar(lmb_mt5,film_mt5,errFilm_mt5,'+')
errorbar(lmb_mt6,film_mt6,errFilm_mt6,'+')
ylim([0 50])
xlim([0 500])
simplePlotFormat( '\lambda_{rp} (\mu m)', 'Film thickness (nm)', xafz, yafz, tvfz )
%}

%{
film_mt1 = mt1_tpx2-mt1_naked;
filmRatio_mt1 = (mt1_naked/2)/((mt1_tpx2-mt1_naked)+(mt1_naked/2));
err_filmRatio_mt1 = mtFilmRatioErrorProp(errMt1_tpx2,errMt1,mt1_tpx2,mt1_naked);

errFilm_mt1 = mtFilmErrorProp(errMt1,errMt1_tpx2);
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/spacing_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/spacing_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')

lmb_mt1 = spacing;
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/maxFrequencies_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/maxFrequencies_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')

stdErrLmb_mt1 = std(1./maxF_all)/sqrt(length(maxF_all))/1e3;

lmbRatio_mt1 = lmb_mt1/((mt1_tpx2-mt1_naked)+(mt1_naked/2));
[errLmbRatio_mt1] = mtLmb_a_RatioErrorProp(errMt1_tpx2,stdErrLmb_mt1,mt1_tpx2,lmb_mt1,mt1_naked);

clear spacing
clear maxF_all
%}

%{
film_mt5 = mt5_tpx2-mean([mt1_naked mt2_naked mt3_naked mt4_naked]);
mt5_naked = 25;
filmRatio_mt5 = (mt5_naked/2)/((mt5_tpx2-mt5_naked)+(mt5_naked/2));
err_filmRatio_mt5 = mtFilmRatioErrorProp(errMt5_tpx2,0,mt5_tpx2,mt5_naked);


% custom error propagation for naked MT height
errFilm_mt5 = sqrt(( sum([errMt5_tpx2.^2,...
    (1/4).^2*errMt1.^2,...
    (1/4).^2*errMt2.^2,...
    (1/4).^2*errMt3.^2,...
    (1/4).^2*errMt4.^2]) ));

%load('../data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-178-115_cy_mt-y-119-94/spacing_c_cx_mt-x-178-115_cy_mt-y-119-94.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117/spacing_c_cx_mt-x-114-179_cy_mt-y-92-117.mat')
lmb_mt5 = spacing;
%load('../data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-178-115_cy_mt-y-119-94/maxFrequencies_c_cx_mt-x-178-115_cy_mt-y-119-94.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117/maxFrequencies_c_cx_mt-x-114-179_cy_mt-y-92-117.mat')
errLmb_mt5 = std(1./maxF_all)/sqrt(length(maxF_all))/1e3;

lmbRatio_mt5 = lmb_mt5/((mt5_tpx2-mt5_naked)+(mt5_naked/2));
[errLmbRatio_mt5] = mtLmb_a_RatioErrorProp(errMt5_tpx2,errLmb_mt5,mt5_tpx2,lmb_mt5,mt5_naked);

clear spacing
clear maxF_all
%}

%{
film_mt6 = mean([film_mt4 film_mt5]);
mt6_naked = 25;
mt6_tpx2 = mean([mt4_tpx2 mt5_tpx2]);
filmRatio_mt6 = (mt6_naked/2)/((mt6_tpx2-mt6_naked)+(mt6_naked/2));

errFilm_mt6 = sqrt(( sum([(1/2).^2*errFilm_mt4.^2,...
    (1/2).^2*errFilm_mt5.^2]) ));

errMt6_tpx2 = sqrt(( sum([(1/2).^2*errMt4_tpx2.^2,...
    (1/2).^2*errMt5_tpx2.^2]) ));

err_filmRatio_mt6 = mtFilmRatioErrorProp(errMt6_tpx2,0,mt6_tpx2,mt6_naked);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132/spacing_c_cx_mt-x-219-209_cy_mt-y-3-132.mat')
%load('../data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-218-197_cy_mt-y-7-250/spacing_c_cx_mt-x-218-197_cy_mt-y-7-250.mat')
lmb_mt6 = spacing;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132/maxFrequencies_c_cx_mt-x-219-209_cy_mt-y-3-132.mat')
%load('../data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-218-197_cy_mt-y-7-250/maxFrequencies_c_cx_mt-x-218-197_cy_mt-y-7-250.mat')
errLmb_mt6 = std(1./maxF_all)/sqrt(length(maxF_all))/1e3;

lmbRatio_mt6 = lmb_mt6/((mt6_tpx2-mt6_naked)+(mt6_naked/2));
[errLmbRatio_mt6] = mtLmb_a_RatioErrorProp(errMt6_tpx2,errLmb_mt6,mt6_tpx2,lmb_mt6,mt6_naked);

clear spacing
clear maxF_all
%}
%%

%( (std(h1_naked*1e9).^2) + (std(h1_bg_naked*1e9).^2) );
% 
% mt2_naked=(mean(h2_naked)-mean(h2_bg_naked))*1e9;
% errMt2 = ( (std(h2_naked*1e9).^2) + (std(h2_bg_naked*1e9).^2) );
% 
% mt3_naked=(mean(h3_naked)-mean(h3_bg_naked))*1e9;
% errMt3 = ( (std(h3_naked*1e9).^2) + (std(h3_bg_naked*1e9).^2) );


%% DEPRECATED

%{
x1 = mt100231.x;
h1 = mt100231.y;
h1(isnan(h1))=[];

x1_bg = mt100231.x1;
h1_bg = mt100231.y1;
h1_bg(isnan(h1_bg))=[];

x2 = mt200231.x;
h2 = mt200231.y;
h2(isnan(h2)) = [];

x2_bg = mt200231.x1;
h2_bg = mt200231.y1;
h2_bg(isnan(h2_bg)) = [];

x3 = mt300231.x;
h3 = mt300231.y;
h3(isnan(h3)) = [];

x3_bg = mt300231.x1;
h3_bg = mt300231.y1;
h3_bg(isnan(h3_bg)) = [];

% x4 = mt100025.x;
% h4 = mt100025.y;
% h4(isnan(h4)) = [];
% 
% x4_bg = mt100025.x1;
% h4_bg = mt100025.y1;
% h4_bg(isnan(h4_bg)) = [];
% 
% x5 = mt100070.x;
% h5 = mt100070.y;
% h5(isnan(h5)) = [];
% 
% x5_bg = mt100070.x1;
% h5_bg = mt100070.y1;
% h5_bg(isnan(h5_bg)) = [];
% 
% x3_after = mt300261.Profile1;
% h3_after = mt300261.VarName2;
% figure; plot(x3_after*1e6,h3_after*1e9)
% simplePlotFormat('Distance along MT (um)','Height (nm), t=4min',10,10,10)


%% after 2hr10min
x1_tpx2_2hr10min = mt12300261.x;
h1_tpx2_2hr10min = mt12300261.y;
%h1_tpx2_2hr10min(isnan(h1_tpx2_2hr10min))=[];
 
x1_bg_tpx2_2hr10min = mt12300261.x1;
h1_bg_tpx2_2hr10min = mt12300261.y1;
%h1_bg_tpx2_2hr10min(isnan(h1_bg_tpx2_2hr10min))=[];
 
x2_tpx2_2hr10min = mt12300261.x2;
h2_tpx2_2hr10min = mt12300261.y2;
%h2_tpx2_2hr10min(isnan(h2_tpx2_2hr10min))=[];
 
x2_bg_tpx2_2hr10min = mt12300261.x3;
h2_bg_tpx2_2hr10min = mt12300261.y3;
%h2_bg_tpx2_2hr10min(isnan(h2_bg_tpx2_2hr10min))=[];
 
x3_tpx2_2hr10min = mt12300261.x4;
h3_tpx2_2hr10min = mt12300261.y4;
%h3_tpx2_2hr10min(isnan(h3_tpx2_2hr10min))=[];
 
x3_bg_tpx2_2hr10min = mt12300261.x5;
h3_bg_tpx2_2hr10min = mt12300261.y5;
%h3_bg_tpx2_2hr10min(isnan(h3_bg_tpx2_2hr10min))=[];

figure; plot(x3_tpx2_2hr10min*1e6,smooth(h3_tpx2_2hr10min*1e9))
simplePlotFormat('Distance along MT (um)','Height (nm)',10,10,10)

figure; plot(x2_tpx2_2hr10min*1e6,h2_tpx2_2hr10min*1e9)
simplePlotFormat('Distance along MT (um)','Height (nm)',10,10,10)

figure; plot(x1_tpx2_2hr10min*1e6,h1_tpx2_2hr10min*1e9)
simplePlotFormat('Distance along MT (um)','Height (nm)',10,10,10)

mt1_tpx2_2hr10min=(mean(h1_tpx2_2hr10min)-mean(h1_bg_tpx2_2hr10min))*1e9;
errMt1 = ( (std(h1_tpx2_2hr10min*1e9).^2) + (std(h1_bg_tpx2_2hr10min*1e9).^2) );
 
mt2_tpx2_2hr10min=(mean(h2_tpx2_2hr10min)-mean(h2_bg_tpx2_2hr10min))*1e9;
errMt2 = ( (std(h2_tpx2_2hr10min*1e9).^2) + (std(h2_bg_tpx2_2hr10min*1e9).^2) );
 
mt3_tpx2_2hr10min=(mean(h3_tpx2_2hr10min)-mean(h3_bg_tpx2_2hr10min))*1e9;
errMt3 = ( (std(h3_tpx2_2hr10min*1e9).^2) + (std(h3_bg_tpx2_2hr10min*1e9).^2) );


%%
mt1_tpx2=(mean(h1)-mean(h1_bg))*1e9-25
errMt1 = mtHeightErrorProp(h1,h1_bg)

mt2_tpx2=(mean(h2)-mean(h2_bg))*1e9-25
errMt2 = mtHeightErrorProp(h2,h2_bg)

mt3_tpx2=(mean(h3)-mean(h3_bg))*1e9-25
errMt3 = mtHeightErrorProp(h3,h3_bg)

mt4_tpx2=(mean(h4)-mean(h4_bg))*1e9-25
errMt4 = mtHeightErrorProp(h4,h4_bg)

mt5_tpx2=(mean(h5)-mean(h5_bg))*1e9-25
errMt5 = mtHeightErrorProp(h5,h5_bg)
%}




