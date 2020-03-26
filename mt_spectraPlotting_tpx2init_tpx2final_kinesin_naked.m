% Sagar Setru
% 2019 09 27 

% add to path
addpath(genpath('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis'))



%% load naked MT, kinesin, ct tpx2, and tpx2 (init and final) spectra

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

%%


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/avgSpectra_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
avgSpectra_kin_1 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/stdSpectra_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
stdSpectra_kin_1 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/spectra_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
n_kin_1 = size(P1s,2);
spectra_kin_1 = P1s;

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

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_26-28_20191108_rigidBody/c_cx_mt-x-6-140_cy_mt-y-72-135';
fNameStruct = loadSpectralDataFromDir(pathName);

load(fNameStruct.avgSpectra)
avgSpectra_kin_4 = avgSpectra/1e9;

load(fNameStruct.stdSpectra)
stdSpectra_kin_4 = stdSpectra/1e9;

load(fNameStruct.spectra)

if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_4 = size(P1s,2);
    spectra_kin_4 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_4 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_4 = f;

clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_26-28_20191108_rigidBody/c_cx_mt-x-95-145_cy_mt-y-1-86';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_5 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_5 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_5 = size(P1s,2);
    spectra_kin_5 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_5 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_5 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_29-31_20191108_rigidBody/c_cx_mt-x-6-181_cy_mt-y-149-232';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_6 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_6 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_6 = size(P1s,2);
    spectra_kin_6 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_6 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_6 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_29-31_20191108_rigidBody/c_cx_mt-x-138-255_cy_mt-y-2-202';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_7 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_7 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_7 = size(P1s,2);
    spectra_kin_7 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_7 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_7 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_33-35_20191108_rigidBody/c_cx_mt-x-3-109_cy_mt-y-229-194';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_8 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_8 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_8 = size(P1s,2);
    spectra_kin_8 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_8 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_8 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_33-35_20191108_rigidBody/c_cx_mt-x-137-255_cy_mt-y-10-211';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_9 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_9 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_9 = size(P1s,2);
    spectra_kin_9 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_9 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_9 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_36-38_20191108_rigidBody/c_cx_mt-x-190-248_cy_mt-y-34-120';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_10 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_10 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_10 = size(P1s,2);
    spectra_kin_10 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_10 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_10 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s




pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_42-43_20191108_rigidBody/c_cx_mt-x-72-58_cy_mt-y-173-250';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_11 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_11 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_11 = size(P1s,2);
    spectra_kin_11 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_11 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_11 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s




pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_42-43_20191108_rigidBody/c_cx_mt-x-102-81_cy_mt-y-3-142';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_12 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_12 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_12 = size(P1s,2);
    spectra_kin_12 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_12 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_12 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_42-43_20191108_rigidBody/c_cx_mt-x-122-150_cy_mt-y-105-1';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_13 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_13 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_13 = size(P1s,2);
    spectra_kin_13 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_13 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_13 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_44-46_20191108_rigidBody/c_cx_mt-x-53-209_cy_mt-y-90-194';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_14 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_14 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_14 = size(P1s,2);
    spectra_kin_14 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_14 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_14 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_44-46_20191108_rigidBody/c_cx_mt-x-204-255_cy_mt-y-137-78';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_15 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_15 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_15 = size(P1s,2);
    spectra_kin_15 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_15 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_15 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt1 kinesin/tifStacks_expt1Kinesin_20191108/Stack_expt1_8-11_20191108_rigidBody/c_cx_mt-x-24-85_cy_mt-y-155-217';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_16 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_16 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_16 = size(P1s,2);
    spectra_kin_16 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_16 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_16 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt1 kinesin/tifStacks_expt1Kinesin_20191108/Stack_expt1_8-11_20191108_rigidBody/c_cx_mt-x-120-196_cy_mt-y-67-217';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_17 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_17 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_17 = size(P1s,2);
    spectra_kin_17 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_17 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_17 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt1 kinesin/tifStacks_expt1Kinesin_20191108/Stack_expt1_13-14_20191108/c_cx_mt-x-130-252_cy_mt-y-162-295';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_18 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_18 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_18 = size(P1s,2);
    spectra_kin_18 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_18 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_18 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt1 kinesin/tifStacks_expt1Kinesin_20191108/Stack_expt1_15-17_20191108_rigidBody/c_cx_mt-x-34-254_cy_mt-y-5-234';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_kin_19 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_kin_19 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_19 = size(P1s,2);
    spectra_kin_19 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    n_kin_19 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_kin_19 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s




%%

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166/avgSpectra_c_cx_mt-x-76-109_cy_mt-y-254-166.mat')
avgSpectra_tpcterm_1 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166/stdSpectra_c_cx_mt-x-76-109_cy_mt-y-254-166.mat')
stdSpectra_tpcterm_1 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166/spectra_c_cx_mt-x-76-109_cy_mt-y-254-166.mat')
n_tpcterm_1 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166/frequencies_c_cx_mt-x-76-109_cy_mt-y-254-166.mat')
f_tpcterm_1 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-119-200_cy_mt-y-247-185/avgSpectra_c_cx_mt-x-119-200_cy_mt-y-247-185.mat')
avgSpectra_tpcterm_2 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-119-200_cy_mt-y-247-185/stdSpectra_c_cx_mt-x-119-200_cy_mt-y-247-185.mat')
stdSpectra_tpcterm_2 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-119-200_cy_mt-y-247-185/spectra_c_cx_mt-x-119-200_cy_mt-y-247-185.mat')
n_tpcterm_2 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-119-200_cy_mt-y-247-185/frequencies_c_cx_mt-x-119-200_cy_mt-y-247-185.mat')
f_tpcterm_2 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-4-45_cy_mt-y-99-5/avgSpectra_c_cx_mt-x-4-45_cy_mt-y-99-5.mat')
avgSpectra_tpcterm_3 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-4-45_cy_mt-y-99-5/stdSpectra_c_cx_mt-x-4-45_cy_mt-y-99-5.mat')
stdSpectra_tpcterm_3 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-4-45_cy_mt-y-99-5/spectra_c_cx_mt-x-4-45_cy_mt-y-99-5.mat')
n_tpcterm_3 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-4-45_cy_mt-y-99-5/frequencies_c_cx_mt-x-4-45_cy_mt-y-99-5.mat')
f_tpcterm_3 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-101-195_cy_mt-y-169-132/avgSpectra_c_cx_mt-x-101-195_cy_mt-y-169-132.mat')
avgSpectra_tpcterm_4 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-101-195_cy_mt-y-169-132/stdSpectra_c_cx_mt-x-101-195_cy_mt-y-169-132.mat')
stdSpectra_tpcterm_4 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-101-195_cy_mt-y-169-132/spectra_c_cx_mt-x-101-195_cy_mt-y-169-132.mat')
n_tpcterm_4 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-101-195_cy_mt-y-169-132/frequencies_c_cx_mt-x-101-195_cy_mt-y-169-132.mat')
f_tpcterm_4 = f;

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
spectra_tpx2_1 = P1s;

%load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-56-231_cy_mt-y-54-169/frequencies_c_cx_mt-x-56-231_cy_mt-y-54-169.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171/frequencies_c_cx_mt-x-74-232_cy_mt-y-66-171.mat')
f_tpx2_1 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171';
fNameStruct = loadSpectralDataFromDir(pathName);

load(fNameStruct.spectra)
spectra_tpx2_1 = P1s;

load(fNameStruct.f)
f_tpx2_1 = f;

clear fNameStruct
clear pathName

% define cutoff frequency for plotting
f_cutoff = .00099; %units nm^-1

% calculate the rayleigh-plateau wavelengths for the tpx2 scans
fInd_tpx2_1 = min(find(f_tpx2_1>f_cutoff));



%{

% get appropriate spacing for linearly interpolated data
% combine all linearly interpolated data into cell
fAll_long_tpx2 = {diff(f_tpx2_1(fInd_tpx2_1:end));...
    diff(f_tpx2_2(fInd_tpx2_2:end));...
    diff(f_tpx2_3(fInd_tpx2_3:end));...
    diff(f_tpx2_4(fInd_tpx2_4:end));...
    diff(f_tpx2_5(fInd_tpx2_5:end));...
    diff(f_tpx2_6(fInd_tpx2_6:end))};

% get the average delta F
meanDeltaF = mean(cellfun(@mean, fAll_long_tpx2));

% get the min avg delta F
minDeltaF = min(cellfun(@mean, fAll_long_tpx2));

fLin_tpx2 = [f_min_tpx2:meanDeltaF:f_max_tpx2];
fLin_tpx2 = [f_min_tpx2:minDeltaF:f_max_tpx2];

%}


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153/avgSpectra_c_cx_mt-x-96-253_cy_mt-y-31-153.mat')
avgSpectra_tpx2_2 = avgSpectra./1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153/stdSpectra_c_cx_mt-x-96-253_cy_mt-y-31-153.mat')
stdSpectra_tpx2_2 = stdSpectra./1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153/spectra_c_cx_mt-x-96-253_cy_mt-y-31-153.mat')
n_tpx2_2 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153/frequencies_c_cx_mt-x-96-253_cy_mt-y-31-153.mat')
f_tpx2_2 = f;

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



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/avgSpectra_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
avgSpectra_tpx2_12nm_1 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/stdSpectra_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
stdSpectra_tpx2_12nm_1 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/spectra_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
n_tpx2_12nm_1 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250/frequencies_c_cx_mt-x-112-182_cy_mt-y-288-250.mat')
f_tpx2_12nm_1 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/avgSpectra_c_cx_mt-x-9-73_cy_mt-y-15-29.mat')
avgSpectra_tpx2_12nm_2 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/stdSpectra_c_cx_mt-x-9-73_cy_mt-y-15-29.mat')
stdSpectra_tpx2_12nm_2 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/spectra_c_cx_mt-x-9-73_cy_mt-y-15-29.mat')
n_tpx2_12nm_2 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/frequencies_c_cx_mt-x-9-73_cy_mt-y-15-29.mat')
f_tpx2_12nm_2 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/avgSpectra_c_cx_mt-x-7-124_cy_mt-y-156-230.mat')
avgSpectra_tpx2_12nm_2i = avgSpectra./1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/stdSpectra_c_cx_mt-x-7-124_cy_mt-y-156-230.mat')
stdSpectra_tpx2_12nm_2i = stdSpectra./1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/spectra_c_cx_mt-x-7-124_cy_mt-y-156-230.mat')
n_tpx2_12nm_2i = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/frequencies_c_cx_mt-x-7-124_cy_mt-y-156-230.mat')
f_tpx2_12nm_2i = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193/avgSpectra_c_cx_mt-x-84-147_cy_mt-y-52-193.mat')
avgSpectra_tpx2_12nm_3 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193/stdSpectra_c_cx_mt-x-84-147_cy_mt-y-52-193.mat')
stdSpectra_tpx2_12nm_3 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193/spectra_c_cx_mt-x-84-147_cy_mt-y-52-193.mat')
n_tpx2_12nm_3 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193/frequencies_c_cx_mt-x-84-147_cy_mt-y-52-193.mat')
f_tpx2_12nm_3 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247/avgSpectra_c_cx_mt-x-110-38_cy_mt-y-59-247.mat')
avgSpectra_tpx2_12nm_4 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247/stdSpectra_c_cx_mt-x-110-38_cy_mt-y-59-247.mat')
stdSpectra_tpx2_12nm_4 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247/spectra_c_cx_mt-x-110-38_cy_mt-y-59-247.mat')
n_tpx2_12nm_4 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247/frequencies_c_cx_mt-x-110-38_cy_mt-y-59-247.mat')
f_tpx2_12nm_4 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f


%%


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490/avgSpectra_c_cx_mt-x-167-329_cy_mt-y-2-490.mat')
avgSpectra_tpx2_20nm_1 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490/stdSpectra_c_cx_mt-x-167-329_cy_mt-y-2-490.mat')
stdSpectra_tpx2_20nm_1 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490/spectra_c_cx_mt-x-167-329_cy_mt-y-2-490.mat')
n_tpx2_20nm_1 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490/frequencies_c_cx_mt-x-167-329_cy_mt-y-2-490.mat')
f_tpx2_20nm_1 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364/avgSpectra_c_cx_mt-x-237-461_cy_mt-y-43-364.mat')
avgSpectra_tpx2_20nm_2 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364/stdSpectra_c_cx_mt-x-237-461_cy_mt-y-43-364.mat')
stdSpectra_tpx2_20nm_2 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364/spectra_c_cx_mt-x-237-461_cy_mt-y-43-364.mat')
n_tpx2_20nm_2 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364/frequencies_c_cx_mt-x-237-461_cy_mt-y-43-364.mat')
f_tpx2_20nm_2 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f



load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223/avgSpectra_c_cx_mt-x-233-209_cy_mt-y-8-223.mat')
avgSpectra_tpx2_20nm_3 = avgSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223/stdSpectra_c_cx_mt-x-233-209_cy_mt-y-8-223.mat')
stdSpectra_tpx2_20nm_3 = stdSpectra;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223/spectra_c_cx_mt-x-233-209_cy_mt-y-8-223.mat')
n_tpx2_20nm_3 = size(P1s,2);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223/frequencies_c_cx_mt-x-233-209_cy_mt-y-8-223.mat')
f_tpx2_20nm_3 = f;

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
rp_lw = 2;
rp_ms = 15;

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

% tpx2 c term
fInd_tpcterm_1 = min(find(f_tpcterm_1>f_cutoff));
fInd_tpcterm_2 = min(find(f_tpcterm_2>f_cutoff));
fInd_tpcterm_3 = min(find(f_tpcterm_3>f_cutoff));
fInd_tpcterm_4 = min(find(f_tpcterm_4>f_cutoff));

% tpx2 fl 20nm coating
fInd_tpx2_20nm_1 = min(find(f_tpx2_20nm_1>f_cutoff));
fInd_tpx2_20nm_2 = min(find(f_tpx2_20nm_2>f_cutoff));
fInd_tpx2_20nm_3 = min(find(f_tpx2_20nm_3>f_cutoff));

% tpx2 fl 12nm coating
fInd_tpx2_12nm_1 = min(find(f_tpx2_12nm_1>f_cutoff));
fInd_tpx2_12nm_2 = min(find(f_tpx2_12nm_2>f_cutoff));
fInd_tpx2_12nm_3 = min(find(f_tpx2_12nm_3>f_cutoff));
fInd_tpx2_12nm_4 = min(find(f_tpx2_12nm_4>f_cutoff));

% more initial coatings
fInd_tpx2_12nm_2i = min(find(f_tpx2_12nm_2i>f_cutoff));


fInd_kin_3 = min(find(f_kin_3>f_cutoff));
fInd_kin_4 = min(find(f_kin_4>f_cutoff));
fInd_kin_5 = min(find(f_kin_5>f_cutoff));
fInd_kin_6 = min(find(f_kin_6>f_cutoff));
fInd_kin_7 = min(find(f_kin_7>f_cutoff));
fInd_kin_8 = min(find(f_kin_8>f_cutoff));
fInd_kin_9 = min(find(f_kin_9>f_cutoff));
fInd_kin_10 = min(find(f_kin_10>f_cutoff));
fInd_kin_11 = min(find(f_kin_11>f_cutoff));
fInd_kin_12 = min(find(f_kin_12>f_cutoff));
fInd_kin_13 = min(find(f_kin_13>f_cutoff));
fInd_kin_14 = min(find(f_kin_14>f_cutoff));
fInd_kin_15 = min(find(f_kin_15>f_cutoff));
fInd_kin_16 = min(find(f_kin_16>f_cutoff));
fInd_kin_17 = min(find(f_kin_17>f_cutoff));
fInd_kin_18 = min(find(f_kin_18>f_cutoff));
fInd_kin_19 = min(find(f_kin_19>f_cutoff));




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



%% average all tpx2 12nm spectra

fAll_tpx2_12nm = [f_tpx2_12nm_1(fInd_tpx2_12nm_1:end),...
    f_tpx2_12nm_2(fInd_tpx2_12nm_2:end),...
    f_tpx2_12nm_3(fInd_tpx2_12nm_3:end),...
    f_tpx2_12nm_4(fInd_tpx2_12nm_4:end)];
 
fAll_tpx2_12nm = sort(fAll_tpx2_12nm);
f_min_tpx2_12nm = min(fAll_tpx2_12nm);
f_max_tpx2_12nm = max(fAll_tpx2_12nm);
 
fLin_tpx2_12nm = [f_min_tpx2_12nm:mean(diff(fAll_tpx2_12nm)):f_max_tpx2_12nm];
fLin_tpx2_12nm = [f_min_tpx2_12nm:.001:f_max_tpx2_12nm];
%.001;

f1=f_tpx2_12nm_1(fInd_tpx2_12nm_1:end);
f2=f_tpx2_12nm_2(fInd_tpx2_12nm_2:end);
f3=f_tpx2_12nm_3(fInd_tpx2_12nm_3:end);
f4=f_tpx2_12nm_4(fInd_tpx2_12nm_4:end);
 
a1=avgSpectra_tpx2_12nm_1(:,fInd_tpx2_12nm_1:end);
a2=avgSpectra_tpx2_12nm_2(:,fInd_tpx2_12nm_2:end);
a3=avgSpectra_tpx2_12nm_3(:,fInd_tpx2_12nm_3:end);
a4=avgSpectra_tpx2_12nm_4(:,fInd_tpx2_12nm_4:end);
 
s1 = stdSpectra_tpx2_12nm_1(:,fInd_tpx2_12nm_1:end)./sqrt(n_tpx2_12nm_1);
s2 = stdSpectra_tpx2_12nm_2(:,fInd_tpx2_12nm_2:end)./sqrt(n_tpx2_12nm_2);
s3 = stdSpectra_tpx2_12nm_3(:,fInd_tpx2_12nm_3:end)./sqrt(n_tpx2_12nm_3);
s4 = stdSpectra_tpx2_12nm_4(:,fInd_tpx2_12nm_4:end)./sqrt(n_tpx2_12nm_4);
 
a1itpx2_12nm = interp1(f1(:),a1(:),fLin_tpx2_12nm(:),'linear','extrap');
a2itpx2_12nm = interp1(f2(:),a2(:),fLin_tpx2_12nm(:),'linear','extrap');
a3itpx2_12nm = interp1(f3(:),a3(:),fLin_tpx2_12nm(:),'linear','extrap');
a4itpx2_12nm = interp1(f4(:),a4(:),fLin_tpx2_12nm(:),'linear','extrap');
 
s1itpx2_12nm = interp1(f1(:),s1(:),fLin_tpx2_12nm(:),'linear','extrap');
s2itpx2_12nm = interp1(f2(:),s2(:),fLin_tpx2_12nm(:),'linear','extrap');
s3itpx2_12nm = interp1(f3(:),s3(:),fLin_tpx2_12nm(:),'linear','extrap');
s4itpx2_12nm = interp1(f4(:),s4(:),fLin_tpx2_12nm(:),'linear','extrap');
 
 
aMeantpx2_12nm = mean([a1itpx2_12nm a2itpx2_12nm a3itpx2_12nm a4itpx2_12nm],2);
sMeantpx2_12nm = mean([s1itpx2_12nm s2itpx2_12nm s3itpx2_12nm s4itpx2_12nm],2);

%% average all tpx2 final spectra, 15-18nm

fAll_tpx2 = [f_tpx2_1(fInd_tpx2_1:end),...
    f_tpx2_2(fInd_tpx2_2:end),...
    f_tpx2_3(fInd_tpx2_3:end),...
    f_tpx2_4(fInd_tpx2_4:end),...
    f_tpx2_5(fInd_tpx2_5:end),...
    f_tpx2_6(fInd_tpx2_6:end)];

fAll_tpx2 = sort(fAll_tpx2);
f_min_tpx2 = min(fAll_tpx2);
f_max_tpx2 = max(fAll_tpx2);

% get appropriate spacing for linearly interpolated data
% combine all linearly interpolated data into cell
fAll_long_tpx2 = {diff(f_tpx2_1(fInd_tpx2_1:end));...
    diff(f_tpx2_2(fInd_tpx2_2:end));...
    diff(f_tpx2_3(fInd_tpx2_3:end));...
    diff(f_tpx2_4(fInd_tpx2_4:end));...
    diff(f_tpx2_5(fInd_tpx2_5:end));...
    diff(f_tpx2_6(fInd_tpx2_6:end))};

% get the average delta F
% meanDeltaF = mean(cellfun(@mean, fAll_long_tpx2));
% 
% % get the min avg delta F
% minDeltaF = min(cellfun(@mean, fAll_long_tpx2));
% 
% 
% 
% fLin_tpx2 = [f_min_tpx2:meanDeltaF:f_max_tpx2];
% fLin_tpx2 = [f_min_tpx2:minDeltaF:f_max_tpx2];

fLin_tpx2 = [f_min_tpx2:.001:f_max_tpx2];

f2=f_tpx2_2(fInd_tpx2_2:end);
f3=f_tpx2_3(fInd_tpx2_3:end);
f4=f_tpx2_4(fInd_tpx2_4:end);
f5=f_tpx2_5(fInd_tpx2_5:end);
f6=f_tpx2_6(fInd_tpx2_6:end);

a2=avgSpectra_tpx2_2(:,fInd_tpx2_2:end);
a3=avgSpectra_tpx2_3(:,fInd_tpx2_3:end);
a4=avgSpectra_tpx2_4(:,fInd_tpx2_4:end);
a5=avgSpectra_tpx2_5(:,fInd_tpx2_5:end);
a6=avgSpectra_tpx2_6(:,fInd_tpx2_6:end);

s2 = stdSpectra_tpx2_2(:,fInd_tpx2_2:end)./sqrt(n_tpx2_2);
s3 = stdSpectra_tpx2_3(:,fInd_tpx2_3:end)./sqrt(n_tpx2_3);
s4 = stdSpectra_tpx2_4(:,fInd_tpx2_4:end)./sqrt(n_tpx2_4);
s5 = stdSpectra_tpx2_5(:,fInd_tpx2_5:end)./sqrt(n_tpx2_5);
s6 = stdSpectra_tpx2_6(:,fInd_tpx2_6:end)./sqrt(n_tpx2_6);

a2iTpx2 = interp1(f2(:),a2(:),fLin_tpx2(:),'linear','extrap');
a3iTpx2 = interp1(f3(:),a3(:),fLin_tpx2(:),'linear','extrap');
a4iTpx2 = interp1(f4(:),a4(:),fLin_tpx2(:),'linear','extrap');
a5iTpx2 = interp1(f5(:),a5(:),fLin_tpx2(:),'linear','extrap');
a6iTpx2 = interp1(f6(:),a6(:),fLin_tpx2(:),'linear','extrap');

s2iTpx2 = interp1(f2(:),s2(:),fLin_tpx2(:),'linear','extrap');
s3iTpx2 = interp1(f3(:),s3(:),fLin_tpx2(:),'linear','extrap');
s4iTpx2 = interp1(f4(:),s4(:),fLin_tpx2(:),'linear','extrap');
s5iTpx2 = interp1(f5(:),s5(:),fLin_tpx2(:),'linear','extrap');
s6iTpx2 = interp1(f6(:),s6(:),fLin_tpx2(:),'linear','extrap');


f1=f_tpx2_1(fInd_tpx2_1:end);
a1=avgSpectra_tpx2_1(:,fInd_tpx2_1:end);
s1 = stdSpectra_tpx2_1(:,fInd_tpx2_1:end)./sqrt(n_tpx2_1);
a1iTpx2 = interp1(f1(:),a1(:),fLin_tpx2(:),'linear','extrap');
s1iTpx2 = interp1(f1(:),s1(:),fLin_tpx2(:),'linear','extrap');

sp1 = spectra_tpx2_1(fInd_tpx2_1:end,:);
sp1i = zeros(length(fLin_tpx2),size(sp1,2));
%loop over spectra, interpolate each
for j = 1:size(sp1,2)
    sp1i(:,j) = interp1(f1(:),sp1(:,j),fLin_tpx2(:),'linear','extrap');
end



aMeanTpx2 = mean([a1iTpx2 a2iTpx2 a3iTpx2 a4iTpx2 a5iTpx2 a6iTpx2],2);
sMeanTpx2 = mean([s1iTpx2 s2iTpx2 s3iTpx2 s4iTpx2 s5iTpx2 s6iTpx2],2);

% aMeanTpx2 = mean([a1iTpx2 a3iTpx2 a4iTpx2 a5iTpx2 a6iTpx2],2);
% sMeanTpx2 = mean([s1iTpx2 s3iTpx2 s4iTpx2 s5iTpx2 s6iTpx2],2);

aMaxTpx2 = max(aMeanTpx2);
aMaxTpx2Ind = find(aMeanTpx2==aMaxTpx2);
fMaxTpx2 = fLin_tpx2(aMaxTpx2Ind);

%% average all tpx2_20nm spectra
 
fAll_tpx2_20nm = [f_tpx2_20nm_1(fInd_tpx2_20nm_1:end),...
    f_tpx2_20nm_2(fInd_tpx2_20nm_2:end),...
    f_tpx2_20nm_3(fInd_tpx2_20nm_3:end)];
 
fAll_tpx2_20nm = sort(fAll_tpx2_20nm);
f_min_tpx2_20nm = min(fAll_tpx2_20nm);
f_max_tpx2_20nm = max(fAll_tpx2_20nm);
 
fLin_tpx2_20nm = [f_min_tpx2_20nm:mean(diff(fAll_tpx2_20nm)):f_max_tpx2_20nm];

fLin_tpx2_20nm = [f_min_tpx2_20nm:.001:f_max_tpx2_20nm];


f1=f_tpx2_20nm_1(fInd_tpx2_20nm_1:end);
f2=f_tpx2_20nm_2(fInd_tpx2_20nm_2:end);
f3=f_tpx2_20nm_3(fInd_tpx2_20nm_3:end);
 
a1=avgSpectra_tpx2_20nm_1(:,fInd_tpx2_20nm_1:end);
a2=avgSpectra_tpx2_20nm_2(:,fInd_tpx2_20nm_2:end);
a3=avgSpectra_tpx2_20nm_3(:,fInd_tpx2_20nm_3:end);
 
s1 = stdSpectra_tpx2_20nm_1(:,fInd_tpx2_20nm_1:end)./sqrt(n_tpx2_20nm_1);
s2 = stdSpectra_tpx2_20nm_2(:,fInd_tpx2_20nm_2:end)./sqrt(n_tpx2_20nm_2);
s3 = stdSpectra_tpx2_20nm_3(:,fInd_tpx2_20nm_3:end)./sqrt(n_tpx2_20nm_3);
 
a1itpx2_20nm = interp1(f1(:),a1(:),fLin_tpx2_20nm(:),'linear','extrap');
a2itpx2_20nm = interp1(f2(:),a2(:),fLin_tpx2_20nm(:),'linear','extrap');
a3itpx2_20nm = interp1(f3(:),a3(:),fLin_tpx2_20nm(:),'linear','extrap');
 
s1itpx2_20nm = interp1(f1(:),s1(:),fLin_tpx2_20nm(:),'linear','extrap');
s2itpx2_20nm = interp1(f2(:),s2(:),fLin_tpx2_20nm(:),'linear','extrap');
s3itpx2_20nm = interp1(f3(:),s3(:),fLin_tpx2_20nm(:),'linear','extrap');
 
aMeantpx2_20nm = mean([a1itpx2_20nm a2itpx2_20nm a3itpx2_20nm],2);
sMeantpx2_20nm = mean([s1itpx2_20nm s2itpx2_20nm s3itpx2_20nm],2);

aMaxtpx2_20nm = max(aMeantpx2_20nm(3:end));
aMaxtpx2_20nmInd = find(aMeantpx2_20nm==aMaxtpx2_20nm);
fMaxtpx2_20nm = fLin_tpx2_20nm(aMaxtpx2_20nmInd);


%% average all tpx2 init spectra
 
fAll_tpx2i = [f_tpx2_1i(fInd_tpx2_1i:end),...
    f_tpx2_2i(fInd_tpx2_2i:end),...
    f_tpx2_5i(fInd_tpx2_5i:end),...
    f_tpx2_6i(fInd_tpx2_6i:end),...
    f_tpx2_12nm_2i(fInd_tpx2_12nm_2i:end),...
    ];
 
fAll_tpx2i = sort(fAll_tpx2i);
f_min_tpx2i = min(fAll_tpx2i);
f_max_tpx2i = max(fAll_tpx2i);
 
fLin_tpx2i = [f_min_tpx2i:mean(diff(fAll_tpx2i)):f_max_tpx2i];

fLin_tpx2i = [f_min_tpx2i:.001:f_max_tpx2i];

f1=f_tpx2_1i(fInd_tpx2_1i:end);
f2=f_tpx2_2i(fInd_tpx2_2i:end);
f5=f_tpx2_5i(fInd_tpx2_5i:end);
f6=f_tpx2_6i(fInd_tpx2_6i:end);
f3=f_tpx2_12nm_2i(fInd_tpx2_12nm_2i:end);
 
a1=avgSpectra_tpx2_1i(:,fInd_tpx2_1i:end);
a2=avgSpectra_tpx2_2i(:,fInd_tpx2_2i:end);
a5=avgSpectra_tpx2_5i(:,fInd_tpx2_5i:end);
a6=avgSpectra_tpx2_6i(:,fInd_tpx2_6i:end);
a3=avgSpectra_tpx2_12nm_2i(:,fInd_tpx2_12nm_2i:end); 

s1 = stdSpectra_tpx2_1i(:,fInd_tpx2_1i:end)./sqrt(n_tpx2_1i);
s2 = stdSpectra_tpx2_2i(:,fInd_tpx2_2i:end)./sqrt(n_tpx2_2i);
s5 = stdSpectra_tpx2_5i(:,fInd_tpx2_5i:end)./sqrt(n_tpx2_5i);
s6 = stdSpectra_tpx2_6i(:,fInd_tpx2_6i:end)./sqrt(n_tpx2_6i);
s3 = stdSpectra_tpx2_12nm_2i(:,fInd_tpx2_12nm_2i:end)./sqrt(n_tpx2_12nm_2i); 

a1iTpx2i = interp1(f1(:),a1(:),fLin_tpx2i(:),'linear','extrap');
a2iTpx2i = interp1(f2(:),a2(:),fLin_tpx2i(:),'linear','extrap');
a5iTpx2i = interp1(f5(:),a5(:),fLin_tpx2i(:),'linear','extrap');
a6iTpx2i = interp1(f6(:),a6(:),fLin_tpx2i(:),'linear','extrap');
a3iTpx2i = interp1(f3(:),a3(:),fLin_tpx2i(:),'linear','extrap');


s1iTpx2i = interp1(f1(:),s1(:),fLin_tpx2i(:),'linear','extrap');
s2iTpx2i = interp1(f2(:),s2(:),fLin_tpx2i(:),'linear','extrap');
s5iTpx2i = interp1(f5(:),s5(:),fLin_tpx2i(:),'linear','extrap');
s6iTpx2i = interp1(f6(:),s6(:),fLin_tpx2i(:),'linear','extrap');
s3iTpx2i = interp1(f3(:),s3(:),fLin_tpx2i(:),'linear','extrap');
 
aMeanTpx2i = mean([a1iTpx2i a2iTpx2i a3iTpx2i a5iTpx2i a6iTpx2i],2);
sMeanTpx2i = mean([s1iTpx2i s2iTpx2i s3iTpx2i s5iTpx2i s6iTpx2i],2);

%% average all kin spectra

fAll_kin = [f_kin_1(fInd_kin_1:end),...
    f_kin_2(fInd_kin_2:end),...
    f_kin_3(fInd_kin_3:end),...
    f_kin_4(fInd_kin_4:end),...
    f_kin_5(fInd_kin_5:end),...
    f_kin_6(fInd_kin_6:end),...
    f_kin_7(fInd_kin_7:end),...
    f_kin_8(fInd_kin_8:end),...
    f_kin_9(fInd_kin_9:end),...
    f_kin_10(fInd_kin_10:end),...
    f_kin_11(fInd_kin_11:end),...
    f_kin_12(fInd_kin_12:end),...
    f_kin_13(fInd_kin_13:end),...
    f_kin_14(fInd_kin_14:end),...
    f_kin_15(fInd_kin_15:end),...
    f_kin_16(fInd_kin_16:end),...
    f_kin_17(fInd_kin_17:end),...
    f_kin_18(fInd_kin_18:end),...
    f_kin_19(fInd_kin_19:end),...
    ];
 
fAll_kin = sort(fAll_kin);
f_min_kin = min(fAll_kin);
f_max_kin = max(fAll_kin);
 
fLin_kin = [f_min_kin:mean(diff(f_kin_19)):f_max_kin];

fLin_kin = [f_min_kin:.001:f_max_kin];


f1=f_kin_1(fInd_kin_1:end);
a1=avgSpectra_kin_1(:,fInd_kin_1:end);
s1 = stdSpectra_kin_1(:,fInd_kin_1:end)./sqrt(n_kin_1);
a1ikin = interp1(f1(:),a1(:),fLin_kin(:),'linear','extrap');
s1ikin = interp1(f1(:),s1(:),fLin_kin(:),'linear','extrap');


f2=f_kin_2(fInd_kin_2:end);
a2=avgSpectra_kin_2(:,fInd_kin_2:end);
s2 = stdSpectra_kin_2(:,fInd_kin_2:end)./sqrt(n_kin_2);
a2ikin = interp1(f2(:),a2(:),fLin_kin(:),'linear','extrap');
s2ikin = interp1(f2(:),s2(:),fLin_kin(:),'linear','extrap');


f3=f_kin_3(fInd_kin_3:end);
a3=avgSpectra_kin_3(:,fInd_kin_3:end);
s3 = stdSpectra_kin_3(:,fInd_kin_3:end)./sqrt(n_kin_3);
a3ikin = interp1(f3(:),a3(:),fLin_kin(:),'linear','extrap');
s3ikin = interp1(f3(:),s3(:),fLin_kin(:),'linear','extrap');

f4=f_kin_4(fInd_kin_4:end);
a4=avgSpectra_kin_4(:,fInd_kin_4:end);
s4 = stdSpectra_kin_4(:,fInd_kin_4:end)./sqrt(n_kin_4);
a4ikin = interp1(f4(:),a4(:),fLin_kin(:),'linear','extrap');
s4ikin = interp1(f4(:),s4(:),fLin_kin(:),'linear','extrap');

f5=f_kin_5(fInd_kin_5:end);
a5=avgSpectra_kin_5(:,fInd_kin_5:end);
s5 = stdSpectra_kin_5(:,fInd_kin_5:end)./sqrt(n_kin_5);
a5ikin = interp1(f5(:),a5(:),fLin_kin(:),'linear','extrap');
s5ikin = interp1(f5(:),s5(:),fLin_kin(:),'linear','extrap');

f6=f_kin_6(fInd_kin_6:end);
a6=avgSpectra_kin_6(:,fInd_kin_6:end);
s6 = stdSpectra_kin_6(:,fInd_kin_6:end)./sqrt(n_kin_6);
a6ikin = interp1(f6(:),a6(:),fLin_kin(:),'linear','extrap');
s6ikin = interp1(f6(:),s6(:),fLin_kin(:),'linear','extrap');

f7=f_kin_7(fInd_kin_7:end);
a7=avgSpectra_kin_7(:,fInd_kin_7:end);
s7 = stdSpectra_kin_7(:,fInd_kin_7:end)./sqrt(n_kin_7);
a7ikin = interp1(f7(:),a7(:),fLin_kin(:),'linear','extrap');
s7ikin = interp1(f7(:),s7(:),fLin_kin(:),'linear','extrap');

f8=f_kin_8(fInd_kin_8:end);
a8=avgSpectra_kin_8(:,fInd_kin_8:end);
s8 = stdSpectra_kin_8(:,fInd_kin_8:end)./sqrt(n_kin_8);
a8ikin = interp1(f8(:),a8(:),fLin_kin(:),'linear','extrap');
s8ikin = interp1(f8(:),s8(:),fLin_kin(:),'linear','extrap');

f9=f_kin_9(fInd_kin_9:end);
a9=avgSpectra_kin_9(:,fInd_kin_9:end);
s9 = stdSpectra_kin_9(:,fInd_kin_9:end)./sqrt(n_kin_9);
a9ikin = interp1(f9(:),a9(:),fLin_kin(:),'linear','extrap');
s9ikin = interp1(f9(:),s9(:),fLin_kin(:),'linear','extrap');

f10=f_kin_10(fInd_kin_10:end);
a10=avgSpectra_kin_10(:,fInd_kin_10:end);
s10 = stdSpectra_kin_10(:,fInd_kin_10:end)./sqrt(n_kin_10);
a10ikin = interp1(f10(:),a10(:),fLin_kin(:),'linear','extrap');
s10ikin = interp1(f10(:),s10(:),fLin_kin(:),'linear','extrap');

f11=f_kin_11(fInd_kin_11:end);
a11=avgSpectra_kin_11(:,fInd_kin_11:end);
s11 = stdSpectra_kin_11(:,fInd_kin_11:end)./sqrt(n_kin_11);
a11ikin = interp1(f11(:),a11(:),fLin_kin(:),'linear','extrap');
s11ikin = interp1(f11(:),s11(:),fLin_kin(:),'linear','extrap');

f12=f_kin_12(fInd_kin_12:end);
a12=avgSpectra_kin_12(:,fInd_kin_12:end);
s12 = stdSpectra_kin_12(:,fInd_kin_12:end)./sqrt(n_kin_12);
a12ikin = interp1(f12(:),a12(:),fLin_kin(:),'linear','extrap');
s12ikin = interp1(f12(:),s12(:),fLin_kin(:),'linear','extrap');

f13=f_kin_13(fInd_kin_13:end);
a13=avgSpectra_kin_13(:,fInd_kin_13:end);
s13 = stdSpectra_kin_13(:,fInd_kin_13:end)./sqrt(n_kin_13);
a13ikin = interp1(f13(:),a13(:),fLin_kin(:),'linear','extrap');
s13ikin = interp1(f13(:),s13(:),fLin_kin(:),'linear','extrap');

f14=f_kin_14(fInd_kin_14:end);
a14=avgSpectra_kin_14(:,fInd_kin_14:end);
s14 = stdSpectra_kin_14(:,fInd_kin_14:end)./sqrt(n_kin_14);
a14ikin = interp1(f14(:),a14(:),fLin_kin(:),'linear','extrap');
s14ikin = interp1(f14(:),s14(:),fLin_kin(:),'linear','extrap');

f15=f_kin_15(fInd_kin_15:end);
a15=avgSpectra_kin_15(:,fInd_kin_15:end);
s15 = stdSpectra_kin_15(:,fInd_kin_15:end)./sqrt(n_kin_15);
a15ikin = interp1(f15(:),a15(:),fLin_kin(:),'linear','extrap');
s15ikin = interp1(f15(:),s15(:),fLin_kin(:),'linear','extrap');

f16=f_kin_16(fInd_kin_16:end);
a16=avgSpectra_kin_16(:,fInd_kin_16:end);
s16 = stdSpectra_kin_16(:,fInd_kin_16:end)./sqrt(n_kin_16);
a16ikin = interp1(f16(:),a16(:),fLin_kin(:),'linear','extrap');
s16ikin = interp1(f16(:),s16(:),fLin_kin(:),'linear','extrap');

f17=f_kin_17(fInd_kin_17:end);
a17=avgSpectra_kin_17(:,fInd_kin_17:end);
s17 = stdSpectra_kin_17(:,fInd_kin_17:end)./sqrt(n_kin_17);
a17ikin = interp1(f17(:),a17(:),fLin_kin(:),'linear','extrap');
s17ikin = interp1(f17(:),s17(:),fLin_kin(:),'linear','extrap');

f18=f_kin_18(fInd_kin_18:end);
a18=avgSpectra_kin_18(:,fInd_kin_18:end);
s18 = stdSpectra_kin_18(:,fInd_kin_18:end)./sqrt(n_kin_18);
a18ikin = interp1(f18(:),a18(:),fLin_kin(:),'linear','extrap');
s18ikin = interp1(f18(:),s18(:),fLin_kin(:),'linear','extrap');

f19=f_kin_19(fInd_kin_19:end);
a19=avgSpectra_kin_19(:,fInd_kin_19:end);
s19 = stdSpectra_kin_19(:,fInd_kin_19:end)./sqrt(n_kin_19);
a19ikin = interp1(f19(:),a19(:),fLin_kin(:),'linear','extrap');
s19ikin = interp1(f19(:),s19(:),fLin_kin(:),'linear','extrap');

 
aMeankin = mean([a1ikin,...
    a2ikin,...
    a3ikin,...
    a4ikin,...
    a5ikin,...
    a6ikin,...
    a7ikin,...
    a8ikin,...
    a9ikin,...
    a10ikin,...
    a11ikin,...
    a12ikin,...
    a13ikin,...
    a14ikin,...
    a15ikin,...
    a16ikin,...
    a17ikin,...
    a18ikin,...
    a19ikin,...
    ],2);

sMeankin = mean([s1ikin,...
    s2ikin,...
    s3ikin,...
    s4ikin,...
    s5ikin,...
    s6ikin,...
    s7ikin,...
    s8ikin,...
    s9ikin,...
    s10ikin,...
    s11ikin,...
    s12ikin,...
    s13ikin,...
    s14ikin,...
    s15ikin,...
    s16ikin,...
    s17ikin,...
    s18ikin,...
    s19ikin,...
    ],2);

%% average all tpx2 c term spectra

fAll_tpcterm = [f_tpcterm_1(fInd_tpcterm_1:end),...
    f_tpcterm_2(fInd_tpcterm_2:end),...
    f_tpcterm_3(fInd_tpcterm_3:end),...
    f_tpcterm_4(fInd_tpcterm_4:end)];
 
fAll_tpcterm = sort(fAll_tpcterm);
f_min_tpcterm = min(fAll_tpcterm);
f_max_tpcterm = max(fAll_tpcterm);
 
fLin_tpcterm = [f_min_tpcterm:mean(diff(fAll_tpcterm)):f_max_tpcterm];
fLin_tpcterm = [f_min_tpcterm:.001:f_max_tpcterm];


f1=f_tpcterm_1(fInd_tpcterm_1:end);
f2=f_tpcterm_2(fInd_tpcterm_2:end);
f3=f_tpcterm_3(fInd_tpcterm_3:end);
f4=f_tpcterm_4(fInd_tpcterm_4:end);
 
a1=avgSpectra_tpcterm_1(:,fInd_tpcterm_1:end);
a2=avgSpectra_tpcterm_2(:,fInd_tpcterm_2:end);
a3=avgSpectra_tpcterm_3(:,fInd_tpcterm_3:end);
a4=avgSpectra_tpcterm_4(:,fInd_tpcterm_4:end);

s1 = stdSpectra_tpcterm_1(:,fInd_tpcterm_1:end)./sqrt(n_tpcterm_1);
s2 = stdSpectra_tpcterm_2(:,fInd_tpcterm_2:end)./sqrt(n_tpcterm_2);
s3 = stdSpectra_tpcterm_3(:,fInd_tpcterm_3:end)./sqrt(n_tpcterm_3);
s4 = stdSpectra_tpcterm_4(:,fInd_tpcterm_4:end)./sqrt(n_tpcterm_4);

a1itpcterm = interp1(f1(:),a1(:),fLin_tpcterm(:),'linear','extrap');
a2itpcterm = interp1(f2(:),a2(:),fLin_tpcterm(:),'linear','extrap');
a3itpcterm = interp1(f3(:),a3(:),fLin_tpcterm(:),'linear','extrap');
a4itpcterm = interp1(f4(:),a4(:),fLin_tpcterm(:),'linear','extrap');

s1itpcterm = interp1(f1(:),s1(:),fLin_tpcterm(:),'linear','extrap');
s2itpcterm = interp1(f2(:),s2(:),fLin_tpcterm(:),'linear','extrap');
s3itpcterm = interp1(f3(:),s3(:),fLin_tpcterm(:),'linear','extrap');
s4itpcterm = interp1(f4(:),s4(:),fLin_tpcterm(:),'linear','extrap');


aMeantpcterm = mean([a1itpcterm a2itpcterm a3itpcterm a4itpcterm],2);
sMeantpcterm = mean([s1itpcterm s2itpcterm s3itpcterm s4itpcterm],2);



%% average all naked spectra
 
fAll_naked = [f_naked_1(fInd_naked_1:end),...
    f_naked_2(fInd_naked_2:end),...
    f_naked_3(fInd_naked_3:end)];
 
fAll_naked = sort(fAll_naked);
f_min_naked = min(fAll_naked);
f_max_naked = max(fAll_naked);
 
fLin_naked = [f_min_naked:mean(diff(fAll_naked)):f_max_naked];
fLin_naked = [f_min_naked:.001:f_max_naked];


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

saveDirMain = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures';

doSave = 0;

lw = 2;

figure;
hold on;
box on;

% define marker, marker size, and linewidth for lambda rp
rp_m = 'ko';
rp_lw = 2;
rp_ms = 15;

%%{
% plot avg wavelength pulled out of all data
plot(fMaxTpx2,aMaxTpx2*1e9,rp_m,'MarkerSize',rp_ms,'LineWidth',rp_lw)
% plot(fMaxtpx2_20nm,aMaxtpx2_20nm,rp_m,'MarkerSize',rp_ms,'LineWidth',rp_lw)
% plot(.00468,.9888,rp_m,'MarkerSize',rp_ms,'LineWidth',rp_lw)



% plot average tpx2 15-16 nm coating final spectra
indMaxPlot = max(find(fLin_tpx2<10));
errorbar(fLin_tpx2(1:indMaxPlot),...
    aMeanTpx2(1:indMaxPlot)*1e9,...
    sMeanTpx2(1:indMaxPlot)*1e9,...
    'LineWidth',...
    lw)
% saveDirMain;

plottedAvg15nmTpx2Spectra = aMeanTpx2(1:indMaxPlot)*1e9;
plottedStd15nmTpx2Spectra = sMeanTpx2(1:indMaxPlot)*1e9;
plottedFreqs15nmTpx2 = fLin_tpx2(1:indMaxPlot);

save([saveDirMain,'/avg15nmTpx2Spectra.mat'],'plottedAvg15nmTpx2Spectra')
save([saveDirMain,'/std15nmTpx2Spectra.mat'],'plottedStd15nmTpx2Spectra')
save([saveDirMain,'/wavenumbers_Avg15nmTpx2Spectra.mat'],'plottedFreqs15nmTpx2')

% plot average tpx2 12-13nm coating final spectra
indMaxPlot = max(find(fLin_tpx2_12nm<10));
errorbar(fLin_tpx2_12nm(1:indMaxPlot),...
    aMeantpx2_12nm(1:indMaxPlot),...
    sMeantpx2_12nm(1:indMaxPlot),...
    'LineWidth',...
    lw)


% plot average tpx2 20nm coating final spectra
indMaxPlot = max(find(fLin_tpx2_20nm<10));
errorbar(fLin_tpx2_20nm(1:indMaxPlot),...
    aMeantpx2_20nm(1:indMaxPlot),...
    sMeantpx2_20nm(1:indMaxPlot),...
    'LineWidth',...
    lw)

%%{
%}
% plot average tpx2 initial spectra
indMaxPlot = max(find(fLin_tpx2i<10));
errorbar(fLin_tpx2i(1:indMaxPlot),...
    aMeanTpx2i(1:indMaxPlot)*1e9,...
    sMeanTpx2i(1:indMaxPlot)*1e9,...
    'LineWidth',...
    lw)

plottedAvgInitTpx2Spectra = aMeanTpx2i(1:indMaxPlot)*1e9;
plottedStdInitTpx2Spectra = sMeanTpx2i(1:indMaxPlot)*1e9;
plottedFreqsInitTpx2 = fLin_tpx2i(1:indMaxPlot);

save([saveDirMain,'/avgInitTpx2Spectra.mat'],'plottedAvgInitTpx2Spectra')
save([saveDirMain,'/stdInitTpx2Spectra.mat'],'plottedStdInitTpx2Spectra')
save([saveDirMain,'/wavenumbers_AvgInitTpx2Spectra.mat'],'plottedFreqsInitTpx2')


% plot average tpx2 cterm spectra
indMaxPlot = max(find(fLin_tpcterm<10));
errorbar(fLin_tpcterm(1:indMaxPlot),...
    aMeantpcterm(1:indMaxPlot),...
    sMeantpcterm(1:indMaxPlot),...
    'LineWidth',...
    lw)

% plot average kinesin spectra
indMaxPlot = max(find(fLin_kin<10));
errorbar(fLin_kin(1:indMaxPlot),...
    aMeankin(1:indMaxPlot)*1e9,...
    sMeankin(1:indMaxPlot)*1e9,...
    'LineWidth',...
    lw)

plottedAvgKinSpectra = aMeankin(1:indMaxPlot)*1e9;
plottedStdKinSpectra = sMeankin(1:indMaxPlot)*1e9;
plottedFreqsKin = fLin_kin(1:indMaxPlot);

save([saveDirMain,'/avgKinSpectra.mat'],'plottedAvgKinSpectra')
save([saveDirMain,'/stdKinSpectra.mat'],'plottedStdKinSpectra')
save([saveDirMain,'/wavenumbers_AvgKinSpectra.mat'],'plottedFreqsKin')



% plot average naked mt spectra
indMaxPlot = max(find(fLin_naked<.026));
errorbar(fLin_naked(1:indMaxPlot),...
    aMeannaked(1:indMaxPlot)*1e9,...
    sMeannaked(1:indMaxPlot)*1e9,...
    'LineWidth',...
    lw)

plottedAvgNakedSpectra = aMeannaked(1:indMaxPlot)*1e9;
plottedStdNakedSpectra = sMeannaked(1:indMaxPlot)*1e9;
plottedFreqsNaked = fLin_naked(1:indMaxPlot);

save([saveDirMain,'/avgNakedSpectra.mat'],'plottedAvgNakedSpectra')
save([saveDirMain,'/stdNakedSpectra.mat'],'plottedStdNakedSpectra')
save([saveDirMain,'/wavenumbers_AvgNakedSpectra.mat'],'plottedFreqsNaked')


%}
set(gca, 'XScale','log')

%%{
legend(['Avg. \lambda_{RP} = ',num2str(round( ((1/fMaxTpx2)/1e3)*100 )/100 ),' \mum'],...
    ['Avg. \lambda_{RP} = ',num2str(round( ((1/fMaxtpx2_20nm)/1e3)*100 )/100 ),' \mum'],...
    ['Avg. \lambda_{RP} = ',num2str(.21),' \mum'],...
    'TPX2, 15-18nm film, after instability (n=6)',...
    'TPX2, 12-13nm film, after instability (n=4)',...
    'TPX2, 22-23nm film, after instability (n=3)',...  
    'TPX2, initial coating (n=4)',...
    'TPX2-CT (n=4)',...
    'Kinesin1 (n=3)',...
    'Naked MT (n=3)')
%}

%{
legend('TPX2, initial coating (n=5)',...
    'TPX2-CT (n=4)',...
    'Kinesin1 (n=3)',...
    'Naked MT (n=3)')
%}

legend('boxoff');

xafz = 14;
yafz = 14;
tvfz = 12;
simplePlotFormat( 'f (nm^{-1})', 'Average |P(f)| +/- average SEM (nm/Hz)', xafz, yafz, tvfz )

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/avg amplitude spectra TPX2_20nm TPX2_15nm TPX2_12nm TPX2init TPX2cTerm kinesin1 naked mt'])
    
    %saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/avg amplitude spectra TPX2_20nm TPX2_15nm TPX2_12nm'])

    %saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/avg amplitude spectra TPX2init TPX2cTerm kinesin1 naked mt'])

end
%% PUBLICATION MAIN BODY PLOT
saveDirMain = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures';

doSave = 1;
lw = 2;

figure;
hold on;
box on;

% define marker, marker size, and linewidth for lambda rp
rp_m = 'ko';
rp_lw = 2;
rp_ms = 18;

%%{


% plot average naked mt spectra
indMaxPlot = max(find(fLin_naked<.026));
h(1) = errorbar(fLin_naked(1:indMaxPlot),...
    aMeannaked(1:indMaxPlot)*1e9,...
    sMeannaked(1:indMaxPlot)*1e9,...
    'LineWidth',...
    lw,...
    'color','k');

plottedAvgNakedSpectra = aMeannaked(1:indMaxPlot)*1e9;
plottedStdNakedSpectra = sMeannaked(1:indMaxPlot)*1e9;
plottedFreqsNaked = fLin_naked(1:indMaxPlot);

save([saveDirMain,'/avgNakedSpectra.mat'],'plottedAvgNakedSpectra')
save([saveDirMain,'/stdNakedSpectra.mat'],'plottedStdNakedSpectra')
save([saveDirMain,'/wavenumbers_AvgNakedSpectra.mat'],'plottedFreqsNaked')




% plot average tpx2 initial spectra
indMaxPlot = max(find(fLin_tpx2i<10));
h(2) = errorbar(fLin_tpx2i(1:indMaxPlot),...
    aMeanTpx2i(1:indMaxPlot)*1e9,...
    sMeanTpx2i(1:indMaxPlot)*1e9,...
    'LineWidth',...
    lw,...
    'color','b');

plottedAvgInitTpx2Spectra = aMeanTpx2i(1:indMaxPlot)*1e9;
plottedStdInitTpx2Spectra = sMeanTpx2i(1:indMaxPlot)*1e9;
plottedFreqsInitTpx2 = fLin_tpx2i(1:indMaxPlot);

save([saveDirMain,'/avgInitTpx2Spectra.mat'],'plottedAvgInitTpx2Spectra')
save([saveDirMain,'/stdInitTpx2Spectra.mat'],'plottedStdInitTpx2Spectra')
save([saveDirMain,'/wavenumbers_AvgInitTpx2Spectra.mat'],'plottedFreqsInitTpx2')




% plot average tpx2 15-16 nm coating final spectra
indMaxPlot = max(find(fLin_tpx2<10));
h(3) = errorbar(fLin_tpx2(1:indMaxPlot),...
    aMeanTpx2(1:indMaxPlot)*1e9,...
    sMeanTpx2(1:indMaxPlot)*1e9,...
    'LineWidth',...
    lw,...
    'color','r');
% saveDirMain;

plottedAvg15nmTpx2Spectra = aMeanTpx2(1:indMaxPlot)*1e9;
plottedStd15nmTpx2Spectra = sMeanTpx2(1:indMaxPlot)*1e9;
plottedFreqs15nmTpx2 = fLin_tpx2(1:indMaxPlot);

save([saveDirMain,'/avg15nmTpx2Spectra.mat'],'plottedAvg15nmTpx2Spectra')
save([saveDirMain,'/std15nmTpx2Spectra.mat'],'plottedStd15nmTpx2Spectra')
save([saveDirMain,'/wavenumbers_Avg15nmTpx2Spectra.mat'],'plottedFreqs15nmTpx2')


% plot avg wavelength pulled out of all data
h(4) = plot(fMaxTpx2,aMaxTpx2*1e9,rp_m,'MarkerSize',rp_ms,'LineWidth',rp_lw);


%}
set(gca, 'XScale','log')

%%{
wavelengthString = num2str(round( ((1/fMaxTpx2)/1e3)*100 )/100 );
wavelengthStringFull = ['Mean $\lambda$ = ',wavelengthString,' $\mu$m'];

lgd = legend({'Uncoated',...
    'Initially coated',...
    'After droplet formation',...
    wavelengthStringFull},...
    'Interpreter','latex',...
    'Position',[.62 .7 .1 .1]);

lgd.FontSize = 20;
%}

% wavelengthString = num2str(round( ((1/fMaxTpx2)/1e3)*100 )/100 );
% legend(h(1),'Uncoated MT (n=3)','Interpreter','latex');%,...
% legend(h(2),'TPX2, initial coating (n=4)','Interpreter','latex');%,...
% legend(h(3),'TPX2, after instability (n=6)','Interpreter','latex');%,...
% legend(h(4),'Avg. $\lambda$ = ',wavelengthString,' $\mum$','Interpreter','latex');

legend boxoff

%lgd.FontSize = 20;
%lgd.Interpreter='latex';

%{
legend('TPX2, initial coating (n=5)',...
    'TPX2-CT (n=4)',...
    'Kinesin1 (n=3)',...
    'Naked MT (n=3)')
%}

legend('boxoff');

% xafz = 14;
% yafz = 14;
% tvfz = 12;

xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;
doLatex = 1;
simplePlotFormat( 'Spatial frequency (nm$^{-1}$)', 'Power (nm/Hz)', xafz, yafz, tvfz, axesLw, doLatex )
% simplePlotFormat( 'f (nm^{-1})', 'Average |P(f)| +/- average SEM (nm/Hz)', xafz, yafz, tvfz )

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/main text avg amplitude spectra TPX2_15nm uncoated mt'])
    
    %saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/avg amplitude spectra TPX2_20nm TPX2_15nm TPX2_12nm'])

    %saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/avg amplitude spectra TPX2init TPX2cTerm kinesin1 naked mt'])

end