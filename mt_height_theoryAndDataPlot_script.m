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
% [saveDir]=fileparts(filename);
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


saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261';

% save outputData to mat file
% save([saveDir,'/coatingData_mt1.mat'],'coatingData_mt1')
% save([saveDirMain,'/coatingData_mt1.mat'],'coatingData_mt1')
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

%% mt7, 4x

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
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine';

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

selectCutOff = 0;
if selectCutOff == 0
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgn_mt10.mat')
    inputData_mt22.yibgn = 1000;
    clear yibgn
    
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgtp_mt10.mat')
    inputData_mt22.yibgtp = 1000;
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
 
selectCutOff = 0;
if selectCutOff == 0
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgn_mt10.mat')
    inputData_mt23.yibgn = 1000;
    clear yibgn
    
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgtp_mt10.mat')
    inputData_mt23.yibgtp = 1000;
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
 

%% mt 24, 2019 10 28, expt 2, fr 68-72, bottom right mt
 
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
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-164-249_cy_mt-y-113-228/spacing_c_cx_mt-x-164-249_cy_mt-y-113-228.mat')
lmb_mt24 = spacing;
inputData_mt24.lmb = lmb_mt24;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-164-249_cy_mt-y-113-228/maxFrequencies_c_cx_mt-x-164-249_cy_mt-y-113-228.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-164-249_cy_mt-y-113-228/indsForAverage_c_cx_mt-x-164-249_cy_mt-y-113-228.mat')

inputData_mt24.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody';
 
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


%% mt 25, 2019 10 28, expt 2, fr 63-67
 
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


%% mt 26, 2019 10 28, expt 2, fr 63-67
 
% load data from table
h26_naked = [...
    expt2_20191028_mtNaked_table.y;...
    expt2_20191028_mtNaked_table.y2;...
    expt2_20191028_mtNaked_table.y4;...
    expt2_20191028_mtNaked_table.y6;...
    expt2_20191028_mtNaked_table.y8;...
    expt2_20191028_mtNaked_table.y10;...
    ];
 
h26_bg_naked = [...
    expt2_20191028_mtNaked_table.y1;...
    expt2_20191028_mtNaked_table.y3;...
    expt2_20191028_mtNaked_table.y5;...
    expt2_20191028_mtNaked_table.y7;...
    expt2_20191028_mtNaked_table.y9;...
    expt2_20191028_mtNaked_table.y11;...
    ];
    
% load input data for tpx2 coated mt
h26_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y;...
    expt2_20191028_mt_half_x_tpx2fl_table.y2;...
    expt2_20191028_mt_half_x_tpx2fl_table.y4;...
    expt2_20191028_mt_half_x_tpx2fl_table.y6;...
    expt2_20191028_mt_half_x_tpx2fl_table.y8;...
    ];
    
h26_bg_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y1;...
    expt2_20191028_mt_half_x_tpx2fl_table.y3;...
    expt2_20191028_mt_half_x_tpx2fl_table.y5;...
    expt2_20191028_mt_half_x_tpx2fl_table.y7;...
    expt2_20191028_mt_half_x_tpx2fl_table.y9;...
    ];
% load input data for naked mt
inputData_mt26.h_naked = h26_naked;
inputData_mt26.h_bg_naked = h26_bg_naked;
 
 
inputData_mt26.h_tpx2 = h26_tpx2;
inputData_mt26.h_bg_tpx2 = h26_bg_tpx2;
 
% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt26.yibgn = 1;
    
    inputData_mt26.yibgtp = 1;
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-195-243_cy_mt-y-177-247/spacing_c_cx_mt-x-195-243_cy_mt-y-177-247.mat')
lmb_mt26 = spacing;
inputData_mt26.lmb = lmb_mt26;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-195-243_cy_mt-y-177-247/maxFrequencies_c_cx_mt-x-195-243_cy_mt-y-177-247.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-195-243_cy_mt-y-177-247/indsForAverage_c_cx_mt-x-195-243_cy_mt-y-177-247.mat')
 
inputData_mt26.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt26] = fxn_mtFilmAndRatioCalc(inputData_mt26,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt26.yibgn;
    yibgtp = coatingData_mt26.yibgtp;
    
    save([saveDir,'/yibgn_mt26.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt26.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt26.mat'],'coatingData_mt26')
save([saveDirMain,'/coatingData_mt26.mat'],'coatingData_mt26')
 

%% mt 27, 2019 10 28, expt 2, fr 68-72, top right mt
 
% load data from table
h27_naked = [...
    expt2_20191028_mtNaked_table.y;...
    expt2_20191028_mtNaked_table.y2;...
    expt2_20191028_mtNaked_table.y4;...
    expt2_20191028_mtNaked_table.y6;...
    expt2_20191028_mtNaked_table.y8;...
    expt2_20191028_mtNaked_table.y10;...
    ];
 
h27_bg_naked = [...
    expt2_20191028_mtNaked_table.y1;...
    expt2_20191028_mtNaked_table.y3;...
    expt2_20191028_mtNaked_table.y5;...
    expt2_20191028_mtNaked_table.y7;...
    expt2_20191028_mtNaked_table.y9;...
    expt2_20191028_mtNaked_table.y11;...
    ];
    
% load input data for tpx2 coated mt
h27_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y;...
    expt2_20191028_mt_half_x_tpx2fl_table.y2;...
    expt2_20191028_mt_half_x_tpx2fl_table.y4;...
    expt2_20191028_mt_half_x_tpx2fl_table.y6;...
    expt2_20191028_mt_half_x_tpx2fl_table.y8;...
    ];
    
h27_bg_tpx2 = [...
    expt22bg1MtTpx2Coatedframe4120191028.y1;...
    expt2_20191028_mt_half_x_tpx2fl_table.y3;...
    expt2_20191028_mt_half_x_tpx2fl_table.y5;...
    expt2_20191028_mt_half_x_tpx2fl_table.y7;...
    expt2_20191028_mt_half_x_tpx2fl_table.y9;...
    ];
% load input data for naked mt
inputData_mt27.h_naked = h27_naked;
inputData_mt27.h_bg_naked = h27_bg_naked;
 
 
inputData_mt27.h_tpx2 = h27_tpx2;
inputData_mt27.h_bg_tpx2 = h27_bg_tpx2;
 
% set dummy cutoff values
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt27.yibgn = 1;
    
    inputData_mt27.yibgtp = 1;
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-173-253_cy_mt-y-16-57/spacing_c_cx_mt-x-173-253_cy_mt-y-16-57.mat')
lmb_mt27 = spacing;
inputData_mt27.lmb = lmb_mt27;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-173-253_cy_mt-y-16-57/maxFrequencies_c_cx_mt-x-173-253_cy_mt-y-16-57.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-173-253_cy_mt-y-16-57/indsForAverage_c_cx_mt-x-173-253_cy_mt-y-16-57.mat')

inputData_mt27.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt27] = fxn_mtFilmAndRatioCalc(inputData_mt27,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt27.yibgn;
    yibgtp = coatingData_mt27.yibgtp;
    
    save([saveDir,'/yibgn_mt27.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt27.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt27.mat'],'coatingData_mt27')
save([saveDirMain,'/coatingData_mt27.mat'],'coatingData_mt27')
 

%% expt 4, 2019 10 31, 4x tpx2 conc

% load naked mt data
run([runDir,'/loadMtHeightData_20191031_expt4_mtnaked.m']);

% load TPX2 coated MT data
run([runDir,'/loadMtHeightData_20191031_expt4_tpx2MtCoated.m']);
run([runDir,'/loadMtHeightData_20191031_expt4_tpx2MtCoated_aboveMT.m']);

expt4_20191031_4x_coated = expt42bg1mtTpx2Coatedframe25620191031.y;
expt4_20191031_4x_coated_bg = expt42bg1mtTpx2Coatedframe25620191031.y1;

expt4_20191031_4x_coated_mtTop = expt42bg1mtTpx2CoatedAboveMtframe25620191031.y;
expt4_20191031_4x_coated_mtTop_bg = expt42bg1mtTpx2CoatedAboveMtframe25620191031.y1;

expt4_20191031_4x_coated_mtTop(expt4_20191031_4x_coated_mtTop<0)=[];
expt4_20191031_4x_coated_mtTop_bg(expt4_20191031_4x_coated_mtTop_bg<0)=[];
%% mt 28, 2019 10 31, expt 4, 4x tpx2, 275-278, top right MT, straight part
 
% load data from table
h28_naked = expt42bg1mtNakedframe25420191031.y;
h28_bg_naked = expt42bg1mtNakedframe25420191031.y1;
 
% load input data for tpx2 coated mt
h28_tpx2 = [expt4_20191031_4x_coated;...
    expt4_20191031_4x_coated_mtTop;...
    ];

h28_bg_tpx2 = [expt4_20191031_4x_coated_bg;...
    expt4_20191031_4x_coated_mtTop_bg;...
    ];
 
% load input data for naked mt
inputData_mt28.h_naked = h28_naked;
inputData_mt28.h_bg_naked = h28_bg_naked;
 
 
inputData_mt28.h_tpx2 = h28_tpx2;
inputData_mt28.h_bg_tpx2 = h28_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgn_mt10.mat')
    inputData_mt28.yibgn = 1000;
    clear yibgn
    
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/yibgtp_mt10.mat')
    inputData_mt28.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-171-315_cy_mt-y-493-406/spacing_c_cx_mt-x-171-315_cy_mt-y-493-406.mat')

lmb_mt28 = spacing;
inputData_mt28.lmb = lmb_mt28;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-171-315_cy_mt-y-493-406/maxFrequencies_c_cx_mt-x-171-315_cy_mt-y-493-406.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-171-315_cy_mt-y-493-406/indsForAverage_c_cx_mt-x-171-315_cy_mt-y-493-406.mat')


inputData_mt28.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine';
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt28] = fxn_mtFilmAndRatioCalc(inputData_mt28,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt28.yibgn;
    yibgtp = coatingData_mt28.yibgtp;
    
    save([saveDir,'/yibgn_mt28.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt28.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt28.mat'],'coatingData_mt28')
save([saveDirMain,'/coatingData_mt28.mat'],'coatingData_mt28')

%% mt 29, 2019 10 31, expt 4, 4x tpx2, 275-278
 
% load data from table
h29_naked = expt42bg1mtNakedframe25420191031.y;
h29_bg_naked = expt42bg1mtNakedframe25420191031.y1;
 
% load input data for tpx2 coated mt
h29_tpx2 = [expt4_20191031_4x_coated;...
    expt4_20191031_4x_coated_mtTop;...
    ];

h29_bg_tpx2 = [expt4_20191031_4x_coated_bg;...
    expt4_20191031_4x_coated_mtTop_bg;...
    ];

% load input data for naked mt
inputData_mt29.h_naked = h29_naked;
inputData_mt29.h_bg_naked = h29_bg_naked;
 
 
inputData_mt29.h_tpx2 = h29_tpx2;
inputData_mt29.h_bg_tpx2 = h29_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 29 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191029_stackReg_rigidBody/yibgn_mt10.mat')
    inputData_mt29.yibgn = 1000;
    clear yibgn
    
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 29 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191029_stackReg_rigidBody/yibgtp_mt10.mat')
    inputData_mt29.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-229-355_cy_mt-y-281-362/spacing_c_cx_mt-x-229-355_cy_mt-y-281-362.mat')
lmb_mt29 = spacing;
inputData_mt29.lmb = lmb_mt29;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-229-355_cy_mt-y-281-362/indsForAverage_c_cx_mt-x-229-355_cy_mt-y-281-362.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-229-355_cy_mt-y-281-362/maxFrequencies_c_cx_mt-x-229-355_cy_mt-y-281-362.mat')
inputData_mt29.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine';
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt29] = fxn_mtFilmAndRatioCalc(inputData_mt29,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt29.yibgn;
    yibgtp = coatingData_mt29.yibgtp;
    
    save([saveDir,'/yibgn_mt29.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt29.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt29.mat'],'coatingData_mt29')
save([saveDirMain,'/coatingData_mt29.mat'],'coatingData_mt29')
 
 
%% mt 30, 2019 10 31, expt 4, 4x tpx2, 275-278
 
% load data from table
h30_naked = expt42bg1mtNakedframe25420191031.y;
h30_bg_naked = expt42bg1mtNakedframe25420191031.y1;
 
% load input data for tpx2 coated mt
h30_tpx2 = [expt4_20191031_4x_coated;...
    expt4_20191031_4x_coated_mtTop;...
    ];

h30_bg_tpx2 = [expt4_20191031_4x_coated_bg;...
    expt4_20191031_4x_coated_mtTop_bg;...
    ];

% load input data for naked mt
inputData_mt30.h_naked = h30_naked;
inputData_mt30.h_bg_naked = h30_bg_naked;
 
 
inputData_mt30.h_tpx2 = h30_tpx2;
inputData_mt30.h_bg_tpx2 = h30_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 30 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191030_stackReg_rigidBody/yibgn_mt10.mat')
    inputData_mt30.yibgn = 1000;
    clear yibgn
    
%     load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 30 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191030_stackReg_rigidBody/yibgtp_mt10.mat')
    inputData_mt30.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-3-99_cy_mt-y-32-4/spacing_c_cx_mt-x-3-99_cy_mt-y-32-4.mat')
lmb_mt30 = spacing;
inputData_mt30.lmb = lmb_mt30;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-3-99_cy_mt-y-32-4/maxFrequencies_c_cx_mt-x-3-99_cy_mt-y-32-4.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-3-99_cy_mt-y-32-4/indsForAverage_c_cx_mt-x-3-99_cy_mt-y-32-4.mat')
inputData_mt30.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine';
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt30] = fxn_mtFilmAndRatioCalc(inputData_mt30,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt30.yibgn;
    yibgtp = coatingData_mt30.yibgtp;
    
    save([saveDir,'/yibgn_mt30.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt30.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt30.mat'],'coatingData_mt30')
save([saveDirMain,'/coatingData_mt30.mat'],'coatingData_mt30')
 
 
%% mt 31, 2019 10 31, expt 4, 4x tpx2, 275-278
 
% load data from table
h31_naked = expt42bg1mtNakedframe25420191031.y;
h31_bg_naked = expt42bg1mtNakedframe25420191031.y1;
 
% load input data for tpx2 coated mt
h31_tpx2 = [expt4_20191031_4x_coated;...
    expt4_20191031_4x_coated_mtTop;...
    ];

h31_bg_tpx2 = [expt4_20191031_4x_coated_bg;...
    expt4_20191031_4x_coated_mtTop_bg;...
    ];

% load input data for naked mt
inputData_mt31.h_naked = h31_naked;
inputData_mt31.h_bg_naked = h31_bg_naked;
 
 
inputData_mt31.h_tpx2 = h31_tpx2;
inputData_mt31.h_bg_tpx2 = h31_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt31.yibgn = 1000;
    clear yibgn
    
    inputData_mt31.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-208-374_cy_mt-y-246-12/spacing_c_cx_mt-x-208-374_cy_mt-y-246-12.mat')
lmb_mt31 = spacing;
inputData_mt31.lmb = lmb_mt31;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-208-374_cy_mt-y-246-12/maxFrequencies_c_cx_mt-x-208-374_cy_mt-y-246-12.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-208-374_cy_mt-y-246-12/indsForAverage_c_cx_mt-x-208-374_cy_mt-y-246-12.mat')
inputData_mt31.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine';
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt31] = fxn_mtFilmAndRatioCalc(inputData_mt31,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt31.yibgn;
    yibgtp = coatingData_mt31.yibgtp;
    
    save([saveDir,'/yibgn_mt31.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt31.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt31.mat'],'coatingData_mt31')
save([saveDirMain,'/coatingData_mt31.mat'],'coatingData_mt31')


%% mt 32, 2019 10 31, expt 4, 4x tpx2, 254-27
 
% load data from table
h32_naked = expt42bg1mtNakedframe25420191031.y;
h32_bg_naked = expt42bg1mtNakedframe25420191031.y1;
 
% load input data for tpx2 coated mt
h32_tpx2 = expt4_20191031_4x_coated;
h32_bg_tpx2 = expt4_20191031_4x_coated_bg;
 
% load input data for naked mt
inputData_mt32.h_naked = h32_naked;
inputData_mt32.h_bg_naked = h32_bg_naked;
 

inputData_mt32.h_tpx2 = h32_tpx2;
inputData_mt32.h_bg_tpx2 = h32_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt32.yibgn = 1000;
    clear yibgn
    
    inputData_mt32.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/spacing_c_cx_mt-x-113-215_cy_mt-y-108-41.mat')
lmb_mt32 = spacing;
inputData_mt32.lmb = lmb_mt32;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/maxFrequencies_c_cx_mt-x-113-215_cy_mt-y-108-41.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/indsForAverage_c_cx_mt-x-113-215_cy_mt-y-108-41.mat')
inputData_mt32.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine';
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt32] = fxn_mtFilmAndRatioCalc(inputData_mt32,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt32.yibgn;
    yibgtp = coatingData_mt32.yibgtp;
    
    save([saveDir,'/yibgn_mt32.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt32.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt32.mat'],'coatingData_mt32')
save([saveDirMain,'/coatingData_mt32.mat'],'coatingData_mt32')
 
 
%% mt 33, 2019 10 31, expt 4, 4x tpx2, 275-278
% THIS IS NOT PLOTTED BECAUSE IT IS A DUPLICATE
 
% load data from table
h33_naked = expt42bg1mtNakedframe25420191031.y;
h33_bg_naked = expt42bg1mtNakedframe25420191031.y1;
 
% load input data for tpx2 coated mt
h33_tpx2 = expt4_20191031_4x_coated_mtTop;
h33_bg_tpx2 = expt4_20191031_4x_coated_mtTop_bg;
 
% load input data for naked mt
inputData_mt33.h_naked = h33_naked;
inputData_mt33.h_bg_naked = h33_bg_naked;
 
 
inputData_mt33.h_tpx2 = h33_tpx2;
inputData_mt33.h_bg_tpx2 = h33_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt33.yibgn = 1000;
    clear yibgn
    
    inputData_mt33.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-275-371_cy_mt-y-148-16/spacing_c_cx_mt-x-275-371_cy_mt-y-148-16.mat')
lmb_mt33 = spacing;
inputData_mt33.lmb = lmb_mt33;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-275-371_cy_mt-y-148-16/maxFrequencies_c_cx_mt-x-275-371_cy_mt-y-148-16.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-275-371_cy_mt-y-148-16/indsForAverage_c_cx_mt-x-275-371_cy_mt-y-148-16.mat')
inputData_mt33.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine';
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt33] = fxn_mtFilmAndRatioCalc(inputData_mt33,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt33.yibgn;
    yibgtp = coatingData_mt33.yibgtp;
    
    save([saveDir,'/yibgn_mt33.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt33.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt33.mat'],'coatingData_mt33')
save([saveDirMain,'/coatingData_mt33.mat'],'coatingData_mt33')

 
%% 2019 10 31, expt 1, 1x tpx2

%load mt naked
run([runDir,'loadMtHeightData_20191031_expt1_mtNaked.m'])

run([runDir,'loadMtHeightData_20191031_expt1_mt1xTpx2.m'])



%% mt 34, 2019 10 31, expt1, mt across, 1x tpx2

% load data from table
h34_naked = [expt12468bg1357mtNakedframe16220191031.y;...
    expt12468bg1357mtNakedframe16220191031.y6];

h34_bg_naked = [expt12468bg1357mtNakedframe16220191031.y1;...
    expt12468bg1357mtNakedframe16220191031.y7];
 
% load input data for tpx2 coated mt
h34_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y6];

h34_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y1;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y7];

 
% load input data for naked mt
inputData_mt34.h_naked = h34_naked;
inputData_mt34.h_bg_naked = h34_bg_naked;
 
 
inputData_mt34.h_tpx2 = h34_tpx2;
inputData_mt34.h_bg_tpx2 = h34_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt34.yibgn = 1000;
    clear yibgn
    
    inputData_mt34.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123/spacing_c_cx_mt-x-14-253_cy_mt-y-143-123.mat')
lmb_mt34 = spacing;
inputData_mt34.lmb = lmb_mt34;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123/maxFrequencies_c_cx_mt-x-14-253_cy_mt-y-143-123.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123/indsForAverage_c_cx_mt-x-14-253_cy_mt-y-143-123.mat')
inputData_mt34.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine';

% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt34] = fxn_mtFilmAndRatioCalc(inputData_mt34,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt34.yibgn;
    yibgtp = coatingData_mt34.yibgtp;
    
    save([saveDir,'/yibgn_mt34.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt34.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt34.mat'],'coatingData_mt34')
save([saveDirMain,'/coatingData_mt34.mat'],'coatingData_mt34')
 

%% mt 35, 2019 10 31, expt1, mt across bottom, 1x tpx2
 
% load data from table
h35_naked = [expt12468bg1357mtNakedframe16220191031.y2];
 
h35_bg_naked = [expt12468bg1357mtNakedframe16220191031.y3];
 
% load input data for tpx2 coated mt
h35_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y2];
 
h35_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y3];
 
 
% load input data for naked mt
inputData_mt35.h_naked = h35_naked;
inputData_mt35.h_bg_naked = h35_bg_naked;
 
 
inputData_mt35.h_tpx2 = h35_tpx2;
inputData_mt35.h_bg_tpx2 = h35_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt35.yibgn = 1000;
    clear yibgn
    
    inputData_mt35.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192/spacing_c_cx_mt-x-106-232_cy_mt-y-161-192.mat')
lmb_mt35 = spacing;
inputData_mt35.lmb = lmb_mt35;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192/maxFrequencies_c_cx_mt-x-106-232_cy_mt-y-161-192.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192/indsForAverage_c_cx_mt-x-106-232_cy_mt-y-161-192.mat')
inputData_mt35.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt35] = fxn_mtFilmAndRatioCalc(inputData_mt35,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt35.yibgn;
    yibgtp = coatingData_mt35.yibgtp;
    
    save([saveDir,'/yibgn_mt35.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt35.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt35.mat'],'coatingData_mt35')
save([saveDirMain,'/coatingData_mt35.mat'],'coatingData_mt35')
 
 
%% mt 36, 2019 10 31, expt1, mt top middle, 1x tpx2
 
% load data from table
h36_naked = [expt12468bg1357mtNakedframe16220191031.y4];
 
h36_bg_naked = [expt12468bg1357mtNakedframe16220191031.y5];
 
% load input data for tpx2 coated mt
h36_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y4];
 
h36_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y5];
 
 
% load input data for naked mt
inputData_mt36.h_naked = h36_naked;
inputData_mt36.h_bg_naked = h36_bg_naked;
 
 
inputData_mt36.h_tpx2 = h36_tpx2;
inputData_mt36.h_bg_tpx2 = h36_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt36.yibgn = 1000;
    clear yibgn
    
    inputData_mt36.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120/spacing_c_cx_mt-x-113-128_cy_mt-y-7-120.mat')
lmb_mt36 = spacing;
inputData_mt36.lmb = lmb_mt36;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120/maxFrequencies_c_cx_mt-x-113-128_cy_mt-y-7-120.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120/indsForAverage_c_cx_mt-x-113-128_cy_mt-y-7-120.mat')
inputData_mt36.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine';

 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt36] = fxn_mtFilmAndRatioCalc(inputData_mt36,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt36.yibgn;
    yibgtp = coatingData_mt36.yibgtp;
    
    save([saveDir,'/yibgn_mt36.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt36.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt36.mat'],'coatingData_mt36')
save([saveDirMain,'/coatingData_mt36.mat'],'coatingData_mt36')
 
 
%% mt 37, 2019 10 31, expt1

% load data from table
h37_naked = [expt12468bg1357mtNakedframe16220191031.y;...
    expt12468bg1357mtNakedframe16220191031.y2;...
    expt12468bg1357mtNakedframe16220191031.y4;...
    expt12468bg1357mtNakedframe16220191031.y6];
 
h37_bg_naked = [expt12468bg1357mtNakedframe16220191031.y1;...
    expt12468bg1357mtNakedframe16220191031.y3;...
    expt12468bg1357mtNakedframe16220191031.y5;...
    expt12468bg1357mtNakedframe16220191031.y7];
 
% load input data for tpx2 coated mt
h37_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y2;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y4;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y6];
 
h37_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y1;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y3;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y5;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y7];
 
 
% load input data for naked mt
inputData_mt37.h_naked = h37_naked;
inputData_mt37.h_bg_naked = h37_bg_naked;
 
 
inputData_mt37.h_tpx2 = h37_tpx2;
inputData_mt37.h_bg_tpx2 = h37_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt37.yibgn = 1000;
    clear yibgn
    
    inputData_mt37.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-67-150_cy_mt-y-168-138/spacing_c_cx_mt-x-67-150_cy_mt-y-168-138.mat')
lmb_mt37 = spacing;
inputData_mt37.lmb = lmb_mt37;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-67-150_cy_mt-y-168-138/maxFrequencies_c_cx_mt-x-67-150_cy_mt-y-168-138.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-67-150_cy_mt-y-168-138/indsForAverage_c_cx_mt-x-67-150_cy_mt-y-168-138.mat')
inputData_mt37.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt37] = fxn_mtFilmAndRatioCalc(inputData_mt37,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt37.yibgn;
    yibgtp = coatingData_mt37.yibgtp;
    
    save([saveDir,'/yibgn_mt37.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt37.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt37.mat'],'coatingData_mt37')
save([saveDirMain,'/coatingData_mt37.mat'],'coatingData_mt37')
 

%% mt 38, 2019 10 31, expt1
 
% load data from table
h38_naked = [expt12468bg1357mtNakedframe16220191031.y;...
    expt12468bg1357mtNakedframe16220191031.y2;...
    expt12468bg1357mtNakedframe16220191031.y4;...
    expt12468bg1357mtNakedframe16220191031.y6];
 
h38_bg_naked = [expt12468bg1357mtNakedframe16220191031.y1;...
    expt12468bg1357mtNakedframe16220191031.y3;...
    expt12468bg1357mtNakedframe16220191031.y5;...
    expt12468bg1357mtNakedframe16220191031.y7];
 
% load input data for tpx2 coated mt
h38_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y2;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y4;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y6];
 
h38_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y1;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y3;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y5;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y7];
 
 
% load input data for naked mt
inputData_mt38.h_naked = h38_naked;
inputData_mt38.h_bg_naked = h38_bg_naked;
 
 
inputData_mt38.h_tpx2 = h38_tpx2;
inputData_mt38.h_bg_tpx2 = h38_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt38.yibgn = 1000;
    clear yibgn
    
    inputData_mt38.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-211-247_cy_mt-y-126-63/spacing_c_cx_mt-x-211-247_cy_mt-y-126-63.mat')
lmb_mt38 = spacing;
inputData_mt38.lmb = lmb_mt38;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-211-247_cy_mt-y-126-63/maxFrequencies_c_cx_mt-x-211-247_cy_mt-y-126-63.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-211-247_cy_mt-y-126-63/indsForAverage_c_cx_mt-x-211-247_cy_mt-y-126-63.mat')
inputData_mt38.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt38] = fxn_mtFilmAndRatioCalc(inputData_mt38,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt38.yibgn;
    yibgtp = coatingData_mt38.yibgtp;
    
    save([saveDir,'/yibgn_mt38.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt38.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt38.mat'],'coatingData_mt38')
save([saveDirMain,'/coatingData_mt38.mat'],'coatingData_mt38')
 
 
 %% mt 39, 2019 10 31, expt1
 
% load data from table
h39_naked = [expt12468bg1357mtNakedframe16220191031.y;...
    expt12468bg1357mtNakedframe16220191031.y2;...
    expt12468bg1357mtNakedframe16220191031.y4;...
    expt12468bg1357mtNakedframe16220191031.y6];
 
h39_bg_naked = [expt12468bg1357mtNakedframe16220191031.y1;...
    expt12468bg1357mtNakedframe16220191031.y3;...
    expt12468bg1357mtNakedframe16220191031.y5;...
    expt12468bg1357mtNakedframe16220191031.y7];
 
% load input data for tpx2 coated mt
h39_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y2;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y4;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y6];
 
h39_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y1;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y3;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y5;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y7];
 
 
% load input data for naked mt
inputData_mt39.h_naked = h39_naked;
inputData_mt39.h_bg_naked = h39_bg_naked;
 
 
inputData_mt39.h_tpx2 = h39_tpx2;
inputData_mt39.h_bg_tpx2 = h39_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt39.yibgn = 1000;
    clear yibgn
    
    inputData_mt39.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-41-117_cy_mt-y-162-123/spacing_c_cx_mt-x-41-117_cy_mt-y-162-123.mat')
lmb_mt39 = spacing;
inputData_mt39.lmb = lmb_mt39;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-41-117_cy_mt-y-162-123/maxFrequencies_c_cx_mt-x-41-117_cy_mt-y-162-123.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-41-117_cy_mt-y-162-123/indsForAverage_c_cx_mt-x-41-117_cy_mt-y-162-123.mat')
inputData_mt39.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt39] = fxn_mtFilmAndRatioCalc(inputData_mt39,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt39.yibgn;
    yibgtp = coatingData_mt39.yibgtp;
    
    save([saveDir,'/yibgn_mt39.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt39.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt39.mat'],'coatingData_mt39')
save([saveDirMain,'/coatingData_mt39.mat'],'coatingData_mt39')
 
 
%% mt 40, 2019 10 31, expt1
 
% load data from table
h40_naked = [expt12468bg1357mtNakedframe16220191031.y;...
    expt12468bg1357mtNakedframe16220191031.y2;...
    expt12468bg1357mtNakedframe16220191031.y4;...
    expt12468bg1357mtNakedframe16220191031.y6];
 
h40_bg_naked = [expt12468bg1357mtNakedframe16220191031.y1;...
    expt12468bg1357mtNakedframe16220191031.y3;...
    expt12468bg1357mtNakedframe16220191031.y5;...
    expt12468bg1357mtNakedframe16220191031.y7];
 
% load input data for tpx2 coated mt
h40_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y2;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y4;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y6];
 
h40_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y1;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y3;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y5;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y7];
 
 
% load input data for naked mt
inputData_mt40.h_naked = h40_naked;
inputData_mt40.h_bg_naked = h40_bg_naked;
 
 
inputData_mt40.h_tpx2 = h40_tpx2;
inputData_mt40.h_bg_tpx2 = h40_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt40.yibgn = 1000;
    clear yibgn
    
    inputData_mt40.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-4-149_cy_mt-y-75-121/spacing_c_cx_mt-x-4-149_cy_mt-y-75-121.mat')
lmb_mt40 = spacing;
inputData_mt40.lmb = lmb_mt40;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-4-149_cy_mt-y-75-121/maxFrequencies_c_cx_mt-x-4-149_cy_mt-y-75-121.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-4-149_cy_mt-y-75-121/indsForAverage_c_cx_mt-x-4-149_cy_mt-y-75-121.mat')
inputData_mt40.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt40] = fxn_mtFilmAndRatioCalc(inputData_mt40,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt40.yibgn;
    yibgtp = coatingData_mt40.yibgtp;
    
    save([saveDir,'/yibgn_mt40.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt40.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt40.mat'],'coatingData_mt40')
save([saveDirMain,'/coatingData_mt40.mat'],'coatingData_mt40')
 
 
%% mt 41, 2019 10 31, expt1
 
% load data from table
h41_naked = [expt12468bg1357mtNakedframe16220191031.y;...
    expt12468bg1357mtNakedframe16220191031.y2;...
    expt12468bg1357mtNakedframe16220191031.y4;...
    expt12468bg1357mtNakedframe16220191031.y6];
 
h41_bg_naked = [expt12468bg1357mtNakedframe16220191031.y1;...
    expt12468bg1357mtNakedframe16220191031.y3;...
    expt12468bg1357mtNakedframe16220191031.y5;...
    expt12468bg1357mtNakedframe16220191031.y7];
 
% load input data for tpx2 coated mt
h41_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y2;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y4;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y6];
 
h41_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y1;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y3;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y5;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y7];
 
 
% load input data for naked mt
inputData_mt41.h_naked = h41_naked;
inputData_mt41.h_bg_naked = h41_bg_naked;
 
 
inputData_mt41.h_tpx2 = h41_tpx2;
inputData_mt41.h_bg_tpx2 = h41_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt41.yibgn = 1000;
    clear yibgn
    
    inputData_mt41.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-3-110_cy_mt-y-174-128/spacing_c_cx_mt-x-3-110_cy_mt-y-174-128.mat')
lmb_mt41 = spacing;
inputData_mt41.lmb = lmb_mt41;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-3-110_cy_mt-y-174-128/maxFrequencies_c_cx_mt-x-3-110_cy_mt-y-174-128.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-3-110_cy_mt-y-174-128/indsForAverage_c_cx_mt-x-3-110_cy_mt-y-174-128.mat')
inputData_mt41.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt41] = fxn_mtFilmAndRatioCalc(inputData_mt41,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt41.yibgn;
    yibgtp = coatingData_mt41.yibgtp;
    
    save([saveDir,'/yibgn_mt41.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt41.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt41.mat'],'coatingData_mt41')
save([saveDirMain,'/coatingData_mt41.mat'],'coatingData_mt41')
 
 
%% mt 42, 2019 10 31, expt1
 
% load data from table
h42_naked = [expt12468bg1357mtNakedframe16220191031.y;...
    expt12468bg1357mtNakedframe16220191031.y2;...
    expt12468bg1357mtNakedframe16220191031.y4;...
    expt12468bg1357mtNakedframe16220191031.y6];
 
h42_bg_naked = [expt12468bg1357mtNakedframe16220191031.y1;...
    expt12468bg1357mtNakedframe16220191031.y3;...
    expt12468bg1357mtNakedframe16220191031.y5;...
    expt12468bg1357mtNakedframe16220191031.y7];
 
% load input data for tpx2 coated mt
h42_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y2;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y4;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y6];
 
h42_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y1;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y3;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y5;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y7];
 
 
% load input data for naked mt
inputData_mt42.h_naked = h42_naked;
inputData_mt42.h_bg_naked = h42_bg_naked;
 
 
inputData_mt42.h_tpx2 = h42_tpx2;
inputData_mt42.h_bg_tpx2 = h42_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt42.yibgn = 1000;
    clear yibgn
    
    inputData_mt42.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-229-204_cy_mt-y-132-251/spacing_c_cx_mt-x-229-204_cy_mt-y-132-251.mat')
lmb_mt42 = spacing;
inputData_mt42.lmb = lmb_mt42;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-229-204_cy_mt-y-132-251/maxFrequencies_c_cx_mt-x-229-204_cy_mt-y-132-251.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-229-204_cy_mt-y-132-251/indsForAverage_c_cx_mt-x-229-204_cy_mt-y-132-251.mat')
inputData_mt42.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt42] = fxn_mtFilmAndRatioCalc(inputData_mt42,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt42.yibgn;
    yibgtp = coatingData_mt42.yibgtp;
    
    save([saveDir,'/yibgn_mt42.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt42.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt42.mat'],'coatingData_mt42')
save([saveDirMain,'/coatingData_mt42.mat'],'coatingData_mt42')
 
 
 
%% mt 43, 2019 10 31, expt1
 
% load data from table
h43_naked = [expt12468bg1357mtNakedframe16220191031.y;...
    expt12468bg1357mtNakedframe16220191031.y2;...
    expt12468bg1357mtNakedframe16220191031.y4;...
    expt12468bg1357mtNakedframe16220191031.y6];
 
h43_bg_naked = [expt12468bg1357mtNakedframe16220191031.y1;...
    expt12468bg1357mtNakedframe16220191031.y3;...
    expt12468bg1357mtNakedframe16220191031.y5;...
    expt12468bg1357mtNakedframe16220191031.y7];
 
% load input data for tpx2 coated mt
h43_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y2;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y4;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y6];
 
h43_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y1;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y3;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y5;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y7];
 
 
% load input data for naked mt
inputData_mt43.h_naked = h43_naked;
inputData_mt43.h_bg_naked = h43_bg_naked;
 
 
inputData_mt43.h_tpx2 = h43_tpx2;
inputData_mt43.h_bg_tpx2 = h43_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt43.yibgn = 1000;
    clear yibgn
    
    inputData_mt43.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-165-167_cy_mt-y-148-253/spacing_c_cx_mt-x-165-167_cy_mt-y-148-253.mat')
lmb_mt43 = spacing;
inputData_mt43.lmb = lmb_mt43;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-165-167_cy_mt-y-148-253/maxFrequencies_c_cx_mt-x-165-167_cy_mt-y-148-253.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-165-167_cy_mt-y-148-253/indsForAverage_c_cx_mt-x-165-167_cy_mt-y-148-253.mat')
inputData_mt43.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt43] = fxn_mtFilmAndRatioCalc(inputData_mt43,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt43.yibgn;
    yibgtp = coatingData_mt43.yibgtp;
    
    save([saveDir,'/yibgn_mt43.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt43.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt43.mat'],'coatingData_mt43')
save([saveDirMain,'/coatingData_mt43.mat'],'coatingData_mt43')
 
 
%% mt 44, 2019 10 31, expt1
 
% load data from table
h44_naked = [expt12468bg1357mtNakedframe16220191031.y;...
    expt12468bg1357mtNakedframe16220191031.y2;...
    expt12468bg1357mtNakedframe16220191031.y4;...
    expt12468bg1357mtNakedframe16220191031.y6];
 
h44_bg_naked = [expt12468bg1357mtNakedframe16220191031.y1;...
    expt12468bg1357mtNakedframe16220191031.y3;...
    expt12468bg1357mtNakedframe16220191031.y5;...
    expt12468bg1357mtNakedframe16220191031.y7];
 
% load input data for tpx2 coated mt
h44_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y2;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y4;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y6];
 
h44_bg_tpx2 = [expt12468bg1357mtTpx2Coated1xframe16520191031.y1;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y3;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y5;...
    expt12468bg1357mtTpx2Coated1xframe16520191031.y7];
 
 
% load input data for naked mt
inputData_mt44.h_naked = h44_naked;
inputData_mt44.h_bg_naked = h44_bg_naked;
 
 
inputData_mt44.h_tpx2 = h44_tpx2;
inputData_mt44.h_bg_tpx2 = h44_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt44.yibgn = 1000;
    clear yibgn
    
    inputData_mt44.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-110-76_cy_mt-y-162-235/spacing_c_cx_mt-x-110-76_cy_mt-y-162-235.mat')
lmb_mt44 = spacing;
inputData_mt44.lmb = lmb_mt44;
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-110-76_cy_mt-y-162-235/maxFrequencies_c_cx_mt-x-110-76_cy_mt-y-162-235.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-110-76_cy_mt-y-162-235/indsForAverage_c_cx_mt-x-110-76_cy_mt-y-162-235.mat')
inputData_mt44.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt44] = fxn_mtFilmAndRatioCalc(inputData_mt44,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt44.yibgn;
    yibgtp = coatingData_mt44.yibgtp;
    
    save([saveDir,'/yibgn_mt44.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt44.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt44.mat'],'coatingData_mt44')
save([saveDirMain,'/coatingData_mt44.mat'],'coatingData_mt44')
 
 
%% 2019 10 25, 3x tpx2 conc (300nM-900nM)


% load naked mt data
run([runDir,'loadMtHeightData_20191025_expt3_mtnaked.m'])

% load 3x tpx2 coated mt data
run([runDir,'loadMtHeightData_20191025_expt3_mt3xTpx2Coated.m'])

mt_20191025_expt1_TPX2coated = mt13xTpx2Coated12bg3MtTpx2frame7720191025;
clear mt13xTpx2Coated12bg3MtTpx2frame7720191025

mt_20191025_expt1_uncoated = mt13xTpx2Coated2bg1MtTpx2frame75naked20191025;
clear mt13xTpx2Coated2bg1MtTpx2frame75naked20191025

%% mt 45, 2019 10 25, 3x tpx2 conc
 
% load data from table
h45_naked = [mt_20191025_expt1_uncoated.y];
 
h45_bg_naked = [mt_20191025_expt1_uncoated.y1];
 
% load input data for tpx2 coated mt
h45_tpx2 = [mt_20191025_expt1_TPX2coated.y2];
 
h45_bg_tpx2 = [mt_20191025_expt1_TPX2coated.y;...
    mt_20191025_expt1_TPX2coated.y1];
 
 
% load input data for naked mt
inputData_mt45.h_naked = h45_naked;
inputData_mt45.h_bg_naked = h45_bg_naked;
 
 
inputData_mt45.h_tpx2 = h45_tpx2;
inputData_mt45.h_bg_tpx2 = h45_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt45.yibgn = 1000;
    clear yibgn
    
    inputData_mt45.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71/spacing_c_cx_mt-x-27-237_cy_mt-y-244-71.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71/maxFrequencies_c_cx_mt-x-27-237_cy_mt-y-244-71.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71/indsForAverage_c_cx_mt-x-27-237_cy_mt-y-244-71.mat')
lmb_mt45 = spacing;
inputData_mt45.lmb = lmb_mt45;
inputData_mt45.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody';


% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt45] = fxn_mtFilmAndRatioCalc(inputData_mt45,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt45.yibgn;
    yibgtp = coatingData_mt45.yibgtp;
    
    save([saveDir,'/yibgn_mt45.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt45.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt45.mat'],'coatingData_mt45')
save([saveDirMain,'/coatingData_mt45.mat'],'coatingData_mt45')
 

%% mt 46, 2019 10 25, 3x tpx2 conc
 
% load data from table
h46_naked = [mt_20191025_expt1_uncoated.y];
 
h46_bg_naked = [mt_20191025_expt1_uncoated.y1];
 
% load input data for tpx2 coated mt
h46_tpx2 = [mt_20191025_expt1_TPX2coated.y2];
 
h46_bg_tpx2 = [mt_20191025_expt1_TPX2coated.y;...
    mt_20191025_expt1_TPX2coated.y1];
 
 
% load input data for naked mt
inputData_mt46.h_naked = h46_naked;
inputData_mt46.h_bg_naked = h46_bg_naked;
 
 
inputData_mt46.h_tpx2 = h46_tpx2;
inputData_mt46.h_bg_tpx2 = h46_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt46.yibgn = 1000;
    clear yibgn
    
    inputData_mt46.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_114-116_affine/c_cx_mt-x-379-442_cy_mt-y-2-207/spacing_c_cx_mt-x-379-442_cy_mt-y-2-207.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_114-116_affine/c_cx_mt-x-379-442_cy_mt-y-2-207/maxFrequencies_c_cx_mt-x-379-442_cy_mt-y-2-207.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_114-116_affine/c_cx_mt-x-379-442_cy_mt-y-2-207/indsForAverage_c_cx_mt-x-379-442_cy_mt-y-2-207.mat')
lmb_mt46 = spacing;
inputData_mt46.lmb = lmb_mt46;
inputData_mt46.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_114-116_affine';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt46] = fxn_mtFilmAndRatioCalc(inputData_mt46,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt46.yibgn;
    yibgtp = coatingData_mt46.yibgtp;
    
    save([saveDir,'/yibgn_mt46.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt46.mat'],'yibgtp')
end

save([saveDir,'/coatingData_mt46.mat'],'coatingData_mt46')
save([saveDirMain,'/coatingData_mt46.mat'],'coatingData_mt46')
 
 
%% mt 47, 2019 10 25, 3x tpx2 conc
 
% load data from table
h47_naked = [mt_20191025_expt1_uncoated.y];
 
h47_bg_naked = [mt_20191025_expt1_uncoated.y1];
 
% load input data for tpx2 coated mt
h47_tpx2 = [mt_20191025_expt1_TPX2coated.y2];
 
h47_bg_tpx2 = [mt_20191025_expt1_TPX2coated.y;...
    mt_20191025_expt1_TPX2coated.y1];
 
 
% load input data for naked mt
inputData_mt47.h_naked = h47_naked;
inputData_mt47.h_bg_naked = h47_bg_naked;
 
 
inputData_mt47.h_tpx2 = h47_tpx2;
inputData_mt47.h_bg_tpx2 = h47_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt47.yibgn = 1000;
    clear yibgn
    
    inputData_mt47.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-76-308_cy_mt-y-3-321/spacing_c_cx_mt-x-76-308_cy_mt-y-3-321.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-76-308_cy_mt-y-3-321/maxFrequencies_c_cx_mt-x-76-308_cy_mt-y-3-321.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-76-308_cy_mt-y-3-321/indsForAverage_c_cx_mt-x-76-308_cy_mt-y-3-321.mat')
lmb_mt47 = spacing;
inputData_mt47.lmb = lmb_mt47;
inputData_mt47.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt47] = fxn_mtFilmAndRatioCalc(inputData_mt47,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt47.yibgn;
    yibgtp = coatingData_mt47.yibgtp;
    
    save([saveDir,'/yibgn_mt47.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt47.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt47.mat'],'coatingData_mt47')
save([saveDirMain,'/coatingData_mt47.mat'],'coatingData_mt47')
 

%% mt 48, 2019 10 25, 3x tpx2 conc
 
% load data from table
h48_naked = [mt_20191025_expt1_uncoated.y];
 
h48_bg_naked = [mt_20191025_expt1_uncoated.y1];
 
% load input data for tpx2 coated mt
h48_tpx2 = [mt_20191025_expt1_TPX2coated.y2];
 
h48_bg_tpx2 = [mt_20191025_expt1_TPX2coated.y;...
    mt_20191025_expt1_TPX2coated.y1];
 
 
% load input data for naked mt
inputData_mt48.h_naked = h48_naked;
inputData_mt48.h_bg_naked = h48_bg_naked;
 
 
inputData_mt48.h_tpx2 = h48_tpx2;
inputData_mt48.h_bg_tpx2 = h48_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt48.yibgn = 1000;
    clear yibgn
    
    inputData_mt48.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-65-305_cy_mt-y-233-445/spacing_c_cx_mt-x-65-305_cy_mt-y-233-445.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-65-305_cy_mt-y-233-445/maxFrequencies_c_cx_mt-x-65-305_cy_mt-y-233-445.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-65-305_cy_mt-y-233-445/indsForAverage_c_cx_mt-x-65-305_cy_mt-y-233-445.mat')
lmb_mt48 = spacing;
inputData_mt48.lmb = lmb_mt48;
inputData_mt48.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt48] = fxn_mtFilmAndRatioCalc(inputData_mt48,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt48.yibgn;
    yibgtp = coatingData_mt48.yibgtp;
    
    save([saveDir,'/yibgn_mt48.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt48.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt48.mat'],'coatingData_mt48')
save([saveDirMain,'/coatingData_mt48.mat'],'coatingData_mt48')
 
 
%% mt 49, 2019 10 25, 3x tpx2 conc
 
% load data from table
h49_naked = [mt_20191025_expt1_uncoated.y];
 
h49_bg_naked = [mt_20191025_expt1_uncoated.y1];
 
% load input data for tpx2 coated mt
h49_tpx2 = [mt_20191025_expt1_TPX2coated.y2];
 
h49_bg_tpx2 = [mt_20191025_expt1_TPX2coated.y;...
    mt_20191025_expt1_TPX2coated.y1];
 
 
% load input data for naked mt
inputData_mt49.h_naked = h49_naked;
inputData_mt49.h_bg_naked = h49_bg_naked;
 
 
inputData_mt49.h_tpx2 = h49_tpx2;
inputData_mt49.h_bg_tpx2 = h49_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt49.yibgn = 1000;
    clear yibgn
    
    inputData_mt49.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-178-10_cy_mt-y-203-283/spacing_c_cx_mt-x-178-10_cy_mt-y-203-283.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-178-10_cy_mt-y-203-283/maxFrequencies_c_cx_mt-x-178-10_cy_mt-y-203-283.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-178-10_cy_mt-y-203-283/indsForAverage_c_cx_mt-x-178-10_cy_mt-y-203-283.mat')
lmb_mt49 = spacing;
inputData_mt49.lmb = lmb_mt49;
inputData_mt49.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt49] = fxn_mtFilmAndRatioCalc(inputData_mt49,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt49.yibgn;
    yibgtp = coatingData_mt49.yibgtp;
    
    save([saveDir,'/yibgn_mt49.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt49.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt49.mat'],'coatingData_mt49')
save([saveDirMain,'/coatingData_mt49.mat'],'coatingData_mt49')
 
 
%% mt 50, 2019 10 25, 3x tpx2 conc
 
% load data from table
h50_naked = [mt_20191025_expt1_uncoated.y];
 
h50_bg_naked = [mt_20191025_expt1_uncoated.y1];
 
% load input data for tpx2 coated mt
h50_tpx2 = [mt_20191025_expt1_TPX2coated.y2];
 
h50_bg_tpx2 = [mt_20191025_expt1_TPX2coated.y;...
    mt_20191025_expt1_TPX2coated.y1];
 
 
% load input data for naked mt
inputData_mt50.h_naked = h50_naked;
inputData_mt50.h_bg_naked = h50_bg_naked;
 
 
inputData_mt50.h_tpx2 = h50_tpx2;
inputData_mt50.h_bg_tpx2 = h50_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt50.yibgn = 1000;
    clear yibgn
    
    inputData_mt50.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-224-171_cy_mt-y-355-508/spacing_c_cx_mt-x-224-171_cy_mt-y-355-508.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-224-171_cy_mt-y-355-508/maxFrequencies_c_cx_mt-x-224-171_cy_mt-y-355-508.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-224-171_cy_mt-y-355-508/indsForAverage_c_cx_mt-x-224-171_cy_mt-y-355-508.mat')
lmb_mt50 = spacing;
inputData_mt50.lmb = lmb_mt50;
inputData_mt50.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt50] = fxn_mtFilmAndRatioCalc(inputData_mt50,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt50.yibgn;
    yibgtp = coatingData_mt50.yibgtp;
    
    save([saveDir,'/yibgn_mt50.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt50.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt50.mat'],'coatingData_mt50')
save([saveDirMain,'/coatingData_mt50.mat'],'coatingData_mt50')
 
 
%% mt 51, 2019 10 25, 3x tpx2 conc
 
% load data from table
h51_naked = [mt_20191025_expt1_uncoated.y];
 
h51_bg_naked = [mt_20191025_expt1_uncoated.y1];
 
% load input data for tpx2 coated mt
h51_tpx2 = [mt_20191025_expt1_TPX2coated.y2];
 
h51_bg_tpx2 = [mt_20191025_expt1_TPX2coated.y;...
    mt_20191025_expt1_TPX2coated.y1];
 
 
% load input data for naked mt
inputData_mt51.h_naked = h51_naked;
inputData_mt51.h_bg_naked = h51_bg_naked;
 
 
inputData_mt51.h_tpx2 = h51_tpx2;
inputData_mt51.h_bg_tpx2 = h51_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt51.yibgn = 1000;
    clear yibgn
    
    inputData_mt51.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-234-355_cy_mt-y-352-315/spacing_c_cx_mt-x-234-355_cy_mt-y-352-315.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-234-355_cy_mt-y-352-315/maxFrequencies_c_cx_mt-x-234-355_cy_mt-y-352-315.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-234-355_cy_mt-y-352-315/indsForAverage_c_cx_mt-x-234-355_cy_mt-y-352-315.mat')
lmb_mt51 = spacing;
inputData_mt51.lmb = lmb_mt51;
inputData_mt51.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt51] = fxn_mtFilmAndRatioCalc(inputData_mt51,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt51.yibgn;
    yibgtp = coatingData_mt51.yibgtp;
    
    save([saveDir,'/yibgn_mt51.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt51.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt51.mat'],'coatingData_mt51')
save([saveDirMain,'/coatingData_mt51.mat'],'coatingData_mt51')
 
 
%% expt3, 2019 10 31, 3x tpx2

% import TPX2 coated data
run([runDir,'loadMTheightData_20191031_expt3_tpx2Coated.m'])
expt3_20191031_3xTpx2Coated = expt32468bg1357MtTpx2Coatedframe22920191031;
clear expt32468bg1357MtTpx2Coatedframe22920191031

% run([runDir,'loadMTheightData_20191031_expt3_naked_minimalCorrection.m'])
% expt3_20191031_nakedMTs_minCorrection = expt32468bg1357MtNakedMinimalCorrectionframe22820191031;
% clear expt32468bg1357MtNakedMinimalCorrectionframe22820191031
% 
run([runDir,'loadMTheightData_20191031_expt3_naked.m'])
expt3_20191031_nakedMTs = expt32468bg1357MtNakedframe22820191031;
clear expt32468bg1357MtNakedframe22820191031

%% mt52, 2019 10 31, expt 3x tpx2
 
% load data from table
% h52_naked = [expt3_20191031_nakedMTs_minCorrection.y;...
%     expt3_20191031_nakedMTs_minCorrection.y2;...
%     expt3_20191031_nakedMTs_minCorrection.y4;...
%     expt3_20191031_nakedMTs_minCorrection.y6;...
%     ];
% 
% h52_bg_naked = [expt3_20191031_nakedMTs_minCorrection.y1;...
%     expt3_20191031_nakedMTs_minCorrection.y3;...
%     expt3_20191031_nakedMTs_minCorrection.y5;...
%     expt3_20191031_nakedMTs_minCorrection.y7;...
%     ];
 
h52_naked = [expt3_20191031_nakedMTs.y;...
    expt3_20191031_nakedMTs.y2;...
    expt3_20191031_nakedMTs.y4;...
    expt3_20191031_nakedMTs.y6;...
    ];

h52_bg_naked = [expt3_20191031_nakedMTs.y1;...
    expt3_20191031_nakedMTs.y3;...
    expt3_20191031_nakedMTs.y5;...
    expt3_20191031_nakedMTs.y7;...
    ];

% h52_naked = 25e-9;
% h52_bg_naked = 0;


% load input data for tpx2 coated mt
h52_tpx2 = [expt3_20191031_3xTpx2Coated.y2];
 
h52_bg_tpx2 = [expt3_20191031_3xTpx2Coated.y3];
 
 
% load input data for naked mt
inputData_mt52.h_naked = h52_naked;
inputData_mt52.h_bg_naked = h52_bg_naked;
 
 
inputData_mt52.h_tpx2 = h52_tpx2;
inputData_mt52.h_bg_tpx2 = h52_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt52.yibgn = 1000;
    clear yibgn
    
    inputData_mt52.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-180-207_cy_mt-y-42-253/spacing_c_cx_mt-x-180-207_cy_mt-y-42-253.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-180-207_cy_mt-y-42-253/maxFrequencies_c_cx_mt-x-180-207_cy_mt-y-42-253.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-180-207_cy_mt-y-42-253/indsForAverage_c_cx_mt-x-180-207_cy_mt-y-42-253.mat')
lmb_mt52 = spacing;
inputData_mt52.lmb = lmb_mt52;
inputData_mt52.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt52] = fxn_mtFilmAndRatioCalc(inputData_mt52,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt52.yibgn;
    yibgtp = coatingData_mt52.yibgtp;
    
    save([saveDir,'/yibgn_mt52.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt52.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt52.mat'],'coatingData_mt52')
save([saveDirMain,'/coatingData_mt52.mat'],'coatingData_mt52')
 
 
%% mt53, 2019 10 31, expt 3x tpx2
 
% load data from table
% h53_naked = [expt3_20191031_nakedMTs_minCorrection.y;...
%     expt3_20191031_nakedMTs_minCorrection.y2;...
%     expt3_20191031_nakedMTs_minCorrection.y4;...
%     expt3_20191031_nakedMTs_minCorrection.y6;...
%     ];
% 
% h53_bg_naked = [expt3_20191031_nakedMTs_minCorrection.y1;...
%     expt3_20191031_nakedMTs_minCorrection.y3;...
%     expt3_20191031_nakedMTs_minCorrection.y5;...
%     expt3_20191031_nakedMTs_minCorrection.y7;...
%     ];
 
h53_naked = [expt3_20191031_nakedMTs.y;...
    expt3_20191031_nakedMTs.y2;...
    expt3_20191031_nakedMTs.y4;...
    expt3_20191031_nakedMTs.y6;...
    ];
 
h53_bg_naked = [expt3_20191031_nakedMTs.y1;...
    expt3_20191031_nakedMTs.y3;...
    expt3_20191031_nakedMTs.y5;...
    expt3_20191031_nakedMTs.y7;...
    ];
 
% h53_naked = 25e-9;
% h53_bg_naked = 0;
 
 
% load input data for tpx2 coated mt
h53_tpx2 = [expt3_20191031_3xTpx2Coated.y];
 
h53_bg_tpx2 = [expt3_20191031_3xTpx2Coated.y1];
 
 
% load input data for naked mt
inputData_mt53.h_naked = h53_naked;
inputData_mt53.h_bg_naked = h53_bg_naked;
 
 
inputData_mt53.h_tpx2 = h53_tpx2;
inputData_mt53.h_bg_tpx2 = h53_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt53.yibgn = 1000;
    clear yibgn
    
    inputData_mt53.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249/spacing_c_cx_mt-x-75-123_cy_mt-y-103-249.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249/maxFrequencies_c_cx_mt-x-75-123_cy_mt-y-103-249.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249/indsForAverage_c_cx_mt-x-75-123_cy_mt-y-103-249.mat')
lmb_mt53 = spacing;
inputData_mt53.lmb = lmb_mt53;
inputData_mt53.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt53] = fxn_mtFilmAndRatioCalc(inputData_mt53,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt53.yibgn;
    yibgtp = coatingData_mt53.yibgtp;
    
    save([saveDir,'/yibgn_mt53.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt53.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt53.mat'],'coatingData_mt53')
save([saveDirMain,'/coatingData_mt53.mat'],'coatingData_mt53')
 
 
%% mt54, 2019 10 31, expt 3x tpx2
 
% load data from table
% h54_naked = [expt3_20191031_nakedMTs_minCorrection.y;...
%     expt3_20191031_nakedMTs_minCorrection.y2;...
%     expt3_20191031_nakedMTs_minCorrection.y4;...
%     expt3_20191031_nakedMTs_minCorrection.y6;...
%     ];
% 
% h54_bg_naked = [expt3_20191031_nakedMTs_minCorrection.y1;...
%     expt3_20191031_nakedMTs_minCorrection.y3;...
%     expt3_20191031_nakedMTs_minCorrection.y5;...
%     expt3_20191031_nakedMTs_minCorrection.y7;...
%     ];
 
h54_naked = [expt3_20191031_nakedMTs.y;...
    expt3_20191031_nakedMTs.y2;...
    expt3_20191031_nakedMTs.y4;...
    expt3_20191031_nakedMTs.y6;...
    ];
 
h54_bg_naked = [expt3_20191031_nakedMTs.y1;...
    expt3_20191031_nakedMTs.y3;...
    expt3_20191031_nakedMTs.y5;...
    expt3_20191031_nakedMTs.y7;...
    ];
 
% h54_naked = 25e-9;
% h54_bg_naked = 0;
 
 
% load input data for tpx2 coated mt
h54_tpx2 = [expt3_20191031_3xTpx2Coated.y4];
 
h54_bg_tpx2 = [expt3_20191031_3xTpx2Coated.y5];


% load input data for naked mt
inputData_mt54.h_naked = h54_naked;
inputData_mt54.h_bg_naked = h54_bg_naked;
 
 
inputData_mt54.h_tpx2 = h54_tpx2;
inputData_mt54.h_bg_tpx2 = h54_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt54.yibgn = 1000;
    clear yibgn
    
    inputData_mt54.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4/spacing_c_cx_mt-x-23-50_cy_mt-y-117-4.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4/maxFrequencies_c_cx_mt-x-23-50_cy_mt-y-117-4.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4/indsForAverage_c_cx_mt-x-23-50_cy_mt-y-117-4.mat')
lmb_mt54 = spacing;
inputData_mt54.lmb = lmb_mt54;
inputData_mt54.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt54] = fxn_mtFilmAndRatioCalc(inputData_mt54,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt54.yibgn;
    yibgtp = coatingData_mt54.yibgtp;
    
    save([saveDir,'/yibgn_mt54.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt54.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt54.mat'],'coatingData_mt54')
save([saveDirMain,'/coatingData_mt54.mat'],'coatingData_mt54')
 

%% mt55, 2019 10 31, expt 3x tpx2
 
% load data from table
% h55_naked = [expt3_20191031_nakedMTs_minCorrection.y;...
%     expt3_20191031_nakedMTs_minCorrection.y2;...
%     expt3_20191031_nakedMTs_minCorrection.y4;...
%     expt3_20191031_nakedMTs_minCorrection.y6;...
%     ];
% 
% h55_bg_naked = [expt3_20191031_nakedMTs_minCorrection.y1;...
%     expt3_20191031_nakedMTs_minCorrection.y3;...
%     expt3_20191031_nakedMTs_minCorrection.y5;...
%     expt3_20191031_nakedMTs_minCorrection.y7;...
%     ];
 
h55_naked = [expt3_20191031_nakedMTs.y;...
    expt3_20191031_nakedMTs.y2;...
    expt3_20191031_nakedMTs.y4;...
    expt3_20191031_nakedMTs.y6;...
    ];
 
h55_bg_naked = [expt3_20191031_nakedMTs.y1;...
    expt3_20191031_nakedMTs.y3;...
    expt3_20191031_nakedMTs.y5;...
    expt3_20191031_nakedMTs.y7;...
    ];
 
% h55_naked = 25e-9;
% h55_bg_naked = 0;
 
 
% load input data for tpx2 coated mt
h55_tpx2 = [expt3_20191031_3xTpx2Coated.y6];
 
h55_bg_tpx2 = [expt3_20191031_3xTpx2Coated.y7];
 
 
% load input data for naked mt
inputData_mt55.h_naked = h55_naked;
inputData_mt55.h_bg_naked = h55_bg_naked;
 
 
inputData_mt55.h_tpx2 = h55_tpx2;
inputData_mt55.h_bg_tpx2 = h55_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt55.yibgn = 1000;
    clear yibgn
    
    inputData_mt55.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250/spacing_c_cx_mt-x-6-105_cy_mt-y-178-250.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250/maxFrequencies_c_cx_mt-x-6-105_cy_mt-y-178-250.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250/indsForAverage_c_cx_mt-x-6-105_cy_mt-y-178-250.mat')
lmb_mt55 = spacing;
inputData_mt55.lmb = lmb_mt55;
inputData_mt55.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt55] = fxn_mtFilmAndRatioCalc(inputData_mt55,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt55.yibgn;
    yibgtp = coatingData_mt55.yibgtp;
    
    save([saveDir,'/yibgn_mt55.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt55.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt55.mat'],'coatingData_mt55')
save([saveDirMain,'/coatingData_mt55.mat'],'coatingData_mt55')
 
 
%% mt56, 2019 10 31, expt 3x tpx2
 
% load data from table
% h56_naked = [expt3_20191031_nakedMTs_minCorrection.y;...
%     expt3_20191031_nakedMTs_minCorrection.y2;...
%     expt3_20191031_nakedMTs_minCorrection.y4;...
%     expt3_20191031_nakedMTs_minCorrection.y6;...
%     ];
% 
% h56_bg_naked = [expt3_20191031_nakedMTs_minCorrection.y1;...
%     expt3_20191031_nakedMTs_minCorrection.y3;...
%     expt3_20191031_nakedMTs_minCorrection.y5;...
%     expt3_20191031_nakedMTs_minCorrection.y7;...
%     ];
 
h56_naked = [expt3_20191031_nakedMTs.y;...
    expt3_20191031_nakedMTs.y2;...
    expt3_20191031_nakedMTs.y4;...
    expt3_20191031_nakedMTs.y6;...
    ];
 
h56_bg_naked = [expt3_20191031_nakedMTs.y1;...
    expt3_20191031_nakedMTs.y3;...
    expt3_20191031_nakedMTs.y5;...
    expt3_20191031_nakedMTs.y7;...
    ];
 
% h56_naked = 25e-9;
% h56_bg_naked = 0;
 
 
% load input data for tpx2 coated mt
h56_tpx2 = [expt3_20191031_3xTpx2Coated.y;...
    expt3_20191031_3xTpx2Coated.y2;...
    expt3_20191031_3xTpx2Coated.y4;...
    expt3_20191031_3xTpx2Coated.y6;...
    ];

h56_bg_tpx2 = [expt3_20191031_3xTpx2Coated.y1;...
    expt3_20191031_3xTpx2Coated.y3;...
    expt3_20191031_3xTpx2Coated.y5;...
    expt3_20191031_3xTpx2Coated.y7;...
    ];
 
 
% load input data for naked mt
inputData_mt56.h_naked = h56_naked;
inputData_mt56.h_bg_naked = h56_bg_naked;
 
 
inputData_mt56.h_tpx2 = h56_tpx2;
inputData_mt56.h_bg_tpx2 = h56_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt56.yibgn = 1000;
    clear yibgn
    
    inputData_mt56.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-170-369_cy_mt-y-121-176/spacing_c_cx_mt-x-170-369_cy_mt-y-121-176.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-170-369_cy_mt-y-121-176/maxFrequencies_c_cx_mt-x-170-369_cy_mt-y-121-176.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-170-369_cy_mt-y-121-176/indsForAverage_c_cx_mt-x-170-369_cy_mt-y-121-176.mat')
lmb_mt56 = spacing;
inputData_mt56.lmb = lmb_mt56;
inputData_mt56.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt56] = fxn_mtFilmAndRatioCalc(inputData_mt56,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt56.yibgn;
    yibgtp = coatingData_mt56.yibgtp;
    
    save([saveDir,'/yibgn_mt56.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt56.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt56.mat'],'coatingData_mt56')
save([saveDirMain,'/coatingData_mt56.mat'],'coatingData_mt56')
 
 
%% mt57, 2019 10 31, expt 3x tpx2
 
% load data from table
% h57_naked = [expt3_20191031_nakedMTs_minCorrection.y;...
%     expt3_20191031_nakedMTs_minCorrection.y2;...
%     expt3_20191031_nakedMTs_minCorrection.y4;...
%     expt3_20191031_nakedMTs_minCorrection.y6;...
%     ];
% 
% h57_bg_naked = [expt3_20191031_nakedMTs_minCorrection.y1;...
%     expt3_20191031_nakedMTs_minCorrection.y3;...
%     expt3_20191031_nakedMTs_minCorrection.y5;...
%     expt3_20191031_nakedMTs_minCorrection.y7;...
%     ];
 
h57_naked = [expt3_20191031_nakedMTs.y;...
    expt3_20191031_nakedMTs.y2;...
    expt3_20191031_nakedMTs.y4;...
    expt3_20191031_nakedMTs.y6;...
    ];
 
h57_bg_naked = [expt3_20191031_nakedMTs.y1;...
    expt3_20191031_nakedMTs.y3;...
    expt3_20191031_nakedMTs.y5;...
    expt3_20191031_nakedMTs.y7;...
    ];
 
% h57_naked = 25e-9;
% h57_bg_naked = 0;
 
 
% load input data for tpx2 coated mt
h57_tpx2 = [expt3_20191031_3xTpx2Coated.y;...
    expt3_20191031_3xTpx2Coated.y2;...
    expt3_20191031_3xTpx2Coated.y4;...
    expt3_20191031_3xTpx2Coated.y6;...
    ];
 
h57_bg_tpx2 = [expt3_20191031_3xTpx2Coated.y1;...
    expt3_20191031_3xTpx2Coated.y3;...
    expt3_20191031_3xTpx2Coated.y5;...
    expt3_20191031_3xTpx2Coated.y7;...
    ];
 
 
% load input data for naked mt
inputData_mt57.h_naked = h57_naked;
inputData_mt57.h_bg_naked = h57_bg_naked;

inputData_mt57.h_tpx2 = h57_tpx2;
inputData_mt57.h_bg_tpx2 = h57_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt57.yibgn = 1000;
    clear yibgn
    
    inputData_mt57.yibgtp = 1000;
    clear yibgtp
end
 
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-216-503_cy_mt-y-173-504/spacing_c_cx_mt-x-216-503_cy_mt-y-173-504.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-216-503_cy_mt-y-173-504/maxFrequencies_c_cx_mt-x-216-503_cy_mt-y-173-504.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-216-503_cy_mt-y-173-504/indsForAverage_c_cx_mt-x-216-503_cy_mt-y-173-504.mat')
lmb_mt57 = spacing;
inputData_mt57.lmb = lmb_mt57;
inputData_mt57.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg';
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt57] = fxn_mtFilmAndRatioCalc(inputData_mt57,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt57.yibgn;
    yibgtp = coatingData_mt57.yibgtp;
    
    save([saveDir,'/yibgn_mt57.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt57.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt57.mat'],'coatingData_mt57')
save([saveDirMain,'/coatingData_mt57.mat'],'coatingData_mt57')
 
 
%% mt58, 2019 10 31, expt 3x tpx2
 
% load data from table
% h58_naked = [expt3_20191031_nakedMTs_minCorrection.y;...
%     expt3_20191031_nakedMTs_minCorrection.y2;...
%     expt3_20191031_nakedMTs_minCorrection.y4;...
%     expt3_20191031_nakedMTs_minCorrection.y6;...
%     ];
% 
% h58_bg_naked = [expt3_20191031_nakedMTs_minCorrection.y1;...
%     expt3_20191031_nakedMTs_minCorrection.y3;...
%     expt3_20191031_nakedMTs_minCorrection.y5;...
%     expt3_20191031_nakedMTs_minCorrection.y7;...
%     ];
 
h58_naked = [expt3_20191031_nakedMTs.y;...
    expt3_20191031_nakedMTs.y2;...
    expt3_20191031_nakedMTs.y4;...
    expt3_20191031_nakedMTs.y6;...
    ];
 
h58_bg_naked = [expt3_20191031_nakedMTs.y1;...
    expt3_20191031_nakedMTs.y3;...
    expt3_20191031_nakedMTs.y5;...
    expt3_20191031_nakedMTs.y7;...
    ];
 
% h58_naked = 25e-9;
% h58_bg_naked = 0;
 
 
% load input data for tpx2 coated mt
h58_tpx2 = [expt3_20191031_3xTpx2Coated.y;...
    expt3_20191031_3xTpx2Coated.y2;...
    expt3_20191031_3xTpx2Coated.y4;...
    expt3_20191031_3xTpx2Coated.y6;...
    ];
 
h58_bg_tpx2 = [expt3_20191031_3xTpx2Coated.y1;...
    expt3_20191031_3xTpx2Coated.y3;...
    expt3_20191031_3xTpx2Coated.y5;...
    expt3_20191031_3xTpx2Coated.y7;...
    ];
 
 
% load input data for naked mt
inputData_mt58.h_naked = h58_naked;
inputData_mt58.h_bg_naked = h58_bg_naked;
 
 
inputData_mt58.h_tpx2 = h58_tpx2;
inputData_mt58.h_bg_tpx2 = h58_bg_tpx2;
 
selectCutOff = 0;
if selectCutOff == 0
    inputData_mt58.yibgn = 1000;
    clear yibgn
    
    inputData_mt58.yibgtp = 1000;
    clear yibgtp
end


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-260-464_cy_mt-y-334-506/spacing_c_cx_mt-x-260-464_cy_mt-y-334-506.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-260-464_cy_mt-y-334-506/maxFrequencies_c_cx_mt-x-260-464_cy_mt-y-334-506.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-260-464_cy_mt-y-334-506/indsForAverage_c_cx_mt-x-260-464_cy_mt-y-334-506.mat')
lmb_mt58 = spacing;
inputData_mt58.lmb = lmb_mt58;
inputData_mt58.maxF_all = maxF_all(indsForAverage);
 
clear spacing
clear maxF_all
clear indsForAverage
 
saveDir = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg';
 
 
% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt58] = fxn_mtFilmAndRatioCalc(inputData_mt58,selectCutOff);
 
if selectCutOff == 1
    
    yibgn = coatingData_mt58.yibgn;
    yibgtp = coatingData_mt58.yibgtp;
    
    save([saveDir,'/yibgn_mt58.mat'],'yibgn')
    save([saveDir,'/yibgtp_mt58.mat'],'yibgtp')
end
 
save([saveDir,'/coatingData_mt58.mat'],'coatingData_mt58')
save([saveDirMain,'/coatingData_mt58.mat'],'coatingData_mt58')


%% just theory curve

doSave = 0;

% load theory curve
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadRPTheoryCurve_nonDimensionalized.m')

h = filmHeight.e01;
lmb = wavelength.e01;%*1e3;
figure; hold on;

xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;
doLatex = 0;

grid off

plot(h,lmb*1e3,'k-','LineWidth',5)

xlim([0 31])
ylim([0 550])

gcf;
legend({'$\lambda_{\mathrm{max}}$'},...
    'Interpreter','latex',...
    'FontSize',16,...
    'Position',[.2 .74 .1 .1])


legend('boxoff')
legend('Location','NorthWest')

% simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$(nm)', xafz, yafz, tvfz, axesLw, doLatex )
simplePlotFormat( 'Film thickness \ith\rm (nm)', 'Droplet spacing \lambda_{max} (nm)', xafz, yafz, tvfz, axesLw, doLatex )
box on

if doSave
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/predicted wavelength vs film thickness ONLY'])
    
end


%% with conc. noted


doSave = 0;

% load theory curve
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadRPTheoryCurve_nonDimensionalized.m')

h = filmHeight.e01;
lmb = wavelength.e01;%*1e3;
figure; hold on;

xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;

tpData3 = 'gx'; % 50-150nM
tpData1 = 'b^'; % 100-300nM
tpData4 = 'mo'; % 300-900nM
tpData2 = 'rs'; % 400-1200nM

tpLw = 1.5;
ms = 12;
grid off

plot(h,lmb*1e3,'k-','LineWidth',5)

plotLmbVsH(coatingData_mt10,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt1,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt45,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt7,tpData2,tpLw,ms)

% 100-300nM, 1x
plotLmbVsH(coatingData_mt2,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt3,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt4,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt5,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt6,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt34,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt35,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt36,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt37,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt38,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt39,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt40,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt41,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt42,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt43,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt44,tpData1,tpLw,ms)

% 300-900nM, 3x
plotLmbVsH(coatingData_mt46,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt47,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt48,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt49,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt50,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt51,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt52,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt53,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt54,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt55,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt56,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt57,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt58,tpData4,tpLw,ms)

% 400-1200nM, 4x
plotLmbVsH(coatingData_mt8,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt9,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt28,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt29,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt30,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt31,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt32,tpData2,tpLw,ms)
% plotLmbVsH(coatingData_mt33,tpData2,tpLw,ms)


% 50-150nM, 0.5x
plotLmbVsH(coatingData_mt11,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt12,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt13,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt14,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt15,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt16,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt17,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt18,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt19,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt20,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt21,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt22,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt23,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt24,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt25,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt26,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt27,tpData3,tpLw,ms)

%plot(mean([film_mt1 film_mt3 film_mt3 film_mt4 film_mt5 film_mt6]),229,'bo')
xlim([0 31])
ylim([0 550])
% ylim([0 .55])

gcf;
% legend({'$\lambda_{\mathrm{max}}$',...
%     '0.1 $\pm$ 0.05 $\mu$M',...
%     '0.2 $\pm$ 0.1 $\mu$M',...
%     '0.6 $\pm$ 0.3 $\mu$M',...
%     '0.8 $\pm$ 0.4 $\mu$M'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.2 .74 .1 .1])
legend({'\lambda_{max}',...
    '0.1 \pm 0.05 \muM',...
    '0.2 \pm 0.1 \muM',...
    '0.6 \pm 0.3 \muM',...
    '0.8 \pm 0.4 \muM'},...
    'FontSize',16,...
    'Position',[.2 .74 .1 .1])
% legend({'$\lambda_{\mathrm{max}}$',...
%     '0.05 -- 0.15 $\mu$M',...
%     '0.1 -- 0.3 $\mu$M',...
%     '0.3 -- 0.9 $\mu$M',...
%     '0.4 -- 1.2 $\mu$M'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.2 .74 .1 .1])

legend('boxoff')
legend('Location','NorthWest')

% doLatex = 1;
% simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$(nm)', xafz, yafz, tvfz, axesLw, doLatex )
%simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$($\mu$m)', xafz, yafz, tvfz, axesLw, doLatex )

doLatex = 0;
simplePlotFormat( 'Film thickness \ith\rm (nm)', 'Droplet spacing \lambda_{max} (nm)', xafz, yafz, tvfz, axesLw, doLatex )


box on

if doSave
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/sansSerif_predicted and measured wavelength vs film thickness and tpx2 conc range_nmYaxis'])
    
end

%% without conc. noted


% load theory curve
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadRPTheoryCurve_nonDimensionalized.m')

h = filmHeight.e01;
lmb = wavelength.e01;%*1e3;
figure; hold on;

xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;

tpData = 'ko';
tpData3 = tpData; % 50-150nM
tpData1 = tpData; % 100-300nM
tpData4 = tpData; % 300-900nM
tpData2 = tpData; % 400-1200nM

tpLw = 2;
ms = 10;
grid off

plot(h,lmb*1e3,'k-','LineWidth',5)

plotLmbVsH(coatingData_mt10,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt1,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt45,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt7,tpData2,tpLw,ms)

% 100-300nM, 1x
plotLmbVsH(coatingData_mt2,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt3,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt4,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt5,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt6,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt34,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt35,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt36,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt37,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt38,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt39,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt40,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt41,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt42,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt43,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt44,tpData1,tpLw,ms)

% 300-900nM, 3x
plotLmbVsH(coatingData_mt46,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt47,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt48,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt49,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt50,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt51,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt52,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt53,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt54,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt55,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt56,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt57,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt58,tpData4,tpLw,ms)

% 400-1200nM, 4x
plotLmbVsH(coatingData_mt8,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt9,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt28,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt29,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt30,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt31,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt32,tpData2,tpLw,ms)
% plotLmbVsH(coatingData_mt33,tpData2,tpLw,ms)


% 50-150nM, 0.5x
plotLmbVsH(coatingData_mt11,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt12,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt13,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt14,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt15,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt16,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt17,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt18,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt19,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt20,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt21,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt22,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt23,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt24,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt25,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt26,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt27,tpData3,tpLw,ms)

%plot(mean([film_mt1 film_mt3 film_mt3 film_mt4 film_mt5 film_mt6]),229,'bo')
xlim([0 31])
ylim([0 550])
% ylim([0 .55])

gcf;

% legend({'$\lambda_{\mathrm{max}}$',...
%     '0.1 $\pm$ 0.05 $\mu$M',...
%     '0.2 $\pm$ 0.1 $\mu$M',...
%     '0.6 $\pm$ 0.3 $\mu$M',...
%     '0.8 $\pm$ 0.4 $\mu$M'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.2 .74 .1 .1])

% legend({'\lambda_{max}',...
%     },'FontSize',16)

% legend({'$\lambda_{\mathrm{max}}$',...
%     '0.05 -- 0.15 $\mu$M',...
%     '0.1 -- 0.3 $\mu$M',...
%     '0.3 -- 0.9 $\mu$M',...
%     '0.4 -- 1.2 $\mu$M'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.2 .74 .1 .1])

% legend('boxoff')
% legend('Location','NorthWest')

% doLatex = 1;
% simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$(nm)', xafz, yafz, tvfz, axesLw, doLatex )
%simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$($\mu$m)', xafz, yafz, tvfz, axesLw, doLatex )

doLatex = 0;
simplePlotFormat( 'Film thickness \ith\rm (nm)', 'Droplet spacing \lambda_{max} (nm)', xafz, yafz, tvfz, axesLw, doLatex )

doSave = 1;


box on

if doSave
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/sansSerif_noTpx2Conc_predicted and measured wavelength vs film thickness_nmYaxis'])
    
end

%% adjusted for effective film height/volume without conc. noted

doSave = 1;

% load theory curve
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadRPTheoryCurve_nonDimensionalized.m')

% load heights
h = filmHeight.e01;

% define MT inner radius
ri = 12.5; %nm

% define MT outer radius
ro = h + ri;

% volume in free space of coating
V = pi.*(ro.^2-ri.^2);

% volume of 'pie slice' sweeping across excluded volume
V1 = pi.*ro.^2.*(acos(ri./ro)./(pi));

% volume of triangle to be ignored in 'pie slice'
V2 = ri.*sqrt(ro.^2-ri.^2);

% V3 = pi.*ri.^2.*acos(ri./ro);

% define 'Z' variable, which is volume removed by MT being on surface
Z = (1/pi)*(V - (V1 - V2));

% define 'chi' variable
% chi = h.^2+2*ri.*h;
% 
% % define 'Z' variable
% Z = chi - (chi./pi).*acos(ri./(ri+h)) + (ri/pi).*chi.^(1/2);

% determine effective film height
heff_p = -ri + sqrt(ri^2+Z);
heff_m = -ri - sqrt(ri^2+Z);



lmb = wavelength.e01;%*1e3;

% lmbi = interp(lmb,5);
% hi = interp(h,5);
% 
% hi=hi(hi<max(heff_p))

% get the effective wavelength via interpolation
lmbeff = interp1(h,lmb,heff_p);


figure; hold on;

xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;

tpData = 'ko';
tpData3 = tpData; % 50-150nM
tpData1 = tpData; % 100-300nM
tpData4 = tpData; % 300-900nM
tpData2 = tpData; % 400-1200nM

tpLw = 2;
ms = 10;
grid off

plot(h,lmb*1e3,'k-','LineWidth',5)%,'MarkerSize',ms)
% plot(hi,lmbi(1:78)*1e3,'k-*','LineWidth',5,'MarkerSize',ms)
plot(h,lmbeff*1e3,'b-','LineWidth',5)%,'MarkerSize',ms)

plotLmbVsH(coatingData_mt10,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt1,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt45,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt7,tpData2,tpLw,ms)

% 100-300nM, 1x
plotLmbVsH(coatingData_mt2,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt3,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt4,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt5,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt6,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt34,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt35,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt36,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt37,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt38,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt39,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt40,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt41,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt42,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt43,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt44,tpData1,tpLw,ms)

% 300-900nM, 3x
plotLmbVsH(coatingData_mt46,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt47,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt48,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt49,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt50,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt51,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt52,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt53,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt54,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt55,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt56,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt57,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt58,tpData4,tpLw,ms)

% 400-1200nM, 4x
plotLmbVsH(coatingData_mt8,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt9,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt28,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt29,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt30,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt31,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt32,tpData2,tpLw,ms)
% plotLmbVsH(coatingData_mt33,tpData2,tpLw,ms)


% 50-150nM, 0.5x
plotLmbVsH(coatingData_mt11,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt12,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt13,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt14,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt15,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt16,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt17,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt18,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt19,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt20,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt21,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt22,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt23,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt24,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt25,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt26,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt27,tpData3,tpLw,ms)

%plot(mean([film_mt1 film_mt3 film_mt3 film_mt4 film_mt5 film_mt6]),229,'bo')
xlim([0 31])
ylim([0 550])
% ylim([0 .55])

gcf;

% legend({'$\lambda_{\mathrm{max}}$',...
%     '0.1 $\pm$ 0.05 $\mu$M',...
%     '0.2 $\pm$ 0.1 $\mu$M',...
%     '0.6 $\pm$ 0.3 $\mu$M',...
%     '0.8 $\pm$ 0.4 $\mu$M'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.2 .74 .1 .1])

legend({'\lambda_{max} = f(h)',...
    '\lambda_{max} = f(h_{eff})',...
    },'FontSize',16)

% legend({'$\lambda_{\mathrm{max}}$',...
%     '0.05 -- 0.15 $\mu$M',...
%     '0.1 -- 0.3 $\mu$M',...
%     '0.3 -- 0.9 $\mu$M',...
%     '0.4 -- 1.2 $\mu$M'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.2 .74 .1 .1])

legend('boxoff')
legend('Location','NorthWest')

% doLatex = 1;
% simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$(nm)', xafz, yafz, tvfz, axesLw, doLatex )
%simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$($\mu$m)', xafz, yafz, tvfz, axesLw, doLatex )

doLatex = 0;
simplePlotFormat( 'Film thickness \ith\rm (nm)', 'Droplet spacing \lambda_{max} (nm)', xafz, yafz, tvfz, axesLw, doLatex )




box on

if doSave
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/sansSerif_effectiveHeight_noTpx2Conc_predicted and measured wavelength vs film thickness_nmYaxis'])
    
end

%% adjusted for film height with conc. noted


doSave = 1;

% load theory curve
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadRPTheoryCurve_nonDimensionalized.m')

% load theory curve
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadRPTheoryCurve_nonDimensionalized.m')

% load heights
h = filmHeight.e01;

% define MT inner radius
ri = 12.5; %nm

% define MT outer radius
ro = h + ri;

% volume in free space of coating
V = pi.*(ro.^2-ri.^2);

% volume of 'pie slice' sweeping across excluded volume
V1 = pi.*ro.^2.*(acos(ri./ro)./(pi));

% volume of triangle to be ignored in 'pie slice'
V2 = ri.*sqrt(ro.^2-ri.^2);

% V3 = pi.*ri.^2.*acos(ri./ro);

% define 'Z' variable, which is volume removed by MT being on surface
Z = (1/pi)*(V - (V1 - V2));

% define 'chi' variable
% chi = h.^2+2*ri.*h;
% 
% % define 'Z' variable
% Z = chi - (chi./pi).*acos(ri./(ri+h)) + (ri/pi).*chi.^(1/2);

% determine effective film height
heff_p = -ri + sqrt(ri^2+Z);
heff_m = -ri - sqrt(ri^2+Z);



lmb = wavelength.e01;%*1e3;

% lmbi = interp(lmb,5);
% hi = interp(h,5);
% 
% hi=hi(hi<max(heff_p))

% get the effective wavelength via interpolation
lmbeff = interp1(h,lmb,heff_p);

h = filmHeight.e01;
lmb = wavelength.e01;%*1e3;
figure; hold on;

xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;

tpData3 = 'gx'; % 50-150nM
tpData1 = 'b^'; % 100-300nM
tpData4 = 'mo'; % 300-900nM
tpData2 = 'rs'; % 400-1200nM

tpLw = 1.5;
ms = 12;
grid off

lmbeff(1)=lmb(1); %just for plotting; since lmbeff(1) is nan (can't interp earlier)

plot(h,lmbeff*1e3,'k-','LineWidth',5)%,'MarkerSize',ms)
plot(h,lmb*1e3,'k:','LineWidth',2.5)


plotLmbVsH(coatingData_mt10,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt1,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt45,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt7,tpData2,tpLw,ms)

% 100-300nM, 1x
plotLmbVsH(coatingData_mt2,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt3,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt4,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt5,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt6,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt34,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt35,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt36,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt37,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt38,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt39,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt40,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt41,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt42,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt43,tpData1,tpLw,ms)
plotLmbVsH(coatingData_mt44,tpData1,tpLw,ms)

% 300-900nM, 3x
plotLmbVsH(coatingData_mt46,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt47,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt48,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt49,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt50,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt51,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt52,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt53,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt54,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt55,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt56,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt57,tpData4,tpLw,ms)
plotLmbVsH(coatingData_mt58,tpData4,tpLw,ms)

% 400-1200nM, 4x
plotLmbVsH(coatingData_mt8,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt9,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt28,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt29,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt30,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt31,tpData2,tpLw,ms)
plotLmbVsH(coatingData_mt32,tpData2,tpLw,ms)
% plotLmbVsH(coatingData_mt33,tpData2,tpLw,ms)


% 50-150nM, 0.5x
plotLmbVsH(coatingData_mt11,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt12,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt13,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt14,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt15,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt16,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt17,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt18,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt19,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt20,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt21,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt22,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt23,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt24,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt25,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt26,tpData3,tpLw,ms)
plotLmbVsH(coatingData_mt27,tpData3,tpLw,ms)

%plot(mean([film_mt1 film_mt3 film_mt3 film_mt4 film_mt5 film_mt6]),229,'bo')
xlim([0 31])
ylim([0 550])
% ylim([0 .55])

gcf;
% legend({'$\lambda_{\mathrm{max}}$',...
%     '0.1 $\pm$ 0.05 $\mu$M',...
%     '0.2 $\pm$ 0.1 $\mu$M',...
%     '0.6 $\pm$ 0.3 $\mu$M',...
%     '0.8 $\pm$ 0.4 $\mu$M'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.2 .74 .1 .1])
legend({'\lambda_{max} = f(h_{eff})',...
    '\lambda_{max}',...
    '0.1 \pm 0.05 \muM',...
    '0.2 \pm 0.1 \muM',...
    '0.6 \pm 0.3 \muM',...
    '0.8 \pm 0.4 \muM'},...
    'FontSize',16,...
    'Position',[.2 .74 .1 .1])
% legend({'$\lambda_{\mathrm{max}}$',...
%     '0.05 -- 0.15 $\mu$M',...
%     '0.1 -- 0.3 $\mu$M',...
%     '0.3 -- 0.9 $\mu$M',...
%     '0.4 -- 1.2 $\mu$M'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.2 .74 .1 .1])

legend('boxoff')
legend('Location','NorthWest')

% doLatex = 1;
% simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$(nm)', xafz, yafz, tvfz, axesLw, doLatex )
%simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$($\mu$m)', xafz, yafz, tvfz, axesLw, doLatex )

doLatex = 0;
simplePlotFormat( 'Film thickness \ith\rm (nm)', 'Droplet spacing \lambda_{max} (nm)', xafz, yafz, tvfz, axesLw, doLatex )


box on

if doSave
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/sansSerif_predicted and measured wavelength vs film thickness and tpx2 conc range_nmYaxis_withCorrectedCurve'])
    
end


%%
films_lowconc = [...
coatingData_mt11.film,...
coatingData_mt12.film,...
coatingData_mt13.film,...
coatingData_mt14.film,...
coatingData_mt15.film,...
coatingData_mt16.film,...
coatingData_mt17.film,...
coatingData_mt18.film,...
coatingData_mt19.film,...
coatingData_mt20.film,...
coatingData_mt21.film,...
coatingData_mt22.film,...
coatingData_mt23.film,...
coatingData_mt24.film,...
coatingData_mt25.film,...
coatingData_mt26.film,...
coatingData_mt27.film,...
];
films_lowconc = unique(films_lowconc);

films_highconc = [...
coatingData_mt8.film,...
coatingData_mt9.film,...
coatingData_mt28.film,...
coatingData_mt29.film,...
coatingData_mt30.film,...
coatingData_mt31.film,...
coatingData_mt32.film,...
];
films_highconc = unique(films_highconc);