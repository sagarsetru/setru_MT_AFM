% Sagar Setru
% 2019 09 27


% Change the current folder to the folder of this m-file
% add to path
%cd('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis')

addpath(genpath('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis'))

% import MT naked and TPX2 height measurements from txt files
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadMtHeightDataAndTheoryCurve.m')

%% load line scan data and compute for mt1

% import MT naked and TPX2 height measurements from txt files for MTs 1, 2,
% 3 from 2019 07 16
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadMtHeightData_mt_123_20190716.m')

% get path to save data in
[saveDir]=fileparts(filename);

% load data from table
% x1_naked = mt123naked00228.x;
h1_naked = mt123naked00228.y;

% x1_bg_naked = mt123naked00228.x1;
h1_bg_naked = mt123naked00228.y1;

% x1_tpx2 = mt123tpx200231.x;
h1_tpx2 = mt123tpx200231.y;
 
% x1_bg_tpx2 = mt123tpx200231.x1;
h1_bg_tpx2 = mt123tpx200231.y1;

% lets user select cut off (will ignore any provided via input)
selectCutOff = 0;

if selectCutOff == 0
    
    % load cut off for removing any schmutz in background signal for naked mt
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi1bgn.mat')
    inputData_mt1.yibgn = yi1bgn;
    clear yi1bgn

    % load cut off for removing any schmutz in background signal for tpx2
    % coated mt
    load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi1bgtp.mat')
    inputData_mt1.yibgtp = yi1bgtp;
    clear yi1bgtp
    
end

% load input data for naked mt
inputData_mt1.h_naked = h1_naked;
inputData_mt1.h_bg_naked = h1_bg_naked;

% load input data for tpx2 coated mt
inputData_mt1.h_tpx2 = h1_tpx2;
inputData_mt1.h_bg_tpx2 = h1_bg_tpx2;

% load input data from fourier analysis
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/spacing_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/spacing_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')
lmb_mt1 = spacing;

% load the max frequencies for all line scans used (used to get denominator
% for calculating standard error of mean)
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/maxFrequencies_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/maxFrequencies_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')
maxF_all_mt1 = maxF_all;

inputData_mt1.lmb = spacing;
inputData_mt1.maxF_all = maxF_all;
clear spacing
clear maxF_all


% calculate film thickness, ratios, and std devs via error propagation
[coatingData_mt1] = fxn_mtFilmAndRatioCalc(inputData_mt1,selectCutOff);

% save outputData to mat file
save([saveDir,'/coatingData_mt1.mat'],'coatingData_mt1')

%% load line scan data and compute for mt2

% import MT naked and TPX2 height measurements from txt files for MTs 1, 2,
% 3 from 2019 07 16
run('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis/loadMtHeightData_mt_123_20190716.m')

% get path to save data in
[saveDir]=fileparts(filename);






%%
% fxn starts

% remove nan terms from line scans (occurs b.c. not all line scans are same
% length)
h1_naked(isnan(h1_naked))=[];
h1_bg_naked(isnan(h1_bg_naked))=[];
h1_tpx2(isnan(h1_tpx2))=[];
h1_bg_tpx2(isnan(h1_bg_tpx2))=[];

% let user select cut off for removing schmutz in bg line scan
if selectCutOff
    figure; plot(h1_bg_naked)
    [~,yibgn]=ginput(1);
    % save([saveDir,'/yibgn.mat'],'yibgn')
    hold on;
    plot(h1_bg_naked)
    pause;
end

% remove schmutz
h1_bg_naked(h1_bg_naked>yi1bgn)=[];

% get average mt height in nanometers
mt1_naked=(mean(h1_naked)-mean(h1_bg_naked))*1e9;

% propagate error for naked mt height measurement
errMt1 = mtHeightErrorProp(h1_naked,h1_bg_naked);

% let user select cut off for removing schmutz in bg line scan
if selectCutOff
    figure; plot(h1_bg_tpx2)
    [~,yi1bgtp]=ginput(1);
    %save('yi1bgtp.mat','yi1bgtp')
    hold on;
    plot(h1_bg_naked)
    pause;
end

% remove schmutz from tpx2 bg line scan
h1_bg_tpx2(h1_bg_tpx2>yi1bgtp)=[];

% get average height of coated mt from line scan
mt1_tpx2=(mean(h1_tpx2)-mean(h1_bg_tpx2))*1e9;

% propagate error for tpx2 coated mt
errMt1_tpx2 = mtHeightErrorProp(h1_tpx2,h1_bg_tpx2);

% get measurement of film thickness
film_mt1 = mt1_tpx2-mt1_naked;

% get error of film thickness measurement
errFilm_mt1 = mtFilmErrorProp(errMt1,errMt1_tpx2);

% get measurement of ratio (s/a)
filmRatio_mt1 = (mt1_naked/2)/((mt1_tpx2-mt1_naked)+(mt1_naked/2));

% get the error of the ratio (s/a)
err_filmRatio_mt1 = mtFilmRatioErrorProp(errMt1_tpx2,errMt1,mt1_tpx2,mt1_naked);

% get the standard error of the wavelength
stdErrLmb_mt1 = std(1./maxF_all)/sqrt(length(maxF_all))/1e3;

% get the std dev of the wavelength
errLmb_mt1 = std(1./maxF_all)/1e3;

lmbRatio_mt1 = lmb_mt1/((mt1_tpx2-mt1_naked)+(mt1_naked/2));
[errLmbRatio_mt1] = mtLmb_a_RatioErrorProp(errMt1_tpx2,errLmb_mt1,mt1_tpx2,lmb_mt1,mt1_naked);



%%

x2_naked = mt123naked00228.x2;
h2_naked = mt123naked00228.y2;
h2_naked(isnan(h2_naked))=[];

x2_bg_naked = mt123naked00228.x3;
h2_bg_naked = mt123naked00228.y3;
h2_bg_naked(isnan(h2_bg_naked))=[];

% figure; plot(h2_bg_naked)
% %[xi2bgn,yi2bgn]=ginput(1);
% %save('yi2bgn.mat','yi2bgn')
% load('../data/2019 07 16/expt1/Stack_225-261/yi2bgn.mat')
% h2_bg_naked(h2_bg_naked>yi2bgn)=[];
% hold on;
% plot(h2_bg_naked)

%%

x3_naked = mt123naked00228.x4;
h3_naked = mt123naked00228.y4;
h3_naked(isnan(h3_naked))=[];

x3_bg_naked = mt123naked00228.x5;
h3_bg_naked = mt123naked00228.y5;
h3_bg_naked(isnan(h3_bg_naked))=[];

% figure; plot(h3_bg_naked)
% load('../data/2019 07 16/expt1/Stack_225-261/yi3bgn.mat')
% % %[xi3bgn,yi3bgn]=ginput(1);
% % %save('yi3bgn.mat','yi3bgn')
% h3_bg_naked(h3_bg_naked>yi3bgn)=[];
% % hold on;
% plot(h3_bg_naked)

%%

x4_naked = mt4naked00067.x;
h4_naked = mt4naked00067.y;
h4_naked(isnan(h4_naked))=[];

x4_bg_naked = mt4naked00067.x1;
h4_bg_naked = mt4naked00067.y1;
h4_bg_naked(isnan(h4_bg_naked))=[];

% figure; plot(h4_bg_naked)
% correct for debris in background line scan
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/yi4bgn.mat')
%[xi4bgn,yi4bgn]=ginput(1);
%save('yi4bgn.mat','yi4bgn')
h4_bg_naked(h4_bg_naked>yi4bgn)=[];
% hold on;
% plot(h4_bg_naked)

%% find S.D. for height measurements using error propagation

mt1_naked=(mean(h1_naked)-mean(h1_bg_naked))*1e9;
errMt1 = mtHeightErrorProp(h1_naked,h1_bg_naked);

mt2_naked=(mean(h2_naked)-mean(h2_bg_naked))*1e9;
errMt2 = mtHeightErrorProp(h2_naked,h2_bg_naked);

mt3_naked=(mean(h3_naked)-mean(h3_bg_naked))*1e9;
errMt3 = mtHeightErrorProp(h3_naked,h3_bg_naked);

mt4_naked=(mean(h4_naked)-mean(h4_bg_naked))*1e9;
errMt4 = mtHeightErrorProp(h4_naked,h4_bg_naked);

%%

x1_tpx2 = mt123tpx200231.x;
h1_tpx2 = mt123tpx200231.y;
h1_tpx2(isnan(h1_tpx2))=[];
 
x1_bg_tpx2 = mt123tpx200231.x1;
h1_bg_tpx2 = mt123tpx200231.y1;
h1_bg_tpx2(isnan(h1_bg_tpx2))=[];

% figure; plot(h1_bg_tpx2)
%[xi1bgtp,yi1bgtp]=ginput(1);
%save('yi1bgtp.mat','yi1bgtp')
% correct for peaks in bg line scan
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi1bgtp.mat')
h1_bg_tpx2(h1_bg_tpx2>yi1bgtp)=[];
% hold on;
% plot(h1_bg_tpx2)
%%
 
x2_tpx2 = mt123tpx200231.x2;
h2_tpx2 = mt123tpx200231.y2;
h2_tpx2(isnan(h2_tpx2))=[];
 
x2_bg_tpx2 = mt123tpx200231.x3;
h2_bg_tpx2 = mt123tpx200231.y3;
h2_bg_tpx2(isnan(h2_bg_tpx2))=[];

% figure; plot(h2_bg_tpx2)
%[xi2bgtp,yi2bgtp]=ginput(1);
%save('yi2bgtp.mat','yi2bgtp')
% correct for peaks in bg line scan
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi2bgtp.mat')
h2_bg_tpx2(h2_bg_tpx2>yi2bgtp)=[];
% hold on;
% plot(h2_bg_tpx2)

%%
 
x3_tpx2 = mt123tpx200231.x4;
h3_tpx2 = mt123tpx200231.y4;
h3_tpx2(isnan(h3_tpx2))=[];
 
x3_bg_tpx2 = mt123tpx200231.x5;
h3_bg_tpx2 = mt123tpx200231.y5;
h3_bg_tpx2(isnan(h3_bg_tpx2))=[];

% figure; plot(h3_bg_tpx2)
%[xi3bgtp,yi3bgtp]=ginput(1);
% correct for peaks in bg line scan
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/yi3bgtp.mat')
h3_bg_tpx2(h3_bg_tpx2>yi3bgtp)=[];
%save('yi3bgtp.mat','yi3bgtp')
% hold on;
% plot(h3_bg_tpx2)

%%

x4_tpx2 = mt45tpx200070.x2;
h4_tpx2 = mt45tpx200070.y2;
h4_tpx2(isnan(h4_tpx2))=[];
 
x4_bg_tpx2 = mt45tpx200070.x3;
h4_bg_tpx2 = mt45tpx200070.y3;
h4_bg_tpx2(isnan(h4_bg_tpx2))=[];
 
% figure; plot(h4_bg_tpx2)
% %[xi4bgtp,yi4bgtp]=ginput(1);
% load('../data/2019 07 13/Stack_tpx2_20190713_68-89/yi4bgtp.mat')
% h4_bg_tpx2(h4_bg_tpx2>yi4bgtp)=[];
% %save('yi4bgtp.mat','yi4bgtp')
% hold on;
% plot(h4_bg_tpx2)

%%

x5_tpx2 = mt45tpx200070.x;
h5_tpx2 = mt45tpx200070.y;
h5_tpx2(isnan(h5_tpx2))=[];
 
x5_bg_tpx2 = mt45tpx200070.x1;
h5_bg_tpx2 = mt45tpx200070.y1;
h5_bg_tpx2(isnan(h5_bg_tpx2))=[];
 
% figure; plot(h5_bg_tpx2)
%[xi5bgtp,yi5bgtp]=ginput(1);
% correct for peaks in bg line scan
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/yi5bgtp.mat')
h5_bg_tpx2(h5_bg_tpx2>yi5bgtp)=[];
%save('yi5bgtp.mat','yi5bgtp')
% hold on;
% plot(h5_bg_tpx2)

%%

mt1_tpx2=(mean(h1_tpx2)-mean(h1_bg_tpx2))*1e9;
errMt1_tpx2 = mtHeightErrorProp(h1_tpx2,h1_bg_tpx2);
 
mt2_tpx2=(mean(h2_tpx2)-mean(h2_bg_tpx2))*1e9;
errMt2_tpx2 = mtHeightErrorProp(h2_tpx2,h2_bg_tpx2);
 
mt3_tpx2=(mean(h3_tpx2)-mean(h3_bg_tpx2))*1e9;
errMt3_tpx2 = mtHeightErrorProp(h3_tpx2,h3_bg_tpx2);

mt4_tpx2=(mean(h4_tpx2)-mean(h4_bg_tpx2))*1e9;
errMt4_tpx2 = mtHeightErrorProp(h4_tpx2,h4_bg_tpx2);

mt5_tpx2=(mean(h5_tpx2)-mean(h5_bg_tpx2))*1e9;
errMt5_tpx2 = mtHeightErrorProp(h5_tpx2,h5_bg_tpx2);


%%
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

film_mt2 = mt2_tpx2-mt2_naked;
filmRatio_mt2 = (mt2_naked/2)/((mt2_tpx2-mt2_naked)+(mt2_naked/2));
err_filmRatio_mt2 = mtFilmRatioErrorProp(errMt2_tpx2,errMt2,mt2_tpx2,mt2_naked);

errFilm_mt2 = mtFilmErrorProp(errMt2,errMt2_tpx2);
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-215_cy_mt-y-287-232/spacing_c_cx_mt-x-112-215_cy_mt-y-287-232.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/spacing_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
lmb_mt2 = spacing;
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-215_cy_mt-y-287-232/maxFrequencies_c_cx_mt-x-112-215_cy_mt-y-287-232.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/maxFrequencies_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
errLmb_mt2 = std(1./maxF_all)/sqrt(length(maxF_all))/1e3;

lmbRatio_mt2 = lmb_mt2/((mt2_tpx2-mt2_naked)+(mt2_naked/2));
[errLmbRatio_mt2] = mtLmb_a_RatioErrorProp(errMt2_tpx2,errLmb_mt2,mt2_tpx2,lmb_mt2,mt2_naked);

clear spacing
clear maxF_all

film_mt3 = mt3_tpx2-mt3_naked;
filmRatio_mt3 = (mt3_naked/2)/((mt3_tpx2-mt3_naked)+(mt3_naked/2));
err_filmRatio_mt3 = mtFilmRatioErrorProp(errMt3_tpx2,errMt3,mt3_tpx2,mt3_naked);

errFilm_mt3 = mtFilmErrorProp(errMt3,errMt3_tpx2);
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-224-190_cy_mt-y-240-286/spacing_c_cx_mt-x-224-190_cy_mt-y-240-286.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/spacing_c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
lmb_mt3 = spacing;
%load('../data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-224-190_cy_mt-y-240-286/maxFrequencies_c_cx_mt-x-224-190_cy_mt-y-240-286.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/maxFrequencies_c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
errLmb_mt3 = std(1./maxF_all)/sqrt(length(maxF_all))/1e3;

lmbRatio_mt3 = lmb_mt3/((mt3_tpx2-mt3_naked)+(mt3_naked/2));
[errLmbRatio_mt3] = mtLmb_a_RatioErrorProp(errMt3_tpx2,errLmb_mt3,mt3_tpx2,lmb_mt3,mt3_naked);

clear spacing
clear maxF_all

film_mt4 = mt4_tpx2-mt4_naked;
filmRatio_mt4 = (mt4_naked/2)/((mt4_tpx2-mt4_naked)+(mt4_naked/2));
err_filmRatio_mt4 = mtFilmRatioErrorProp(errMt4_tpx2,errMt4,mt4_tpx2,mt4_naked);

errFilm_mt4 = mtFilmErrorProp(errMt4,errMt4_tpx2);
%load('../data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-148-179_cy_mt-y-285-238/spacing_c_cx_mt-x-148-179_cy_mt-y-285-238.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/spacing_c_cx_mt-x-180-144_cy_mt-y-234-287.mat')
lmb_mt4 = spacing;
%load('../data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-148-179_cy_mt-y-285-238/maxFrequencies_c_cx_mt-x-148-179_cy_mt-y-285-238.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/maxFrequencies_c_cx_mt-x-180-144_cy_mt-y-234-287.mat')
errLmb_mt4 = std(1./maxF_all)/sqrt(length(maxF_all))/1e3;

lmbRatio_mt4 = lmb_mt4/((mt4_tpx2-mt4_naked)+(mt4_naked/2));
[errLmbRatio_mt4] = mtLmb_a_RatioErrorProp(errMt4_tpx2,errLmb_mt4,mt4_tpx2,lmb_mt4,mt4_naked);

clear spacing
clear maxF_all

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

%% make figure

% set to 1 if saving figures
doSave = 0;

h = filmHeight.e01;
lmb = wavelength.e01;%*1e3;
figure; hold on;
xafz = 14;
yafz = 14;
tvfz = 12;

tpData = 'k^';
tpLw = 1.5;
grid off
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

%%{
plot(h,lmb,'o-','LineWidth',2)
errorbar(film_mt1,lmb_mt1/1e3,stdErrLmb_mt1,stdErrLmb_mt1,errFilm_mt1,errFilm_mt1,tpData,'LineWidth',tpLw)
errorbar(film_mt2,lmb_mt2/1e3,errLmb_mt2,errLmb_mt2,errFilm_mt2,errFilm_mt2,tpData,'LineWidth',tpLw)
errorbar(film_mt3,lmb_mt3/1e3,errLmb_mt3,errLmb_mt3,errFilm_mt3,errFilm_mt3,tpData,'LineWidth',tpLw)
errorbar(film_mt4,lmb_mt4/1e3,errLmb_mt4,errLmb_mt4,errFilm_mt4,errFilm_mt4,tpData,'LineWidth',tpLw)
errorbar(film_mt5,lmb_mt5/1e3,errLmb_mt5,errLmb_mt5,errFilm_mt5,errFilm_mt5,tpData,'LineWidth',tpLw)
errorbar(film_mt6,lmb_mt6/1e3,errLmb_mt6,errLmb_mt6,errFilm_mt6,errFilm_mt6,tpData,'LineWidth',tpLw)
%plot(mean([film_mt1 film_mt3 film_mt3 film_mt4 film_mt5 film_mt6]),229,'bo')
xlim([0 25])
ylim([0 .5])

legend('f(h = a-s) = \lambda_{max}','TPX2 coated MT')
legend('boxoff')
simplePlotFormat( 'Film thickness (nm)', '\lambda_{RP} (\mum)', xafz, yafz, tvfz )
box on

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,['predicted and measured wavelength vs film thickness'])
    
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
end
%}




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




