function [outputData] = fxn_mtFilmAndRatioCalc(inputData,selectCutOff)
%fxn_mtFilmAndRatioCalc.m - fxn that calculates film thickness, ratio, and
%propagated error for these
% Sagar Setru
% 2019 10 22

%% load input data

% load input data for naked mt
h_naked = inputData.h_naked;
h_bg_naked = inputData.h_bg_naked;

% laod input data for tpx2 coated mt
h_tpx2 = inputData.h_tpx2;
h_bg_tpx2 = inputData.h_bg_tpx2;


% load input data from fourier analysis
lmb = inputData.lmb;
maxF_all = inputData.maxF_all;

% remove nan terms from line scans (occurs b.c. not all line scans are same
% length)
h_naked(isnan(h_naked))=[];
h_bg_naked(isnan(h_bg_naked))=[];
h_tpx2(isnan(h_tpx2))=[];
h_bg_tpx2(isnan(h_bg_tpx2))=[];

% let user select cut off for removing schmutz in bg line scan
if selectCutOff
    
    disp('Select threshold for background naked line scan')
    figure; plot(h_bg_naked)
    [~,yibgn]=ginput(1);
    % save([saveDir,'/yibgn.mat'],'yibgn')
    hold on;
    plot(h_bg_naked)
    pause;
    
else
    
    yibgn = inputData.yibgn;
    
end
close all

% remove schmutz
h_bg_naked(h_bg_naked>yibgn)=[];

% get average mt height in nanometers
mt_naked=(mean(h_naked)-mean(h_bg_naked))*1e9;

% propagate error for naked mt height measurement
errMt_naked = mtHeightErrorProp(h_naked,h_bg_naked);

% let user select cut off for removing schmutz in bg line scan
if selectCutOff
    
    figure; plot(h_bg_tpx2)
    disp('Select threshold for background coated line scan')
    [~,yibgtp]=ginput(1);
    %save('yi1bgtp.mat','yi1bgtp')
    hold on;
    plot(h_bg_naked)
    pause;
    
else
    
    yibgtp = inputData.yibgtp;
    
end
close all;

% remove schmutz from tpx2 bg line scan
h_bg_tpx2(h_bg_tpx2>yibgtp)=[];

% get average height of coated mt from line scan
mt_tpx2=(mean(h_tpx2)-mean(h_bg_tpx2))*1e9;

% propagate error for tpx2 coated mt
errMt_tpx2 = mtHeightErrorProp(h_tpx2,h_bg_tpx2);

% get measurement of film thickness
film = mt_tpx2-mt_naked;

% get error of film thickness measurement
errFilm = sqrt( errMt_naked.^2 + errMt_tpx2.^2 );

% get measurement of ratio (s/a, and a/s)
s_over_a = (mt_naked/2)/((mt_tpx2-mt_naked)+(mt_naked/2));
a_over_s = s_over_a^-1;

% get the error of the ratio (s/a)
err_s_over_a = mtFilmRatioErrorProp_s_over_a(errMt_tpx2,errMt_naked,mt_tpx2,mt_naked);

% get the error of the ratio a/s
err_a_over_s = mtFilmRatioErrorProp_a_over_s(errMt_tpx2,errMt_naked,mt_tpx2,mt_naked);

% get the standard error of the wavelength
stdErrLmb = std(1./maxF_all)/sqrt(length(maxF_all))/1e3;

% get the std dev of the wavelength
errLmb = std(1./maxF_all)/1e3;

% get the ratio lambda/a
lmb_over_a = lmb/((mt_tpx2-mt_naked)+(mt_naked/2));

% get the propagated error for the ratio lambda/a
errLmb_over_a = mtLmb_a_RatioErrorProp(errMt_tpx2,errLmb,mt_tpx2,lmb,mt_naked);

% get the propagated error for the ratio lambda/s
errLmb_over_s = mtLmb_s_RatioErrorProp(errMt_naked,errLmb,mt_naked,lmb);

if selectCutOff
    outputData.yibgn = yibgn;
    outputData.yibgtp = yibgtp;
end


% load outputs into data structure

outputData.film = film;
outputData.errFilm = errFilm;

outputData.s_over_a = s_over_a;
outputData.a_over_s = a_over_s;

outputData.err_s_over_a = err_s_over_a;
outputData.err_a_over_s = err_a_over_s;

outputData.stdErrLmb = stdErrLmb;

outputData.lmb_over_a = lmb_over_a;
outputData.errLmb_over_a = errLmb_over_a;
outputData.errLmb_over_s = errLmb_over_s;

outputData.yibgn = yibgn;
outputData.yibgtp = yibgtp;

outputData.lmb = lmb;

end

