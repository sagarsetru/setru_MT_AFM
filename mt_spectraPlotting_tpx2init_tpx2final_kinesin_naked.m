% Sagar Setru
% 2019 09 27 

% Change the current folder to the folder of this m-file
% add to path
addpath(genpath(pwd))

%% load naked MT, kinesin and tpx2 (init and final) spectra

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_nakedMT_20190715_137-143/c_cx_mt-x-182-148_cy_mt-y-82-156/avgSpectra_c_cx_mt-x-182-148_cy_mt-y-82-156.mat')
avgSpectra_naked_1 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_nakedMT_20190715_137-143/c_cx_mt-x-182-148_cy_mt-y-82-156/stdSpectra_c_cx_mt-x-182-148_cy_mt-y-82-156.mat')
stdSpectra_naked_1 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_nakedMT_20190715_137-143/c_cx_mt-x-182-148_cy_mt-y-82-156/spectra_c_cx_mt-x-182-148_cy_mt-y-82-156.mat')
n_naked_1 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_nakedMT_20190715_137-143/c_cx_mt-x-182-148_cy_mt-y-82-156/frequencies_c_cx_mt-x-182-148_cy_mt-y-82-156.mat')
f_naked_1 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/c_cx_mt-x-458-522_cy_mt-y-452-494/avgSpectra_c_cx_mt-x-458-522_cy_mt-y-452-494.mat')
avgSpectra_naked_2 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/c_cx_mt-x-458-522_cy_mt-y-452-494/stdSpectra_c_cx_mt-x-458-522_cy_mt-y-452-494.mat')
stdSpectra_naked_2 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/c_cx_mt-x-458-522_cy_mt-y-452-494/spectra_c_cx_mt-x-458-522_cy_mt-y-452-494.mat')
n_naked_2 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/c_cx_mt-x-458-522_cy_mt-y-452-494/frequencies_c_cx_mt-x-458-522_cy_mt-y-452-494.mat')
f_naked_2 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/xc2yc2_c_cx_mt-x-432-492_cy_mt-y-516-496/avgSpectra_c_cx_mt-x-432-492_cy_mt-y-516-496.mat')
avgSpectra_naked_3 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/xc2yc2_c_cx_mt-x-432-492_cy_mt-y-516-496/stdSpectra_c_cx_mt-x-432-492_cy_mt-y-516-496.mat')
stdSpectra_naked_3 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/xc2yc2_c_cx_mt-x-432-492_cy_mt-y-516-496/spectra_c_cx_mt-x-432-492_cy_mt-y-516-496.mat')
n_naked_3 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/xc2yc2_c_cx_mt-x-432-492_cy_mt-y-516-496/frequencies_c_cx_mt-x-432-492_cy_mt-y-516-496.mat')
f_naked_3 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/avgSpectra_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
avgSpectra_kin_1 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/stdSpectra_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
stdSpectra_kin_1 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/spectra_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
n_kin_1 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/frequencies_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
f_kin_1=f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-93-182_cy_mt-y-176-150/avgSpectra_c_cx_mt-x-93-182_cy_mt-y-176-150.mat')
avgSpectra_kin_2 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-93-182_cy_mt-y-176-150/stdSpectra_c_cx_mt-x-93-182_cy_mt-y-176-150.mat')
stdSpectra_kin_2 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-93-182_cy_mt-y-176-150/spectra_c_cx_mt-x-93-182_cy_mt-y-176-150.mat')
n_kin_2 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-93-182_cy_mt-y-176-150/frequencies_c_cx_mt-x-93-182_cy_mt-y-176-150.mat')
f_kin_2 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt2/Stack_kinesin_2019 07 16_expt2_298-300/c_cx_mt-x-192-322_cy_mt-y-134-253/avgSpectra_c_cx_mt-x-192-322_cy_mt-y-134-253.mat')
avgSpectra_kin_3 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt2/Stack_kinesin_2019 07 16_expt2_298-300/c_cx_mt-x-192-322_cy_mt-y-134-253/stdSpectra_c_cx_mt-x-192-322_cy_mt-y-134-253.mat')
stdSpectra_kin_3 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt2/Stack_kinesin_2019 07 16_expt2_298-300/c_cx_mt-x-192-322_cy_mt-y-134-253/spectra_c_cx_mt-x-192-322_cy_mt-y-134-253.mat')
n_kin_3 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt2/Stack_kinesin_2019 07 16_expt2_298-300/c_cx_mt-x-192-322_cy_mt-y-134-253/frequencies_c_cx_mt-x-192-322_cy_mt-y-134-253.mat')
f_kin_3 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




%load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/avgSpectra_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/avgSpectra_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')
avgSpectra_tpx2_1 = avgSpectra;

%load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/stdSpectra_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/stdSpectra_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')
stdSpectra_tpx2_1 = stdSpectra;

%load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/spectra_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/spectra_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')
n_tpx2_1 = size(P1s,2);

%load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/frequencies_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/frequencies_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')
f_tpx2_1 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-69-187_cy_mt-y-66-145/avgSpectra_c_cx_mt-x-69-187_cy_mt-y-66-145.mat')
avgSpectra_tpx2_1i = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-69-187_cy_mt-y-66-145/stdSpectra_c_cx_mt-x-69-187_cy_mt-y-66-145.mat')
stdSpectra_tpx2_1i = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-69-187_cy_mt-y-66-145/spectra_c_cx_mt-x-69-187_cy_mt-y-66-145.mat')
n_tpx2_1i = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-69-187_cy_mt-y-66-145/frequencies_c_cx_mt-x-69-187_cy_mt-y-66-145.mat')
f_tpx2_1i = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/avgSpectra_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
avgSpectra_tpx2_2 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/stdSpectra_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
stdSpectra_tpx2_2 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/spectra_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
n_tpx2_2 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/frequencies_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
f_tpx2_2 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-168-229_cy_mt-y-256-222/avgSpectra_c_cx_mt-x-168-229_cy_mt-y-256-222.mat')
avgSpectra_tpx2_2i = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-168-229_cy_mt-y-256-222/stdSpectra_c_cx_mt-x-168-229_cy_mt-y-256-222.mat')
stdSpectra_tpx2_2i = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-168-229_cy_mt-y-256-222/spectra_c_cx_mt-x-168-229_cy_mt-y-256-222.mat')
n_tpx2_2i = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-168-229_cy_mt-y-256-222/frequencies_c_cx_mt-x-168-229_cy_mt-y-256-222.mat')
f_tpx2_2i = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



%%{
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/avgSpectra_c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
avgSpectra_tpx2_3 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/stdSpectra_c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
stdSpectra_tpx2_3 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/spectra_c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
n_tpx2_3 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236/frequencies_c_cx_mt-x-189-228_cy_mt-y-287-236.mat')
f_tpx2_3 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f
%}

%{
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-224-190_cy_mt-y-240-286/avgSpectra_c_cx_mt-x-224-190_cy_mt-y-240-286.mat')
avgSpectra_tpx2_3 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-224-190_cy_mt-y-240-286/stdSpectra_c_cx_mt-x-224-190_cy_mt-y-240-286.mat')
stdSpectra_tpx2_3 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-224-190_cy_mt-y-240-286/spectra_c_cx_mt-x-224-190_cy_mt-y-240-286.mat')
n_tpx2_3 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-224-190_cy_mt-y-240-286/frequencies_c_cx_mt-x-224-190_cy_mt-y-240-286.mat')
f_tpx2_3 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f
%}


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132/avgSpectra_c_cx_mt-x-219-209_cy_mt-y-3-132.mat')
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-218-197_cy_mt-y-7-250/avgSpectra_c_cx_mt-x-218-197_cy_mt-y-7-250.mat')
avgSpectra_tpx2_4 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132/stdSpectra_c_cx_mt-x-219-209_cy_mt-y-3-132.mat')
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-218-197_cy_mt-y-7-250/stdSpectra_c_cx_mt-x-218-197_cy_mt-y-7-250.mat')
stdSpectra_tpx2_4 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132/spectra_c_cx_mt-x-219-209_cy_mt-y-3-132.mat')
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-218-197_cy_mt-y-7-250/spectra_c_cx_mt-x-218-197_cy_mt-y-7-250.mat')
n_tpx2_4 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132/frequencies_c_cx_mt-x-219-209_cy_mt-y-3-132.mat')
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-218-197_cy_mt-y-7-250/frequencies_c_cx_mt-x-218-197_cy_mt-y-7-250.mat')
f_tpx2_4 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-148-179_cy_mt-y-285-238/avgSpectra_c_cx_mt-x-148-179_cy_mt-y-285-238.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/avgSpectra_c_cx_mt-x-180-144_cy_mt-y-234-287.mat')
avgSpectra_tpx2_5 = avgSpectra;

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-148-179_cy_mt-y-285-238/stdSpectra_c_cx_mt-x-148-179_cy_mt-y-285-238.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/stdSpectra_c_cx_mt-x-180-144_cy_mt-y-234-287.mat')
stdSpectra_tpx2_5 = stdSpectra;

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-148-179_cy_mt-y-285-238/spectra_c_cx_mt-x-148-179_cy_mt-y-285-238.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/spectra_c_cx_mt-x-180-144_cy_mt-y-234-287.mat')
n_tpx2_5 = size(P1s,2);

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-148-179_cy_mt-y-285-238/frequencies_c_cx_mt-x-148-179_cy_mt-y-285-238.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287/frequencies_c_cx_mt-x-180-144_cy_mt-y-234-287.mat')
f_tpx2_5 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-146-180_cy_mt-y-285-231/avgSpectra_c_cx_mt-x-146-180_cy_mt-y-285-231.mat')
avgSpectra_tpx2_5i = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-146-180_cy_mt-y-285-231/stdSpectra_c_cx_mt-x-146-180_cy_mt-y-285-231.mat')
stdSpectra_tpx2_5i = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-146-180_cy_mt-y-285-231/spectra_c_cx_mt-x-146-180_cy_mt-y-285-231.mat')
n_tpx2_5i = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-146-180_cy_mt-y-285-231/frequencies_c_cx_mt-x-146-180_cy_mt-y-285-231.mat')
f_tpx2_5i = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-178-115_cy_mt-y-119-94/avgSpectra_c_cx_mt-x-178-115_cy_mt-y-119-94.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117/avgSpectra_c_cx_mt-x-114-179_cy_mt-y-92-117.mat')
avgSpectra_tpx2_6 = avgSpectra;

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-178-115_cy_mt-y-119-94/stdSpectra_c_cx_mt-x-178-115_cy_mt-y-119-94.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117/stdSpectra_c_cx_mt-x-114-179_cy_mt-y-92-117.mat')
stdSpectra_tpx2_6 = stdSpectra;

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-178-115_cy_mt-y-119-94/spectra_c_cx_mt-x-178-115_cy_mt-y-119-94.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117/spectra_c_cx_mt-x-114-179_cy_mt-y-92-117.mat')
n_tpx2_6 = size(P1s,2);

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-178-115_cy_mt-y-119-94/frequencies_c_cx_mt-x-178-115_cy_mt-y-119-94.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117/frequencies_c_cx_mt-x-114-179_cy_mt-y-92-117.mat')
f_tpx2_6 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-172_cy_mt-y-93-116/avgSpectra_c_cx_mt-x-114-172_cy_mt-y-93-116.mat')
avgSpectra_tpx2_6i = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-172_cy_mt-y-93-116/stdSpectra_c_cx_mt-x-114-172_cy_mt-y-93-116.mat')
stdSpectra_tpx2_6i = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-172_cy_mt-y-93-116/spectra_c_cx_mt-x-114-172_cy_mt-y-93-116.mat')
n_tpx2_6i = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-172_cy_mt-y-93-116/frequencies_c_cx_mt-x-114-172_cy_mt-y-93-116.mat')
f_tpx2_6i = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f


%%

doSave = 0;

% define cutoff frequency for plotting
f_cutoff = .00099; %units nm^-1

% calculate the rayleigh-plateau wavelengths for the tpx2 scans

fInd_tpx2_1 = min(find(f_tpx2_1>f_cutoff));
maxAmplitude_tpx2_1 = max(avgSpectra_tpx2_1(:,fInd_tpx2_1:end));
maxF_tpx2_1 = f_tpx2_1(avgSpectra_tpx2_1==maxAmplitude_tpx2_1);
spacing_tpx2_1 = 1/maxF_tpx2_1;

fInd_tpx2_1i = min(find(f_tpx2_1i>f_cutoff));
maxAmplitude_tpx2_1i = max(avgSpectra_tpx2_1i(:,fInd_tpx2_1i:end));
maxF_tpx2_1i = f_tpx2_1i(avgSpectra_tpx2_1i==maxAmplitude_tpx2_1i);
spacing_tpx2_1i = 1/maxF_tpx2_1i;

fInd_tpx2_2 = min(find(f_tpx2_2>f_cutoff));
maxAmplitude_tpx2_2 = max(avgSpectra_tpx2_2(:,fInd_tpx2_2:end));
maxF_tpx2_2 = f_tpx2_2(avgSpectra_tpx2_2==maxAmplitude_tpx2_2);
spacing_tpx2_2 = 1/maxF_tpx2_2;

fInd_tpx2_2i = min(find(f_tpx2_2i>f_cutoff));
maxAmplitude_tpx2_2i = max(avgSpectra_tpx2_2i(:,fInd_tpx2_2i:end));
maxF_tpx2_2i = f_tpx2_2i(avgSpectra_tpx2_2i==maxAmplitude_tpx2_2i);
spacing_tpx2_2i = 1/maxF_tpx2_2i;

fInd_tpx2_3 = min(find(f_tpx2_3>f_cutoff));
maxAmplitude_tpx2_3 = max(avgSpectra_tpx2_3(:,fInd_tpx2_3:end));
maxF_tpx2_3 = f_tpx2_3(avgSpectra_tpx2_3==maxAmplitude_tpx2_3);
spacing_tpx2_3 = 1/maxF_tpx2_3;

fInd_tpx2_4 = min(find(f_tpx2_4>f_cutoff));
maxAmplitude_tpx2_4 = max(avgSpectra_tpx2_4(:,fInd_tpx2_4:end));
maxF_tpx2_4 = f_tpx2_4(avgSpectra_tpx2_4==maxAmplitude_tpx2_4);
spacing_tpx2_4 = 1/maxF_tpx2_4;

fInd_tpx2_5 = min(find(f_tpx2_5>f_cutoff));
maxAmplitude_tpx2_5 = max(avgSpectra_tpx2_5(:,fInd_tpx2_5:end));
maxF_tpx2_5 = f_tpx2_5(avgSpectra_tpx2_5==maxAmplitude_tpx2_5);
spacing_tpx2_5 = 1/maxF_tpx2_5;

fInd_tpx2_5i = min(find(f_tpx2_5i>f_cutoff));
maxAmplitude_tpx2_5i = max(avgSpectra_tpx2_5i(:,fInd_tpx2_5i:end));
maxF_tpx2_5i = f_tpx2_5i(avgSpectra_tpx2_5i==maxAmplitude_tpx2_5i);
spacing_tpx2_5i = 1/maxF_tpx2_5i;

fInd_tpx2_6 = min(find(f_tpx2_6>f_cutoff));
maxAmplitude_tpx2_6 = max(avgSpectra_tpx2_6(:,fInd_tpx2_6:end));
maxF_tpx2_6 = f_tpx2_6(avgSpectra_tpx2_6==maxAmplitude_tpx2_6);
spacing_tpx2_6 = 1/maxF_tpx2_6;

fInd_tpx2_6i = min(find(f_tpx2_6i>f_cutoff));
maxAmplitude_tpx2_6i = max(avgSpectra_tpx2_6i(:,fInd_tpx2_6i:end));
maxF_tpx2_6i = f_tpx2_6i(avgSpectra_tpx2_6i==maxAmplitude_tpx2_6i);
spacing_tpx2_6i = 1/maxF_tpx2_6i;

% define marker styles
tpx2_ms = ':';
tpx2_i_ms = ':';
kin_ms = ':';
naked_ms = ':';

% define colors
tpx2_c = [0, 0.5, 0];
tpx2_i_c = [0.5 , 0, 0];
kin_c = [0, 0, 1];
naked_c = [0.25, 0.25, 0.25];

% define linewidth
lw = 1.25;

% define marker, marker size, and linewidth for lambda rp
rp_m = '^';
rp_lw = 1;
rp_ms = 10;

figure; hold on; box on;
% do initial plotting for legends: tpx2, tpx2init, kinesin, naked microtubule

% tpx2 coated
errorbar(f_tpx2_1(fInd_tpx2_1:end),avgSpectra_tpx2_1(:,fInd_tpx2_1:end),stdSpectra_tpx2_1(:,fInd_tpx2_1:end)./sqrt(n_tpx2_1),tpx2_ms,'color',tpx2_c,'LineWidth',lw)

% tpx2 coated init
errorbar(f_tpx2_1i(fInd_tpx2_1i:end),avgSpectra_tpx2_1i(:,fInd_tpx2_1i:end),stdSpectra_tpx2_1i(:,fInd_tpx2_1i:end)./sqrt(n_tpx2_1i),tpx2_i_ms,'color',tpx2_i_c,'LineWidth',lw)

% kinesin coated
fInd_kin_1 = min(find(f_kin_1>f_cutoff));
errorbar(f_kin_1(fInd_kin_1:end),avgSpectra_kin_1(:,fInd_kin_1:end),stdSpectra_kin_1(:,fInd_kin_1:end)./sqrt(n_kin_1),kin_ms,'color',kin_c,'LineWidth',lw)

% naked microtubule
fInd_naked_1 = min(find(f_naked_1>f_cutoff));
errorbar(f_naked_1(fInd_naked_1:end),avgSpectra_naked_1(:,fInd_naked_1:end),stdSpectra_naked_1(:,fInd_naked_1:end)./sqrt(n_naked_1),naked_ms,'color',naked_c,'LineWidth',lw)

% plot each rayleigh plateau wavelength on the relevant MTs
plot(maxF_tpx2_1,maxAmplitude_tpx2_1,rp_m,'MarkerSize',rp_ms,'LineWidth',rp_lw)
plot(maxF_tpx2_2,maxAmplitude_tpx2_2,rp_m,'MarkerSize',rp_ms,'LineWidth',rp_lw)
plot(maxF_tpx2_3,maxAmplitude_tpx2_3,rp_m,'MarkerSize',rp_ms,'LineWidth',rp_lw)
plot(maxF_tpx2_4,maxAmplitude_tpx2_4,rp_m,'MarkerSize',rp_ms,'LineWidth',rp_lw)
plot(maxF_tpx2_5,maxAmplitude_tpx2_5,rp_m,'MarkerSize',rp_ms,'color',[0.3010, 0.7450, 0.9330],'LineWidth',rp_lw)
plot(maxF_tpx2_6,maxAmplitude_tpx2_6,rp_m,'MarkerSize',rp_ms,'color',[0.6350, 0.0780, 0.1840],'LineWidth',rp_lw)

% plot other kinesin
fInd_kin_3 = min(find(f_kin_3>f_cutoff));
errorbar(f_kin_3(fInd_kin_3:end),avgSpectra_kin_3(:,fInd_kin_3:end),stdSpectra_kin_3(:,fInd_kin_3:end)./sqrt(n_kin_3),kin_ms,'color',kin_c,'LineWidth',lw)

% plot other tpx2 initial coating mt spectra
errorbar(f_tpx2_2i(fInd_tpx2_2i:end),avgSpectra_tpx2_2i(:,fInd_tpx2_2i:end),stdSpectra_tpx2_2i(:,fInd_tpx2_2i:end)./sqrt(n_tpx2_2i),tpx2_i_ms,'color',tpx2_i_c,'LineWidth',lw)
errorbar(f_tpx2_5i(fInd_tpx2_5i:end),avgSpectra_tpx2_5i(:,fInd_tpx2_5i:end),stdSpectra_tpx2_5i(:,fInd_tpx2_5i:end)./sqrt(n_tpx2_5i),tpx2_i_ms,'color',tpx2_i_c,'LineWidth',lw)
errorbar(f_tpx2_6i(fInd_tpx2_6i:end),avgSpectra_tpx2_6i(:,fInd_tpx2_6i:end),stdSpectra_tpx2_6i(:,fInd_tpx2_6i:end)./sqrt(n_tpx2_6i),tpx2_i_ms,'color',tpx2_i_c,'LineWidth',lw)


% plot the other tpx2 coated mt spectra
errorbar(f_tpx2_2(fInd_tpx2_2:end),avgSpectra_tpx2_2(:,fInd_tpx2_2:end),stdSpectra_tpx2_2(:,fInd_tpx2_2:end)./sqrt(n_tpx2_2),tpx2_ms,'color',tpx2_c,'LineWidth',lw)
errorbar(f_tpx2_3(fInd_tpx2_3:end),avgSpectra_tpx2_3(:,fInd_tpx2_3:end),stdSpectra_tpx2_3(:,fInd_tpx2_3:end)./sqrt(n_tpx2_3),tpx2_ms,'color',tpx2_c,'LineWidth',lw)
errorbar(f_tpx2_4(fInd_tpx2_4:end),avgSpectra_tpx2_4(:,fInd_tpx2_4:end),stdSpectra_tpx2_4(:,fInd_tpx2_4:end)./sqrt(n_tpx2_4),tpx2_ms,'color',tpx2_c,'LineWidth',lw)
errorbar(f_tpx2_5(fInd_tpx2_5:end),avgSpectra_tpx2_5(:,fInd_tpx2_5:end),stdSpectra_tpx2_5(:,fInd_tpx2_5:end)./sqrt(n_tpx2_5),tpx2_ms,'color',tpx2_c,'LineWidth',lw)
errorbar(f_tpx2_6(fInd_tpx2_6:end),avgSpectra_tpx2_6(:,fInd_tpx2_6:end),stdSpectra_tpx2_6(:,fInd_tpx2_6:end)./sqrt(n_tpx2_6),tpx2_ms,'color',tpx2_c,'LineWidth',lw)

% plot the other kinesin mt spectra
fInd_kin_2 = min(find(f_kin_2>f_cutoff));
errorbar(f_kin_2(fInd_kin_2:end),avgSpectra_kin_2(:,fInd_kin_2:end),stdSpectra_kin_2(:,fInd_kin_2:end)./sqrt(n_kin_2),kin_ms,'color',kin_c,'LineWidth',lw)

% plot the other naked mt spectra
fInd_naked_2 = min(find(f_naked_2>f_cutoff));
errorbar(f_naked_2(fInd_naked_2:end),avgSpectra_naked_2(:,fInd_naked_2:end),stdSpectra_naked_2(:,fInd_naked_2:end)./sqrt(n_naked_2),naked_ms,'color',naked_c,'LineWidth',lw)

fInd_naked_3 = min(find(f_naked_3>f_cutoff));
errorbar(f_naked_3(fInd_naked_3:end),avgSpectra_naked_3(:,fInd_naked_3:end),stdSpectra_naked_3(:,fInd_naked_3:end)./sqrt(n_naked_3),naked_ms,'color',naked_c,'LineWidth',lw)



set(gca, 'XScale','log')

legend('TPX2 after beading up',...
    'TPX2 upon initial coating',...
    'Kinesin-1',...
    'Naked MT',...
    ['\lambda_{RP} = ',num2str(round(spacing_tpx2_1)),' nm'],...
    ['\lambda_{RP} = ',num2str(round(spacing_tpx2_2)),' nm'],...
    ['\lambda_{RP} = ',num2str(round(spacing_tpx2_3)),' nm'],...
    ['\lambda_{RP} = ',num2str(round(spacing_tpx2_4)),' nm'],...
    ['\lambda_{RP} = ',num2str(round(spacing_tpx2_5)),' nm'],...
    ['\lambda_{RP} = ',num2str(round(spacing_tpx2_6)),' nm'])

legend('boxoff');

xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'f (nm^{-1})', 'Average |P(f)| +/- SEM', xafz, yafz, tvfz )

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,['amplitude spectra TPX2 final vs TPX2 init vs Kinesin1 vs Naked MT'])
end
%% average all tpx2 final spectra

fAll_tpx2 = [f_tpx2_1(fInd_tpx2_1:end),...
    f_tpx2_2(fInd_tpx2_2:end),...
    f_tpx2_3(fInd_tpx2_3:end),...
    f_tpx2_4(fInd_tpx2_4:end),...
    f_tpx2_5(fInd_tpx2_5:end),...
    f_tpx2_6(fInd_tpx2_6:end)];

fAll_tpx2 = sort(fAll_tpx2);
f_min_tpx2 = min(fAll_tpx2);
f_max_tpx2 = max(fAll_tpx2);

fLin_tpx2 = [f_min_tpx2:mean(diff(fAll_tpx2)):f_max_tpx2];
f1=f_tpx2_1(fInd_tpx2_1:end);
f2=f_tpx2_2(fInd_tpx2_2:end);
f3=f_tpx2_3(fInd_tpx2_3:end);
f4=f_tpx2_4(fInd_tpx2_4:end);
f5=f_tpx2_5(fInd_tpx2_5:end);
f6=f_tpx2_6(fInd_tpx2_6:end);

a1=avgSpectra_tpx2_1(:,fInd_tpx2_1:end);
a2=avgSpectra_tpx2_2(:,fInd_tpx2_2:end);
a3=avgSpectra_tpx2_3(:,fInd_tpx2_3:end);
a4=avgSpectra_tpx2_4(:,fInd_tpx2_4:end);
a5=avgSpectra_tpx2_5(:,fInd_tpx2_5:end);
a6=avgSpectra_tpx2_6(:,fInd_tpx2_6:end);

s1 = stdSpectra_tpx2_1(:,fInd_tpx2_1:end)./sqrt(n_tpx2_1);
s2 = stdSpectra_tpx2_2(:,fInd_tpx2_2:end)./sqrt(n_tpx2_2);
s3 = stdSpectra_tpx2_3(:,fInd_tpx2_3:end)./sqrt(n_tpx2_3);
s4 = stdSpectra_tpx2_4(:,fInd_tpx2_4:end)./sqrt(n_tpx2_4);
s5 = stdSpectra_tpx2_5(:,fInd_tpx2_5:end)./sqrt(n_tpx2_5);
s6 = stdSpectra_tpx2_6(:,fInd_tpx2_6:end)./sqrt(n_tpx2_6);

a1iTpx2 = interp1(f1(:),a1(:),fLin_tpx2(:),'linear','extrap');
a2iTpx2 = interp1(f2(:),a2(:),fLin_tpx2(:),'linear','extrap');
a3iTpx2 = interp1(f3(:),a3(:),fLin_tpx2(:),'linear','extrap');
a4iTpx2 = interp1(f4(:),a4(:),fLin_tpx2(:),'linear','extrap');
a5iTpx2 = interp1(f5(:),a5(:),fLin_tpx2(:),'linear','extrap');
a6iTpx2 = interp1(f6(:),a6(:),fLin_tpx2(:),'linear','extrap');

s1iTpx2 = interp1(f1(:),s1(:),fLin_tpx2(:),'linear','extrap');
s2iTpx2 = interp1(f2(:),s2(:),fLin_tpx2(:),'linear','extrap');
s3iTpx2 = interp1(f3(:),s3(:),fLin_tpx2(:),'linear','extrap');
s4iTpx2 = interp1(f4(:),s4(:),fLin_tpx2(:),'linear','extrap');
s5iTpx2 = interp1(f5(:),s5(:),fLin_tpx2(:),'linear','extrap');
s6iTpx2 = interp1(f6(:),s6(:),fLin_tpx2(:),'linear','extrap');

aMeanTpx2 = mean([a1iTpx2 a2iTpx2 a3iTpx2 a4iTpx2 a5iTpx2 a6iTpx2],2);
sMeanTpx2 = mean([s1iTpx2 s2iTpx2 s3iTpx2 s4iTpx2 s5iTpx2 s6iTpx2],2);

aMaxTpx2 = max(aMeanTpx2);
aMaxTpx2Ind = find(aMeanTpx2==aMaxTpx2);
fMaxTpx2 = fLin_tpx2(aMaxTpx2Ind);

%% average all tpx2 init spectra
 
fAll_tpx2i = [f_tpx2_1i(fInd_tpx2_1i:end),...
    f_tpx2_2i(fInd_tpx2_2i:end),...
    f_tpx2_5i(fInd_tpx2_5i:end),...
    f_tpx2_6i(fInd_tpx2_6i:end)];
 
fAll_tpx2i = sort(fAll_tpx2i);
f_min_tpx2i = min(fAll_tpx2i);
f_max_tpx2i = max(fAll_tpx2i);
 
fLin_tpx2i = [f_min_tpx2i:mean(diff(fAll_tpx2i)):f_max_tpx2i];
f1=f_tpx2_1i(fInd_tpx2_1i:end);
f2=f_tpx2_2i(fInd_tpx2_2i:end);
f5=f_tpx2_5i(fInd_tpx2_5i:end);
f6=f_tpx2_6i(fInd_tpx2_6i:end);
 
a1=avgSpectra_tpx2_1i(:,fInd_tpx2_1i:end);
a2=avgSpectra_tpx2_2i(:,fInd_tpx2_2i:end);
a5=avgSpectra_tpx2_5i(:,fInd_tpx2_5i:end);
a6=avgSpectra_tpx2_6i(:,fInd_tpx2_6i:end);
 
s1 = stdSpectra_tpx2_1i(:,fInd_tpx2_1i:end)./sqrt(n_tpx2_1i);
s2 = stdSpectra_tpx2_2i(:,fInd_tpx2_2i:end)./sqrt(n_tpx2_2i);
s5 = stdSpectra_tpx2_5i(:,fInd_tpx2_5i:end)./sqrt(n_tpx2_5i);
s6 = stdSpectra_tpx2_6i(:,fInd_tpx2_6i:end)./sqrt(n_tpx2_6i);
 
a1iTpx2i = interp1(f1(:),a1(:),fLin_tpx2(:),'linear','extrap');
a2iTpx2i = interp1(f2(:),a2(:),fLin_tpx2(:),'linear','extrap');
a5iTpx2i = interp1(f5(:),a5(:),fLin_tpx2(:),'linear','extrap');
a6iTpx2i = interp1(f6(:),a6(:),fLin_tpx2(:),'linear','extrap');
 
s1iTpx2i = interp1(f1(:),s1(:),fLin_tpx2(:),'linear','extrap');
s2iTpx2i = interp1(f2(:),s2(:),fLin_tpx2(:),'linear','extrap');
s5iTpx2i = interp1(f5(:),s5(:),fLin_tpx2(:),'linear','extrap');
s6iTpx2i = interp1(f6(:),s6(:),fLin_tpx2(:),'linear','extrap');
 
aMeanTpx2i = mean([a1iTpx2i a2iTpx2i a5iTpx2i a6iTpx2i],2);
sMeanTpx2i = mean([s1iTpx2i s2iTpx2i s5iTpx2i s6iTpx2i],2);

%% average all kin spectra

fAll_kin = [f_kin_1(fInd_kin_1:end),...
    f_kin_2(fInd_kin_2:end),...
    f_kin_3(fInd_kin_3:end)];
 
fAll_kin = sort(fAll_kin);
f_min_kin = min(fAll_kin);
f_max_kin = max(fAll_kin);
 
fLin_kin = [f_min_kin:mean(diff(fAll_kin)):f_max_kin];
f1=f_kin_1(fInd_kin_1:end);
f2=f_kin_2(fInd_kin_2:end);
f3=f_kin_3(fInd_kin_3:end);
 
a1=avgSpectra_kin_1(:,fInd_kin_1:end);
a2=avgSpectra_kin_2(:,fInd_kin_2:end);
a3=avgSpectra_kin_3(:,fInd_kin_3:end);
 
s1 = stdSpectra_kin_1(:,fInd_kin_1:end)./sqrt(n_kin_1);
s2 = stdSpectra_kin_2(:,fInd_kin_2:end)./sqrt(n_kin_2);
s3 = stdSpectra_kin_3(:,fInd_kin_3:end)./sqrt(n_kin_3);
 
a1ikin = interp1(f1(:),a1(:),fLin_kin(:),'linear','extrap');
a2ikin = interp1(f2(:),a2(:),fLin_kin(:),'linear','extrap');
a3ikin = interp1(f3(:),a3(:),fLin_kin(:),'linear','extrap');

s1ikin = interp1(f1(:),s1(:),fLin_kin(:),'linear','extrap');
s2ikin = interp1(f2(:),s2(:),fLin_kin(:),'linear','extrap');
s3ikin = interp1(f3(:),s3(:),fLin_kin(:),'linear','extrap');
 
aMeankin = mean([a1ikin a2ikin a3ikin],2);
sMeankin = mean([s1ikin s2ikin s3ikin],2);

%% average all naked spectra
 
fAll_naked = [f_naked_1(fInd_naked_1:end),...
    f_naked_2(fInd_naked_2:end),...
    f_naked_3(fInd_naked_3:end)];
 
fAll_naked = sort(fAll_naked);
f_min_naked = min(fAll_naked);
f_max_naked = max(fAll_naked);
 
fLin_naked = [f_min_naked:mean(diff(fAll_naked)):f_max_naked];
f1=f_naked_1(fInd_naked_1:end);
f2=f_naked_2(fInd_naked_2:end);
f3=f_naked_3(fInd_naked_3:end);
 
a1=avgSpectra_naked_1(:,fInd_naked_1:end);
a2=avgSpectra_naked_2(:,fInd_naked_2:end);
a3=avgSpectra_naked_3(:,fInd_naked_3:end);
 
s1 = stdSpectra_naked_1(:,fInd_naked_1:end)./sqrt(n_naked_1);
s2 = stdSpectra_naked_2(:,fInd_naked_2:end)./sqrt(n_naked_2);
s3 = stdSpectra_naked_3(:,fInd_naked_3:end)./sqrt(n_naked_3);
 
a1inaked = interp1(f1(:),a1(:),fLin_naked(:),'linear','extrap');
a2inaked = interp1(f2(:),a2(:),fLin_naked(:),'linear','extrap');
a3inaked = interp1(f3(:),a3(:),fLin_naked(:),'linear','extrap');
 
 
s1inaked = interp1(f1(:),s1(:),fLin_naked(:),'linear','extrap');
s2inaked = interp1(f2(:),s2(:),fLin_naked(:),'linear','extrap');
s3inaked = interp1(f3(:),s3(:),fLin_naked(:),'linear','extrap');
 
aMeannaked = mean([a1inaked a2inaked a3inaked],2);
sMeannaked = mean([s1inaked s2inaked s3inaked],2);


%%

doSave = 0;

lw = 1.2;

figure;

% plot avg wavelength pulled out of all data
plot(fMaxTpx2,aMaxTpx2,rp_m,'MarkerSize',rp_ms,'LineWidth',rp_lw)
hold on;

% plot average tpx2 final spectra
indMaxPlot = max(find(fLin_tpx2<10));
errorbar(fLin_tpx2(1:indMaxPlot),...
    aMeanTpx2(1:indMaxPlot),...
    sMeanTpx2(1:indMaxPlot),...
    'LineWidth',...
    lw)

% plot average tpx2 initial spectra
indMaxPlot = max(find(fLin_tpx2i<10));
errorbar(fLin_tpx2i(1:indMaxPlot),...
    aMeanTpx2i(1:indMaxPlot),...
    sMeanTpx2i(1:indMaxPlot),...
    'LineWidth',...
    lw)

% plot average kinesin spectra
indMaxPlot = max(find(fLin_kin<10));
errorbar(fLin_kin(1:indMaxPlot),...
    aMeankin(1:indMaxPlot),...
    sMeankin(1:indMaxPlot),...
    'LineWidth',...
    lw)

% plot average naked mt spectra
indMaxPlot = max(find(fLin_naked<.026));
errorbar(fLin_naked(1:indMaxPlot),...
    aMeannaked(1:indMaxPlot),...
    sMeannaked(1:indMaxPlot),...
    'LineWidth',...
    lw)

set(gca, 'XScale','log')

legend(['Avg. \lambda_{RP} = ',num2str(round( ((1/fMaxTpx2)/1e3)*100 )/100 ),' \mum'],...
    'TPX2 after beading up (n=6)',...
    'TPX2 upon initial coating (n=4)',...
    'Kinesin (n=3)',...
    'Naked MT (n=3)')

legend('boxoff');

xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'f (nm^{-1})', 'Average |P(f)| +/- average SEM', xafz, yafz, tvfz )

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,['avg amplitude spectra TPX2final TPX2init kinesin naked mt'])
end