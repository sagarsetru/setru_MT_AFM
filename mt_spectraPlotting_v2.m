% Sagar Setru
% 2019 09 27 

% add to path
addpath(genpath('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis'))


% define cutoff frequency for plotting
f_cutoff = .00099; %units nm^-1

saveDirMain =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures';

%%

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/avgSpectra_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
avgSpectra_kin_1 = avgSpectra.*1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/stdSpectra_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
stdSpectra_kin_1 = stdSpectra.*1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/spectra_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
n_kin_1 = size(P1s,2);
spectra_kin_1 = P1s.*1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-73-140_cy_mt-y-124-133/frequencies_c_cx_mt-x-73-140_cy_mt-y-124-133.mat')
f_kin_1=f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-93-182_cy_mt-y-176-150/avgSpectra_c_cx_mt-x-93-182_cy_mt-y-176-150.mat')
avgSpectra_kin_2 = avgSpectra.*1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-93-182_cy_mt-y-176-150/stdSpectra_c_cx_mt-x-93-182_cy_mt-y-176-150.mat')
stdSpectra_kin_2 = stdSpectra.*1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-93-182_cy_mt-y-176-150/spectra_c_cx_mt-x-93-182_cy_mt-y-176-150.mat')
n_kin_2 = size(P1s,2);
spectra_kin_2 = P1s.*1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_kinesin_20190715_197-202/c_cx_mt-x-93-182_cy_mt-y-176-150/frequencies_c_cx_mt-x-93-182_cy_mt-y-176-150.mat')
f_kin_2 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f




load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt2/Stack_kinesin_2019 07 16_expt2_298-300/c_cx_mt-x-192-322_cy_mt-y-134-253/avgSpectra_c_cx_mt-x-192-322_cy_mt-y-134-253.mat')
avgSpectra_kin_3 = avgSpectra.*1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt2/Stack_kinesin_2019 07 16_expt2_298-300/c_cx_mt-x-192-322_cy_mt-y-134-253/stdSpectra_c_cx_mt-x-192-322_cy_mt-y-134-253.mat')
stdSpectra_kin_3 = stdSpectra.*1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt2/Stack_kinesin_2019 07 16_expt2_298-300/c_cx_mt-x-192-322_cy_mt-y-134-253/spectra_c_cx_mt-x-192-322_cy_mt-y-134-253.mat')
n_kin_3 = size(P1s,2);
spectra_kin_3 = P1s.*1e9;

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt2/Stack_kinesin_2019 07 16_expt2_298-300/c_cx_mt-x-192-322_cy_mt-y-134-253/frequencies_c_cx_mt-x-192-322_cy_mt-y-134-253.mat')
f_kin_3 = f;

clear avgSpectra
clear stdSpectra
clear P1s
clear f

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 11 08 kinesin brb80/expt2 kinesin/tifStacks_expt2_kinesin_20191108/Stack_expt2_kin_26-28_20191108_rigidBody/c_cx_mt-x-6-140_cy_mt-y-72-135';
fNameStruct = loadSpectralDataFromDir(pathName);

load(fNameStruct.avgSpectra)
avgSpectra_kin_4 = avgSpectra;

load(fNameStruct.stdSpectra)
stdSpectra_kin_4 = stdSpectra;

load(fNameStruct.spectra)

if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_kin_4 = size(P1s,2);
    spectra_kin_4 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_kin_4 = P1s;
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
clear f


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
    spectra_kin_5 = P1s;
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
clear f


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
    spectra_kin_6 = P1s;
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
clear f


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
    spectra_kin_7 = P1s;
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
clear f


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
    spectra_kin_8 = P1s;
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
clear f


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
    spectra_kin_9 = P1s;
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
clear f

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
    spectra_kin_10 = P1s;
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
clear f



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
    spectra_kin_11 = P1s;
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
clear f



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
    spectra_kin_12 = P1s;
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
clear f


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
    spectra_kin_13 = P1s;
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
clear f


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
    spectra_kin_14 = P1s;
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
clear f


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
    spectra_kin_15 = P1s;
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
clear f


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
    spectra_kin_16 = P1s;
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
clear f


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
    spectra_kin_17 = P1s;
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
clear f


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
    spectra_kin_18 = P1s;
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
clear f


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
    spectra_kin_19 = P1s;
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
clear f

%% kinesin spectra statistical analysis

% generate cell of frequencies
fAll_kin = {...
    f_kin_1(f_kin_1>f_cutoff),...
    f_kin_2(f_kin_2>f_cutoff),...
    f_kin_3(f_kin_3>f_cutoff),...
    f_kin_4(f_kin_4>f_cutoff),...
    f_kin_5(f_kin_5>f_cutoff),...
    f_kin_6(f_kin_6>f_cutoff),...
    f_kin_7(f_kin_7>f_cutoff),...
    f_kin_8(f_kin_8>f_cutoff),...
    f_kin_9(f_kin_9>f_cutoff),...
    f_kin_10(f_kin_10>f_cutoff),...
    f_kin_11(f_kin_11>f_cutoff),...
    f_kin_12(f_kin_12>f_cutoff),...
    f_kin_13(f_kin_13>f_cutoff),...
    f_kin_14(f_kin_14>f_cutoff),...
    f_kin_15(f_kin_15>f_cutoff),...
    f_kin_16(f_kin_16>f_cutoff),...
    f_kin_17(f_kin_17>f_cutoff),...
    f_kin_18(f_kin_18>f_cutoff),...
    f_kin_19(f_kin_19>f_cutoff),...
    };

% generate cell of logical indices for indexing spectra
logIndAll_kin = {...
    (f_kin_1>f_cutoff),...
    (f_kin_2>f_cutoff),...
    (f_kin_3>f_cutoff),...
    (f_kin_4>f_cutoff),...
    (f_kin_5>f_cutoff),...
    (f_kin_6>f_cutoff),...
    (f_kin_7>f_cutoff),...
    (f_kin_8>f_cutoff),...
    (f_kin_9>f_cutoff),...
    (f_kin_10>f_cutoff),...
    (f_kin_11>f_cutoff),...
    (f_kin_12>f_cutoff),...
    (f_kin_13>f_cutoff),...
    (f_kin_14>f_cutoff),...
    (f_kin_15>f_cutoff),...
    (f_kin_16>f_cutoff),...
    (f_kin_17>f_cutoff),...
    (f_kin_18>f_cutoff),...
    (f_kin_19>f_cutoff),...
    };


% generate cell of spectra
spectraAll_kin = {...
    spectra_kin_1,...
    spectra_kin_2,...
    spectra_kin_3,...
    spectra_kin_4,...
    spectra_kin_5,...
    spectra_kin_6,...
    spectra_kin_7,...
    spectra_kin_8,...
    spectra_kin_9,...
    spectra_kin_10,...
    spectra_kin_11,...
    spectra_kin_12,...
    spectra_kin_13,...
    spectra_kin_14,...
    spectra_kin_15,...
    spectra_kin_16,...
    spectra_kin_17,...
    spectra_kin_18,...
    spectra_kin_19,...
    };

% number of boot strap iterations
nboot = 10000;
ci_alpha = .05; % default for 95% is .05

% do linear interp and bootstrap
[fLin_kin,spectraAll_lin_kin,avgSpectra_lin_kin,ci_avgSpectra_lin_kin] = interpBootstrpSpectra(fAll_kin,spectraAll_kin,logIndAll_kin,nboot,ci_alpha);

subDir = 'spectra_kin';
saveDirMain2 = [saveDirMain,'/',subDir];
if ~isdir(saveDirMain2)
    mkdir(saveDirMain2)
end

% save mat file of all linear kinesin spectra
save([saveDirMain2,'/spectraAll_lin_kin.mat'],'spectraAll_lin_kin')

% save mat file of kinesin linear indices
save([saveDirMain2,'/fLin_kin.mat'],'fLin_kin')

% save mat file for boot strap avg and conf ints.
save([saveDirMain2,'/avgSpectra_lin_kin'],'avgSpectra_lin_kin')
save([saveDirMain2,'/ci_avgSpectra_lin_kin'],'ci_avgSpectra_lin_kin')


%%

% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166/avgSpectra_c_cx_mt-x-76-109_cy_mt-y-254-166.mat')
% avgSpectra_tpcterm_1 = avgSpectra;
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166/stdSpectra_c_cx_mt-x-76-109_cy_mt-y-254-166.mat')
% stdSpectra_tpcterm_1 = stdSpectra;
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166/spectra_c_cx_mt-x-76-109_cy_mt-y-254-166.mat')
% n_tpcterm_1 = size(P1s,2);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166/frequencies_c_cx_mt-x-76-109_cy_mt-y-254-166.mat')
% f_tpcterm_1 = f;
% 
% clear avgSpectra
% clear stdSpectra
% clear P1s
% clear f
% 
% 
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-119-200_cy_mt-y-247-185/avgSpectra_c_cx_mt-x-119-200_cy_mt-y-247-185.mat')
% avgSpectra_tpcterm_2 = avgSpectra;
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-119-200_cy_mt-y-247-185/stdSpectra_c_cx_mt-x-119-200_cy_mt-y-247-185.mat')
% stdSpectra_tpcterm_2 = stdSpectra;
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-119-200_cy_mt-y-247-185/spectra_c_cx_mt-x-119-200_cy_mt-y-247-185.mat')
% n_tpcterm_2 = size(P1s,2);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-119-200_cy_mt-y-247-185/frequencies_c_cx_mt-x-119-200_cy_mt-y-247-185.mat')
% f_tpcterm_2 = f;
% 
% clear avgSpectra
% clear stdSpectra
% clear P1s
% clear f
% 
% 
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-4-45_cy_mt-y-99-5/avgSpectra_c_cx_mt-x-4-45_cy_mt-y-99-5.mat')
% avgSpectra_tpcterm_3 = avgSpectra;
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-4-45_cy_mt-y-99-5/stdSpectra_c_cx_mt-x-4-45_cy_mt-y-99-5.mat')
% stdSpectra_tpcterm_3 = stdSpectra;
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-4-45_cy_mt-y-99-5/spectra_c_cx_mt-x-4-45_cy_mt-y-99-5.mat')
% n_tpcterm_3 = size(P1s,2);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-4-45_cy_mt-y-99-5/frequencies_c_cx_mt-x-4-45_cy_mt-y-99-5.mat')
% f_tpcterm_3 = f;
% 
% clear avgSpectra
% clear stdSpectra
% clear P1s
% clear f
% 
% 
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-101-195_cy_mt-y-169-132/avgSpectra_c_cx_mt-x-101-195_cy_mt-y-169-132.mat')
% avgSpectra_tpcterm_4 = avgSpectra;
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-101-195_cy_mt-y-169-132/stdSpectra_c_cx_mt-x-101-195_cy_mt-y-169-132.mat')
% stdSpectra_tpcterm_4 = stdSpectra;
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-101-195_cy_mt-y-169-132/spectra_c_cx_mt-x-101-195_cy_mt-y-169-132.mat')
% n_tpcterm_4 = size(P1s,2);
% 
% load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-101-195_cy_mt-y-169-132/frequencies_c_cx_mt-x-101-195_cy_mt-y-169-132.mat')
% f_tpcterm_4 = f;
% 
% clear avgSpectra
% clear stdSpectra
% clear P1s
% clear f

pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-76-109_cy_mt-y-254-166';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_tpcterm_1 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_tpcterm_1 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_tpcterm_1 = size(P1s,2);
    spectra_tpcterm_1 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpcterm_1 = P1s;
    n_tpcterm_1 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_tpcterm_1 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt5 3x tpx2 cterm 300nM 900nM/expt5_tifStacks/Substack_expt5_20191031_3xTpx2cTerm_282-286_stackReg/c_cx_mt-x-119-200_cy_mt-y-247-185';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_tpcterm_2 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_tpcterm_2 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_tpcterm_2 = size(P1s,2);
    spectra_tpcterm_2 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpcterm_2 = P1s;
    n_tpcterm_2 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_tpcterm_2 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s
clear f

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-4-45_cy_mt-y-99-5';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_tpcterm_3 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_tpcterm_3 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_tpcterm_3 = size(P1s,2);
    spectra_tpcterm_3 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpcterm_3 = P1s;
    n_tpcterm_3 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_tpcterm_3 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_224-226_stackReg/c_cx_mt-x-101-195_cy_mt-y-169-132';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.avgSpectra)
avgSpectra_tpcterm_4 = avgSpectra/1e9;
 
load(fNameStruct.stdSpectra)
stdSpectra_tpcterm_4 = stdSpectra/1e9;
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    n_tpcterm_4 = size(P1s,2);
    spectra_tpcterm_4 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpcterm_4 = P1s;
    n_tpcterm_4 = size(P1s,2);
    clear indsForAverage
end
    
load(fNameStruct.f)
f_tpcterm_4 = f;
 
clear fNameStruct
clear pathName
clear avgSpectra
clear stdSpectra
clear P1s
clear f


%% tpx2 c term statistical analysis
% generate cell of frequencies
fAll_tpcterm = {...
    f_tpcterm_1(f_tpcterm_1>f_cutoff),...
    f_tpcterm_2(f_tpcterm_2>f_cutoff),...
    f_tpcterm_3(f_tpcterm_3>f_cutoff),...
    f_tpcterm_4(f_tpcterm_4>f_cutoff),...
%     f_tpcterm_5(f_tpcterm_5>f_cutoff),...
%     f_tpcterm_6(f_tpcterm_6>f_cutoff),...
%     f_tpcterm_7(f_tpcterm_7>f_cutoff),...
%     f_tpcterm_8(f_tpcterm_8>f_cutoff),...
%     f_tpcterm_9(f_tpcterm_9>f_cutoff),...
%     f_tpcterm_10(f_tpcterm_10>f_cutoff),...
%     f_tpcterm_11(f_tpcterm_11>f_cutoff),...
%     f_tpcterm_12(f_tpcterm_12>f_cutoff),...
%     f_tpcterm_13(f_tpcterm_13>f_cutoff),...
%     f_tpcterm_14(f_tpcterm_14>f_cutoff),...
%     f_tpcterm_15(f_tpcterm_15>f_cutoff),...
%     f_tpcterm_16(f_tpcterm_16>f_cutoff),...
%     f_tpcterm_17(f_tpcterm_17>f_cutoff),...
%     f_tpcterm_18(f_tpcterm_18>f_cutoff),...
%     f_tpcterm_19(f_tpcterm_19>f_cutoff),...
    };
 
% generate cell of logical indices for indexing spectra
logIndAll_tpcterm = {...
    (f_tpcterm_1>f_cutoff),...
    (f_tpcterm_2>f_cutoff),...
    (f_tpcterm_3>f_cutoff),...
    (f_tpcterm_4>f_cutoff),...
%     (f_tpcterm_5>f_cutoff),...
%     (f_tpcterm_6>f_cutoff),...
%     (f_tpcterm_7>f_cutoff),...
%     (f_tpcterm_8>f_cutoff),...
%     (f_tpcterm_9>f_cutoff),...
%     (f_tpcterm_10>f_cutoff),...
%     (f_tpcterm_11>f_cutoff),...
%     (f_tpcterm_12>f_cutoff),...
%     (f_tpcterm_13>f_cutoff),...
%     (f_tpcterm_14>f_cutoff),...
%     (f_tpcterm_15>f_cutoff),...
%     (f_tpcterm_16>f_cutoff),...
%     (f_tpcterm_17>f_cutoff),...
%     (f_tpcterm_18>f_cutoff),...
%     (f_tpcterm_19>f_cutoff),...
    };
 
 
% generate cell of spectra
spectraAll_tpcterm = {...
    spectra_tpcterm_1,...
    spectra_tpcterm_2,...
    spectra_tpcterm_3,...
    spectra_tpcterm_4,...
%     spectra_tpcterm_5,...
%     spectra_tpcterm_6,...
%     spectra_tpcterm_7,...
%     spectra_tpcterm_8,...
%     spectra_tpcterm_9,...
%     spectra_tpcterm_10,...
%     spectra_tpcterm_11,...
%     spectra_tpcterm_12,...
%     spectra_tpcterm_13,...
%     spectra_tpcterm_14,...
%     spectra_tpcterm_15,...
%     spectra_tpcterm_16,...
%     spectra_tpcterm_17,...
%     spectra_tpcterm_18,...
%     spectra_tpcterm_19,...
    };
 
% number of boot strap iterations
nboot = 10000;
ci_alpha = .05; % default for 95% is .05
 
% do linear interp and bootstrap
[fLin_tpcterm,spectraAll_lin_tpcterm,avgSpectra_lin_tpcterm,ci_avgSpectra_lin_tpcterm] = interpBootstrpSpectra(fAll_tpcterm,spectraAll_tpcterm,logIndAll_tpcterm,nboot,ci_alpha);
 
subDir = 'spectra_tpcterm';
saveDirMain2 = [saveDirMain,'/',subDir];
if ~isdir(saveDirMain2)
    mkdir(saveDirMain2)
end
 
% save mat file of all linear tpctermesin spectra
save([saveDirMain2,'/spectraAll_lin_tpcterm.mat'],'spectraAll_lin_tpcterm')
 
% save mat file of tpctermesin linear indices
save([saveDirMain2,'/fLin_tpcterm.mat'],'fLin_tpcterm')
 
% save mat file for boot strap avg and conf ints.
save([saveDirMain2,'/avgSpectra_lin_tpcterm'],'avgSpectra_lin_tpcterm')
save([saveDirMain2,'/ci_avgSpectra_lin_tpcterm'],'ci_avgSpectra_lin_tpcterm')



%% tpx2, conc2 (100-300nM)


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-74-232_cy_mt-y-66-171';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_1 = P1s.*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_1 = P1s.*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_1 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-112-182_cy_mt-y-288-250';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_2 = P1s.*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_2 = P1s.*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_2 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-189-228_cy_mt-y-287-236';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_3 = P1s.*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_3 = P1s.*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_3 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_90-91/c_cx_mt-x-219-209_cy_mt-y-3-132';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_4 = P1s.*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_4 = P1s.*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_4 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-180-144_cy_mt-y-234-287';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_5 = P1s.*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_5 = P1s.*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_5 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-179_cy_mt-y-92-117';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_6 = P1s.*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_6 = P1s.*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_6 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_7 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_7 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_7 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_8 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_8 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_8 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_9 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_9 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_9 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-67-150_cy_mt-y-168-138';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_10 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_10 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_10 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-211-247_cy_mt-y-126-63';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_11 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_11 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_11 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-41-117_cy_mt-y-162-123';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_12 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_12 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_12 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_181-183_strackReg/c_cx_mt-x-4-149_cy_mt-y-75-121';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_13 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_13 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_13 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-3-110_cy_mt-y-174-128';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_14 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_14 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_14 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-229-204_cy_mt-y-132-251';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_15 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_15 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_15 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-165-167_cy_mt-y-148-253';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_16 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_16 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_16 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_184-186_strackReg/c_cx_mt-x-110-76_cy_mt-y-162-235';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc2_17 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc2_17 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc2_17 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f

%% tpx2 conc2 (100-300nM) stats analysis
% generate cell of frequencies
fAll_tpx2_conc2 = {...
    f_tpx2_conc2_1(f_tpx2_conc2_1>f_cutoff),...
    f_tpx2_conc2_2(f_tpx2_conc2_2>f_cutoff),...
    f_tpx2_conc2_3(f_tpx2_conc2_3>f_cutoff),...
    f_tpx2_conc2_4(f_tpx2_conc2_4>f_cutoff),...
    f_tpx2_conc2_5(f_tpx2_conc2_5>f_cutoff),...
    f_tpx2_conc2_6(f_tpx2_conc2_6>f_cutoff),...
    f_tpx2_conc2_7(f_tpx2_conc2_7>f_cutoff),...
    f_tpx2_conc2_8(f_tpx2_conc2_8>f_cutoff),...
    f_tpx2_conc2_9(f_tpx2_conc2_9>f_cutoff),...
    f_tpx2_conc2_10(f_tpx2_conc2_10>f_cutoff),...
    f_tpx2_conc2_11(f_tpx2_conc2_11>f_cutoff),...
    f_tpx2_conc2_12(f_tpx2_conc2_12>f_cutoff),...
    f_tpx2_conc2_13(f_tpx2_conc2_13>f_cutoff),...
    f_tpx2_conc2_14(f_tpx2_conc2_14>f_cutoff),...
    f_tpx2_conc2_15(f_tpx2_conc2_15>f_cutoff),...
    f_tpx2_conc2_16(f_tpx2_conc2_16>f_cutoff),...
    f_tpx2_conc2_17(f_tpx2_conc2_17>f_cutoff),...
    };
 
% generate cell of logical indices for indexing spectra below cutoff
% frequency
logIndAll_tpx2_conc2 = {...
    (f_tpx2_conc2_1>f_cutoff),...
    (f_tpx2_conc2_2>f_cutoff),...
    (f_tpx2_conc2_3>f_cutoff),...
    (f_tpx2_conc2_4>f_cutoff),...
    (f_tpx2_conc2_5>f_cutoff),...
    (f_tpx2_conc2_6>f_cutoff),...
    (f_tpx2_conc2_7>f_cutoff),...
    (f_tpx2_conc2_8>f_cutoff),...
    (f_tpx2_conc2_9>f_cutoff),...
    (f_tpx2_conc2_10>f_cutoff),...
    (f_tpx2_conc2_11>f_cutoff),...
    (f_tpx2_conc2_12>f_cutoff),...
    (f_tpx2_conc2_13>f_cutoff),...
    (f_tpx2_conc2_14>f_cutoff),...
    (f_tpx2_conc2_15>f_cutoff),...
    (f_tpx2_conc2_16>f_cutoff),...
    (f_tpx2_conc2_17>f_cutoff),...
    };
 
 
% generate cell of spectra
spectraAll_tpx2_conc2 = {...
    spectra_tpx2_conc2_1,...
    spectra_tpx2_conc2_2,...
    spectra_tpx2_conc2_3,...
    spectra_tpx2_conc2_4,...
    spectra_tpx2_conc2_5,...
    spectra_tpx2_conc2_6,...
    spectra_tpx2_conc2_7,...
    spectra_tpx2_conc2_8,...
    spectra_tpx2_conc2_9,...
    spectra_tpx2_conc2_10,...
    spectra_tpx2_conc2_11,...
    spectra_tpx2_conc2_12,...
    spectra_tpx2_conc2_13,...
    spectra_tpx2_conc2_14,...
    spectra_tpx2_conc2_15,...
    spectra_tpx2_conc2_16,...
    spectra_tpx2_conc2_17,...
    };
 
% number of boot strap iterations
nboot = 10000;
ci_alpha = .05; % default for 95% is .05

% do linear interp and bootstrap
[fLin_tpx2_conc2,...
    spectraAll_lin_tpx2_conc2,...
    avgSpectra_lin_tpx2_conc2,...
    ci_avgSpectra_lin_tpx2_conc2,...
    avgMaxLmbd_tpx2_conc2,...
    stdMaxLmbd_tpx2_conc2] = interpBootstrpSpectra(fAll_tpx2_conc2,spectraAll_tpx2_conc2,logIndAll_tpx2_conc2,nboot,ci_alpha);

subDir = 'spectra_tpx2_conc2';
saveDirMain2 = [saveDirMain,'/',subDir];
if ~isdir(saveDirMain2)
    mkdir(saveDirMain2)
end
 
% save mat file of all linear tpx2_conc2 spectra
save([saveDirMain2,'/spectraAll_lin_tpx2_conc2.mat'],'spectraAll_lin_tpx2_conc2')
 
% save mat file of tpx2_conc2 linear indices
save([saveDirMain2,'/fLin_tpx2_conc2.mat'],'fLin_tpx2_conc2')

% get the peak wavelength
aMaxTpx2_conc2 = max(mean(avgSpectra_lin_tpx2_conc2));
aMaxTpx2_conc2_Ind = find(mean(avgSpectra_lin_tpx2_conc2)==aMaxTpx2_conc2);
fMaxTpx2_conc2 = fLin_tpx2_conc2(aMaxTpx2_conc2_Ind);
lmbdMaxTpx2_conc2 = 1/fMaxTpx2_conc2;
save([saveDirMain2,'/lmbdMaxTpx2_conc2'],'lmbdMaxTpx2_conc2')

 
% save mat file for boot strap avg and conf ints.
save([saveDirMain2,'/avgSpectra_lin_tpx2_conc2'],'avgSpectra_lin_tpx2_conc2')
save([saveDirMain2,'/ci_avgSpectra_lin_tpx2_conc2'],'ci_avgSpectra_lin_tpx2_conc2')
save([saveDirMain2,'/avgMaxLmbd_tpx2_conc2'],'avgMaxLmbd_tpx2_conc2')
save([saveDirMain2,'/stdMaxLmbd_tpx2_conc2'],'stdMaxLmbd_tpx2_conc2')


%% load data for tpx2 conc1, 50-150nM


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_1 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_1 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_1 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-96-253_cy_mt-y-31-153';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_2 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_2 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_2 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_60-62_20191028_stackReg_rigidBody/c_cx_mt-x-84-147_cy_mt-y-52-193';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_3 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_3 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_3 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-110-38_cy_mt-y-59-247';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_4 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_4 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_4 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_5 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_5 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_5 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_6 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_6 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_6 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_26-29_20191028_rigidBody/c_cx_mt-x-154-168_cy_mt-y-126-171';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_7 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_7 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_7 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-56-89_cy_mt-y-55-15';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_8 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_8 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_8 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-124-189_cy_mt-y-108-143';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_9 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_9 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_9 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-115-166_cy_mt-y-95-108';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_10 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_10 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_10 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_30-32_20191028_rigidBody/c_cx_mt-x-153-179_cy_mt-y-2-73';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_11 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_11 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_11 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_12 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_12 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_12 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_13 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_13 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_13 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-164-249_cy_mt-y-113-228';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_14 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_14 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_14 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-32-122_cy_mt-y-144-112';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_15 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_15 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_15 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_63-67_20191028_stackReg_rigidBody/c_cx_mt-x-195-243_cy_mt-y-177-247';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_16 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_16 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_16 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_68-72_20191028_stackReg_rigidBody/c_cx_mt-x-173-253_cy_mt-y-16-57';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_17 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_17 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_17 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_33-36_20191028_rigidBody/c_cx_mt-x-193-250_cy_mt-y-106-67';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc1_18 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc1_18 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc1_18 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



%% lin interp and bootstrap for conc1 (50-150nM tpx2)

% generate cell of frequencies
fAll_tpx2_conc1 = {...
    f_tpx2_conc1_1(f_tpx2_conc1_1>f_cutoff),...
    f_tpx2_conc1_2(f_tpx2_conc1_2>f_cutoff),...
    f_tpx2_conc1_3(f_tpx2_conc1_3>f_cutoff),...
    f_tpx2_conc1_4(f_tpx2_conc1_4>f_cutoff),...
    f_tpx2_conc1_5(f_tpx2_conc1_5>f_cutoff),...
    f_tpx2_conc1_6(f_tpx2_conc1_6>f_cutoff),...
    f_tpx2_conc1_7(f_tpx2_conc1_7>f_cutoff),...
    f_tpx2_conc1_8(f_tpx2_conc1_8>f_cutoff),...
    f_tpx2_conc1_9(f_tpx2_conc1_9>f_cutoff),...
    f_tpx2_conc1_10(f_tpx2_conc1_10>f_cutoff),...
    f_tpx2_conc1_11(f_tpx2_conc1_11>f_cutoff),...
    f_tpx2_conc1_12(f_tpx2_conc1_12>f_cutoff),...
    f_tpx2_conc1_13(f_tpx2_conc1_13>f_cutoff),...
    f_tpx2_conc1_14(f_tpx2_conc1_14>f_cutoff),...
    f_tpx2_conc1_15(f_tpx2_conc1_15>f_cutoff),...
    f_tpx2_conc1_16(f_tpx2_conc1_16>f_cutoff),...
    f_tpx2_conc1_17(f_tpx2_conc1_17>f_cutoff),...
    f_tpx2_conc1_18(f_tpx2_conc1_18>f_cutoff),...
    };
 
% generate cell of logical indices for indexing spectra
logIndAll_tpx2_conc1 = {...
    (f_tpx2_conc1_1>f_cutoff),...
    (f_tpx2_conc1_2>f_cutoff),...
    (f_tpx2_conc1_3>f_cutoff),...
    (f_tpx2_conc1_4>f_cutoff),...
    (f_tpx2_conc1_5>f_cutoff),...
    (f_tpx2_conc1_6>f_cutoff),...
    (f_tpx2_conc1_7>f_cutoff),...
    (f_tpx2_conc1_8>f_cutoff),...
    (f_tpx2_conc1_9>f_cutoff),...
    (f_tpx2_conc1_10>f_cutoff),...
    (f_tpx2_conc1_11>f_cutoff),...
    (f_tpx2_conc1_12>f_cutoff),...
    (f_tpx2_conc1_13>f_cutoff),...
    (f_tpx2_conc1_14>f_cutoff),...
    (f_tpx2_conc1_15>f_cutoff),...
    (f_tpx2_conc1_16>f_cutoff),...
    (f_tpx2_conc1_17>f_cutoff),...
    (f_tpx2_conc1_18>f_cutoff),...
    };
 
 
% generate cell of spectra
spectraAll_tpx2_conc1 = {...
    spectra_tpx2_conc1_1,...
    spectra_tpx2_conc1_2,...
    spectra_tpx2_conc1_3,...
    spectra_tpx2_conc1_4,...
    spectra_tpx2_conc1_5,...
    spectra_tpx2_conc1_6,...
    spectra_tpx2_conc1_7,...
    spectra_tpx2_conc1_8,...
    spectra_tpx2_conc1_9,...
    spectra_tpx2_conc1_10,...
    spectra_tpx2_conc1_11,...
    spectra_tpx2_conc1_12,...
    spectra_tpx2_conc1_13,...
    spectra_tpx2_conc1_14,...
    spectra_tpx2_conc1_15,...
    spectra_tpx2_conc1_16,...
    spectra_tpx2_conc1_17,...
    spectra_tpx2_conc1_18,...
    };
 
% number of boot strap iterations
nboot = 10000;
ci_alpha = .05; % default for 95% is .05
 
% do linear interp and bootstrap
[fLin_tpx2_conc1,...
    spectraAll_lin_tpx2_conc1,...
    avgSpectra_lin_tpx2_conc1,...
    ci_avgSpectra_lin_tpx2_conc1,...
    avgMaxLmbd_tpx2_conc1,...
    stdMaxLmbd_tpx2_conc1] = interpBootstrpSpectra(fAll_tpx2_conc1,spectraAll_tpx2_conc1,logIndAll_tpx2_conc1,nboot,ci_alpha);
 
subDir = 'spectra_tpx2_conc1';
saveDirMain2 = [saveDirMain,'/',subDir];
if ~isdir(saveDirMain2)
    mkdir(saveDirMain2)
end
 
% save mat file of all linear tpx2_conc1esin spectra
save([saveDirMain2,'/spectraAll_lin_tpx2_conc1.mat'],'spectraAll_lin_tpx2_conc1')
 
% save mat file of tpx2_conc1esin linear indices
save([saveDirMain2,'/fLin_tpx2_conc1.mat'],'fLin_tpx2_conc1')

aMaxTpx2_conc1 = max(mean(avgSpectra_lin_tpx2_conc1));
aMaxTpx2_conc1_Ind = find(mean(avgSpectra_lin_tpx2_conc1)==aMaxTpx2_conc1);
fMaxTpx2_conc1 = fLin_tpx2_conc1(aMaxTpx2_conc1_Ind);
lmbdMaxTpx2_conc1 = 1/fMaxTpx2_conc1;

% save mat file for boot strap avg and conf ints.
save([saveDirMain2,'/avgSpectra_lin_tpx2_conc1'],'avgSpectra_lin_tpx2_conc1')
save([saveDirMain2,'/ci_avgSpectra_lin_tpx2_conc1'],'ci_avgSpectra_lin_tpx2_conc1')
save([saveDirMain2,'/avgMaxf_tpx2_conc1'],'avgMaxLmbd_tpx2_conc1')
save([saveDirMain2,'/lmbdMaxTpx2_conc1'],'lmbdMaxTpx2_conc1')
save([saveDirMain2,'/stdMaxLmbd_tpx2_conc1'],'stdMaxLmbd_tpx2_conc1')


%% load data for 4x tpx2 conc (400-1200nM)

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-237-461_cy_mt-y-43-364';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc4_1 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc4_1 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc4_1 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Substack_412-420_stackReg_affine/c_cx_mt-x-233-209_cy_mt-y-8-223';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc4_2 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc4_2 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc4_2 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-275-371_cy_mt-y-148-16';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc4_3 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc4_3 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc4_3 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-229-355_cy_mt-y-281-362';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc4_4 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc4_4 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc4_4 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-3-99_cy_mt-y-32-4';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc4_5 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc4_5 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc4_5 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-208-374_cy_mt-y-246-12';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc4_6 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc4_6 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc4_6 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_422-424_20191031_stackReg_rigidBody/c_cx_mt-x-167-329_cy_mt-y-2-490';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc4_7 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc4_7 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc4_7 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


% pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-105-189_cy_mt-y-139-199';
% pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-162-314_cy_mt-y-496-405';
pathName =       '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_275-278_stackReg_affine/c_cx_mt-x-171-315_cy_mt-y-493-406';

fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc4_8 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc4_8 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc4_8 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f

%% lin interp and bootstrap for conc4 (400-1200 nM)

% generate cell of frequencies
fAll_tpx2_conc4 = {...
    f_tpx2_conc4_1(f_tpx2_conc4_1>f_cutoff),...
    f_tpx2_conc4_2(f_tpx2_conc4_2>f_cutoff),...
    f_tpx2_conc4_4(f_tpx2_conc4_4>f_cutoff),...
    f_tpx2_conc4_5(f_tpx2_conc4_5>f_cutoff),...
    f_tpx2_conc4_6(f_tpx2_conc4_6>f_cutoff),...
    f_tpx2_conc4_7(f_tpx2_conc4_7>f_cutoff)...
    f_tpx2_conc4_8(f_tpx2_conc4_8>f_cutoff),...
    };
 
% generate cell of logical indices for indexing spectra
logIndAll_tpx2_conc4 = {...
    (f_tpx2_conc4_1>f_cutoff),...
    (f_tpx2_conc4_2>f_cutoff),...
    (f_tpx2_conc4_4>f_cutoff),...
    (f_tpx2_conc4_5>f_cutoff),...
    (f_tpx2_conc4_6>f_cutoff),...
    (f_tpx2_conc4_7>f_cutoff)...
    (f_tpx2_conc4_8>f_cutoff),...
    };
 
 
% generate cell of spectra
spectraAll_tpx2_conc4 = {...
    spectra_tpx2_conc4_1,...
    spectra_tpx2_conc4_2,...
    spectra_tpx2_conc4_4,...
    spectra_tpx2_conc4_5,...
    spectra_tpx2_conc4_6,...
    spectra_tpx2_conc4_7...
    spectra_tpx2_conc4_8,...
    };
 
% number of boot strap iterations
nboot = 10000;
ci_alpha = .05; % default for 95% is .05
 
% do linear interp and bootstrap
[fLin_tpx2_conc4,...
    spectraAll_lin_tpx2_conc4,...
    avgSpectra_lin_tpx2_conc4,...
    ci_avgSpectra_lin_tpx2_conc4,...
    avgMaxLmbd_tpx2_conc4,...
    stdMaxLmbd_tpx2_conc4] = interpBootstrpSpectra(fAll_tpx2_conc4,spectraAll_tpx2_conc4,logIndAll_tpx2_conc4,nboot,ci_alpha);
 
subDir = 'spectra_tpx2_conc4';
saveDirMain2 = [saveDirMain,'/',subDir];
if ~isdir(saveDirMain2)
    mkdir(saveDirMain2)
end
 
% save mat file of all linear tpx2_conc4esin spectra
save([saveDirMain2,'/spectraAll_lin_tpx2_conc4.mat'],'spectraAll_lin_tpx2_conc4')
 
% save mat file of tpx2_conc4 linear indices
save([saveDirMain2,'/fLin_tpx2_conc4.mat'],'fLin_tpx2_conc4')

% get the peak wavelength
aMaxTpx2_conc4 = max(mean(avgSpectra_lin_tpx2_conc4));
aMaxTpx2_conc4_Ind = find(mean(avgSpectra_lin_tpx2_conc4)==aMaxTpx2_conc4);
fMaxTpx2_conc4 = fLin_tpx2_conc4(aMaxTpx2_conc4_Ind);
lmbdMaxTpx2_conc4 = 1/fMaxTpx2_conc4;

% save mat file for boot strap avg and conf ints.
save([saveDirMain2,'/avgSpectra_lin_tpx2_conc4'],'avgSpectra_lin_tpx2_conc4')
save([saveDirMain2,'/ci_avgSpectra_lin_tpx2_conc4'],'ci_avgSpectra_lin_tpx2_conc4')
save([saveDirMain2,'/avgMaxLmbd_tpx2_conc4'],'avgMaxLmbd_tpx2_conc4')
save([saveDirMain2,'/stdMaxLmbd_tpx2_conc4'],'stdMaxLmbd_tpx2_conc4')
save([saveDirMain2,'/lmbdMaxTpx2_conc4'],'lmbdMaxTpx2_conc4')



%% load data for conc3, 300-900 nM TPX2

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_114-116_affine/c_cx_mt-x-379-442_cy_mt-y-2-207';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_1 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_1 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_1 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-65-305_cy_mt-y-233-445';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_2 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_2 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_2 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-178-10_cy_mt-y-203-283';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_3 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_3 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_3 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-180-207_cy_mt-y-42-253';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_4 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_4 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_4 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_5 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_5 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_5 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_6 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_6 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_6 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_7 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_7 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_7 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-170-369_cy_mt-y-121-176';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_8 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_8 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_8 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-216-503_cy_mt-y-173-504';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_9 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_9 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_9 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_248-250_stackReg/c_cx_mt-x-260-464_cy_mt-y-334-506';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_10 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_10 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_10 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-224-171_cy_mt-y-355-508';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_11 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_11 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_11 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_119-120_affine/c_cx_mt-x-234-355_cy_mt-y-352-315';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_12 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_12 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_12 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_13 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_13 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_13 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_117-118_affine/c_cx_mt-x-76-308_cy_mt-y-3-321';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_conc3_14 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_conc3_14 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_conc3_14 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


%% lin interp and bootstrp for conc3 (300-900nM)

% generate cell of frequencies
fAll_tpx2_conc3 = {...
    f_tpx2_conc3_1(f_tpx2_conc3_1>f_cutoff),...
    f_tpx2_conc3_2(f_tpx2_conc3_2>f_cutoff),...
    f_tpx2_conc3_3(f_tpx2_conc3_3>f_cutoff),...
    f_tpx2_conc3_4(f_tpx2_conc3_4>f_cutoff),...
    f_tpx2_conc3_5(f_tpx2_conc3_5>f_cutoff),...
    f_tpx2_conc3_6(f_tpx2_conc3_6>f_cutoff),...
    f_tpx2_conc3_7(f_tpx2_conc3_7>f_cutoff),...
    f_tpx2_conc3_8(f_tpx2_conc3_8>f_cutoff),...
    f_tpx2_conc3_9(f_tpx2_conc3_9>f_cutoff),...
    f_tpx2_conc3_10(f_tpx2_conc3_10>f_cutoff),...
    f_tpx2_conc3_11(f_tpx2_conc3_11>f_cutoff),...
    f_tpx2_conc3_12(f_tpx2_conc3_12>f_cutoff),...
    f_tpx2_conc3_13(f_tpx2_conc3_13>f_cutoff),...
    f_tpx2_conc3_14(f_tpx2_conc3_14>f_cutoff),...
    };
 
% generate cell of logical indices for indexing spectra
logIndAll_tpx2_conc3 = {...
    (f_tpx2_conc3_1>f_cutoff),...
    (f_tpx2_conc3_2>f_cutoff),...
    (f_tpx2_conc3_3>f_cutoff),...
    (f_tpx2_conc3_4>f_cutoff),...
    (f_tpx2_conc3_5>f_cutoff),...
    (f_tpx2_conc3_6>f_cutoff),...
    (f_tpx2_conc3_7>f_cutoff),...
    (f_tpx2_conc3_8>f_cutoff),...
    (f_tpx2_conc3_9>f_cutoff),...
    (f_tpx2_conc3_10>f_cutoff),...
    (f_tpx2_conc3_11>f_cutoff),...
    (f_tpx2_conc3_12>f_cutoff),...
    (f_tpx2_conc3_13>f_cutoff),...
    (f_tpx2_conc3_14>f_cutoff),...
    };
 
 
% generate cell of spectra
spectraAll_tpx2_conc3 = {...
    spectra_tpx2_conc3_1,...
    spectra_tpx2_conc3_2,...
    spectra_tpx2_conc3_3,...
    spectra_tpx2_conc3_4,...
    spectra_tpx2_conc3_5,...
    spectra_tpx2_conc3_6,...
    spectra_tpx2_conc3_7,...
    spectra_tpx2_conc3_8,...
    spectra_tpx2_conc3_9,...
    spectra_tpx2_conc3_10,...
    spectra_tpx2_conc3_11,...
    spectra_tpx2_conc3_12,...
    spectra_tpx2_conc3_13,...
    spectra_tpx2_conc3_14,...
    };
 
% number of boot strap iterations
nboot = 10000;
ci_alpha = .05; % default for 95% is .05
 
% do linear interp and bootstrap
[fLin_tpx2_conc3,...
    spectraAll_lin_tpx2_conc3,...
    avgSpectra_lin_tpx2_conc3,...
    ci_avgSpectra_lin_tpx2_conc3,...
    avgMaxLmbd_tpx2_conc3,...
    stdMaxLmbd_tpx2_conc3] = interpBootstrpSpectra(fAll_tpx2_conc3,spectraAll_tpx2_conc3,logIndAll_tpx2_conc3,nboot,ci_alpha);
 
subDir = 'spectra_tpx2_conc3';
saveDirMain2 = [saveDirMain,'/',subDir];
if ~isdir(saveDirMain2)
    mkdir(saveDirMain2)
end
 
% save mat file of all linear tpx2_conc3esin spectra
save([saveDirMain2,'/spectraAll_lin_tpx2_conc3.mat'],'spectraAll_lin_tpx2_conc3')
 
% save mat file of tpx2_conc3 linear indices
save([saveDirMain2,'/fLin_tpx2_conc3.mat'],'fLin_tpx2_conc3')
 
% get the peak wavelength
aMaxTpx2_conc3 = max(mean(avgSpectra_lin_tpx2_conc3));
aMaxTpx2_conc3_Ind = find(mean(avgSpectra_lin_tpx2_conc3)==aMaxTpx2_conc3);
fMaxTpx2_conc3 = fLin_tpx2_conc3(aMaxTpx2_conc3_Ind);
lmbdMaxTpx2_conc3 = 1/fMaxTpx2_conc3;
save([saveDirMain2,'/lmbdMaxTpx2_conc3'],'lmbdMaxTpx2_conc3')

% save mat file for boot strap avg and conf ints.
save([saveDirMain2,'/avgSpectra_lin_tpx2_conc3'],'avgSpectra_lin_tpx2_conc3')
save([saveDirMain2,'/ci_avgSpectra_lin_tpx2_conc3'],'ci_avgSpectra_lin_tpx2_conc3')
save([saveDirMain2,'/avgMaxLmbd_tpx2_conc3'],'avgMaxLmbd_tpx2_conc3')
save([saveDirMain2,'/stdMaxLmbd_tpx2_conc3'],'stdMaxLmbd_tpx2_conc3')


%% tpx2 initially coated

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-69-187_cy_mt-y-66-145';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_1 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_1 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_1 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/c_cx_mt-x-168-229_cy_mt-y-256-222';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_2 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_2 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_2 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-146-180_cy_mt-y-285-231';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_3 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_3 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_3 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f




pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/c_cx_mt-x-114-172_cy_mt-y-93-116';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_4 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_4 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_4 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_5 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_5 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_5 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-2-159_cy_mt-y-153-254';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_6 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_6 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_6 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-124-180_cy_mt-y-57-122';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_7 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_7 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_7 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-161-210_cy_mt-y-29-93';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_8 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_8 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_8 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-120-202_cy_mt-y-103-171';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_9 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_9 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_9 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/initCoated/c_cx_mt-x-80-118_cy_mt-y-86-204';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_10 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_10 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_10 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/initCoated/c_cx_mt-x-5-227_cy_mt-y-143-125';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_11 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_11 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_11 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/initCoated/c_cx_mt-x-111-245_cy_mt-y-162-195';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_12 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_12 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_12 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_13 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_13 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_13 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/initCoated/c_cx_mt-x-114-127_cy_mt-y-3-117';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_14  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_14 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_14 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-51-23_cy_mt-y-3-117';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_15  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_15 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_15 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-74-124_cy_mt-y-103-246';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_16  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_16 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_16 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-183-207_cy_mt-y-45-253';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_17  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_17 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_17 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/initCoated/c_cx_mt-x-28-233_cy_mt-y-244-73';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_18  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_18 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_18 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/initCoated/c_cx_mt-x-2-60_cy_mt-y-174-214';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_19  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_19 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_19 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/initCoated/c_cx_mt-x-118-215_cy_mt-y-105-41';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_20 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_20 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_20 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-254-187_cy_mt-y-29-131';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_21  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_21 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_21 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-173-159_cy_mt-y-2-118';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_22  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_22 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_22 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/expt10_tifStacks/Stack_expt10_395-420_20191031_units_nm/initCoated/c_cx_mt-x-35-112_cy_mt-y-2-74';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_23  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_23 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_23 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/initCoated/c_cx_mt-x-167-221_cy_mt-y-255-225';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_24  = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_24 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_24 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =  '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/initCoated/c_cx_mt-x-7-84_cy_mt-y-14-31';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_tpx2_init_25 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_tpx2_init_25 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_tpx2_init_25 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


%% tpx2_init spectra interp and bootstrap
 
% generate cell of frequencies
fAll_tpx2_init = {...
    f_tpx2_init_1(f_tpx2_init_1>f_cutoff),...
    f_tpx2_init_2(f_tpx2_init_2>f_cutoff),...
    f_tpx2_init_3(f_tpx2_init_3>f_cutoff),...
    f_tpx2_init_4(f_tpx2_init_4>f_cutoff),...
    f_tpx2_init_5(f_tpx2_init_5>f_cutoff),...
    f_tpx2_init_6(f_tpx2_init_6>f_cutoff),...
    f_tpx2_init_7(f_tpx2_init_7>f_cutoff),...
    f_tpx2_init_8(f_tpx2_init_8>f_cutoff),...
    f_tpx2_init_9(f_tpx2_init_9>f_cutoff),...
    f_tpx2_init_10(f_tpx2_init_10>f_cutoff),...
    f_tpx2_init_11(f_tpx2_init_11>f_cutoff),...
    f_tpx2_init_12(f_tpx2_init_12>f_cutoff),...
    f_tpx2_init_13(f_tpx2_init_13>f_cutoff),...
    f_tpx2_init_14(f_tpx2_init_14>f_cutoff),...
    f_tpx2_init_15(f_tpx2_init_15>f_cutoff),...
    f_tpx2_init_16(f_tpx2_init_16>f_cutoff),...
    f_tpx2_init_17(f_tpx2_init_17>f_cutoff),...
    f_tpx2_init_18(f_tpx2_init_18>f_cutoff),...
    f_tpx2_init_19(f_tpx2_init_19>f_cutoff),...
    f_tpx2_init_20(f_tpx2_init_20>f_cutoff),...
    f_tpx2_init_21(f_tpx2_init_21>f_cutoff),...
    f_tpx2_init_22(f_tpx2_init_22>f_cutoff),...
    f_tpx2_init_23(f_tpx2_init_23>f_cutoff),...
    f_tpx2_init_24(f_tpx2_init_24>f_cutoff),...
    f_tpx2_init_25(f_tpx2_init_25>f_cutoff),...
    };
 
% generate cell of logical indices for indexing spectra
logIndAll_tpx2_init = {...
    (f_tpx2_init_1>f_cutoff),...
    (f_tpx2_init_2>f_cutoff),...
    (f_tpx2_init_3>f_cutoff),...
    (f_tpx2_init_4>f_cutoff),...
    (f_tpx2_init_5>f_cutoff),...
    (f_tpx2_init_6>f_cutoff),...
    (f_tpx2_init_7>f_cutoff),...
    (f_tpx2_init_8>f_cutoff),...
    (f_tpx2_init_9>f_cutoff),...
    (f_tpx2_init_10>f_cutoff),...
    (f_tpx2_init_11>f_cutoff),...
    (f_tpx2_init_12>f_cutoff),...
    (f_tpx2_init_13>f_cutoff),...
    (f_tpx2_init_14>f_cutoff),...
    (f_tpx2_init_15>f_cutoff),...
    (f_tpx2_init_16>f_cutoff),...
    (f_tpx2_init_17>f_cutoff),...
    (f_tpx2_init_18>f_cutoff),...
    (f_tpx2_init_19>f_cutoff),...
    (f_tpx2_init_20>f_cutoff),...
    (f_tpx2_init_21>f_cutoff),...
    (f_tpx2_init_22>f_cutoff),...
    (f_tpx2_init_23>f_cutoff),...
    (f_tpx2_init_24>f_cutoff),...
    (f_tpx2_init_25>f_cutoff),...
    };
 
 
% generate cell of spectra
spectraAll_tpx2_init = {...
    spectra_tpx2_init_1,...
    spectra_tpx2_init_2,...
    spectra_tpx2_init_3,...
    spectra_tpx2_init_4,...
    spectra_tpx2_init_5,...
    spectra_tpx2_init_6,...
    spectra_tpx2_init_7,...
    spectra_tpx2_init_8,...
    spectra_tpx2_init_9,...
    spectra_tpx2_init_10,...
    spectra_tpx2_init_11,...
    spectra_tpx2_init_12,...
    spectra_tpx2_init_13,...
    spectra_tpx2_init_14,...
    spectra_tpx2_init_15,...
    spectra_tpx2_init_16,...
    spectra_tpx2_init_17,...
    spectra_tpx2_init_18,...
    spectra_tpx2_init_19,...
    spectra_tpx2_init_20,...
    spectra_tpx2_init_21,...
    spectra_tpx2_init_22,...
    spectra_tpx2_init_23,...
    spectra_tpx2_init_24,...
    spectra_tpx2_init_25,...
    };
 
% number of boot strap iterations
nboot = 10000;
ci_alpha = .05; % default for 95% is .05
 
% do linear interp and bootstrap
[fLin_tpx2_init,spectraAll_lin_tpx2_init,avgSpectra_lin_tpx2_init,ci_avgSpectra_lin_tpx2_init] = interpBootstrpSpectra(fAll_tpx2_init,spectraAll_tpx2_init,logIndAll_tpx2_init,nboot,ci_alpha);
 
subDir = 'spectra_tpx2_init';
saveDirMain2 = [saveDirMain,'/',subDir];
if ~isdir(saveDirMain2)
    mkdir(saveDirMain2)
end
 
% save mat file of all linear tpx2_initesin spectra
save([saveDirMain2,'/spectraAll_lin_tpx2_init.mat'],'spectraAll_lin_tpx2_init')
 
% save mat file of tpx2_initesin linear indices
save([saveDirMain2,'/fLin_tpx2_init.mat'],'fLin_tpx2_init')
 
% save mat file for boot strap avg and conf ints.
save([saveDirMain2,'/avgSpectra_lin_tpx2_init'],'avgSpectra_lin_tpx2_init')
save([saveDirMain2,'/ci_avgSpectra_lin_tpx2_init'],'ci_avgSpectra_lin_tpx2_init')



%% load naked MT

pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 15/kinesin spike in at saturation/Stack_nakedMT_20190715_137-143/c_cx_mt-x-182-148_cy_mt-y-82-156';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    % using too many late spectra here; removed many
    spectra_uncoated_1 = P1s(:,1)*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_1 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_1 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f




pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/c_cx_mt-x-458-522_cy_mt-y-452-494';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    % same as above
    spectra_uncoated_2 = P1s(:,2)*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_2 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_2 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f




pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_nakedMT_20190713_0-4/xc2yc2_c_cx_mt-x-432-492_cy_mt-y-516-496';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_3 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_3 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_3 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f 



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-3-84_cy_mt-y-27-43';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_4 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_4 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_4 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f 


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-2-148_cy_mt-y-166-252';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_5 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_5 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_5 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f 



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-154-203_cy_mt-y-22-90';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_6 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_6 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_6 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f 


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/uncoated/c_cx_mt-x-115-157_cy_mt-y-60-96';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_7 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_7 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_7 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f 


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-108-183_cy_mt-y-95-156';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_8 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_8 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_8 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/uncoated/c_cx_mt-x-75-124_cy_mt-y-75-224';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_9 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_9 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_9 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/uncoated/c_cx_mt-x-2-144_cy_mt-y-109-95';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_10 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_10 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_10 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/uncoated/c_cx_mt-x-41-183_cy_mt-y-114-148';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_11 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_11 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_11 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_187-189_strackReg/uncoated/c_cx_mt-x-189-253_cy_mt-y-3-137';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_12 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_12 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_12 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_187-189_strackReg/uncoated/c_cx_mt-x-1-80_cy_mt-y-117-137';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_13 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_13 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_13 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_187-189_strackReg/uncoated/c_cx_mt-x-80-169_cy_mt-y-181-165';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_14 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_14 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_14 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt2 3x tpx2-cTerm 300nM 900nM/expt2_tifStacks/Stack_expt2_20191031_3xTpx2Cterm_187-189_strackReg/uncoated/c_cx_mt-x-2-41_cy_mt-y-179-172';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_15 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_15 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_15 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-3-100_cy_mt-y-200-148';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_16 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_16 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_16 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-229-255_cy_mt-y-2-164';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_17 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_17 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_17 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_227-228_units_nm/uncoated/c_cx_mt-x-205-255_cy_mt-y-90-246';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_18 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_18 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_18 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_251-252_units_nm/uncoated/c_cx_mt-x-91-168_cy_mt-y-27-181';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_19 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_19 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_19 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_251-252_units_nm/uncoated/c_cx_mt-x-109-172_cy_mt-y-113-253';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_20 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_20 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_20 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_251-252_units_nm/uncoated/c_cx_mt-x-120-165_cy_mt-y-99-189';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_21 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_21 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_21 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_251-252_units_nm/uncoated/c_cx_mt-x-120-156_cy_mt-y-109-183';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_22 = P1s;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_22 = P1s;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_22 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f

pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/mt_expt10_Tpx2fl_4x.0_00394/uncoated/c_cx_mt-x-86-158_cy_mt-y-138-249';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_23 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_23 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_23 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f

pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt10 4x tpx2fl 300nM 1200nM/mt_expt10_Tpx2fl_4x.0_00394/uncoated/c_cx_mt-x-48-98_cy_mt-y-126-192';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_24 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_24 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_24 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 13/Stack_tpx2_20190713_68-89/uncoated/c_cx_mt-x-153-183_cy_mt-y-268-225';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_25 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_25 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_25 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f



pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/uncoated/c_cx_mt-x-119-197_cy_mt-y-115-174';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_26 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_26 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_26 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f

pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/uncoated/c_cx_mt-x-158-209_cy_mt-y-263-234';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_27 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_27 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_27 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f


pathName =     '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/Stack_225-261/uncoated/c_cx_mt-x-202-229_cy_mt-y-263-232';
fNameStruct = loadSpectralDataFromDir(pathName);
 
load(fNameStruct.spectra)
 
if strcmp(fNameStruct.indsForAverage,'USE ALL IN SPECTRA VARIABLE')
    spectra_uncoated_28 = P1s*1e9;
else
    load(fNameStruct.indsForAverage)
    P1s = P1s(:,indsForAverage);
    spectra_uncoated_28 = P1s*1e9;
    clear indsForAverage
end

load(fNameStruct.f)
f_uncoated_28 = f;
 
clear fNameStruct
clear pathName
clear P1s
clear f

%% uncoated spectra interp and bootstrap
 
% generate cell of frequencies
fAll_uncoated = {...
    f_uncoated_1(f_uncoated_1>f_cutoff),...
    f_uncoated_2(f_uncoated_2>f_cutoff),...
    f_uncoated_3(f_uncoated_3>f_cutoff),...
    f_uncoated_4(f_uncoated_4>f_cutoff),...
    f_uncoated_5(f_uncoated_5>f_cutoff),...
    f_uncoated_6(f_uncoated_6>f_cutoff),...
    f_uncoated_7(f_uncoated_7>f_cutoff),...
    f_uncoated_8(f_uncoated_8>f_cutoff),...
    f_uncoated_9(f_uncoated_9>f_cutoff),...
    f_uncoated_10(f_uncoated_10>f_cutoff),...
    f_uncoated_11(f_uncoated_11>f_cutoff),...
    f_uncoated_12(f_uncoated_12>f_cutoff),...
    f_uncoated_13(f_uncoated_13>f_cutoff),...
    f_uncoated_14(f_uncoated_14>f_cutoff),...
    f_uncoated_15(f_uncoated_15>f_cutoff),...
    f_uncoated_16(f_uncoated_16>f_cutoff),...
    f_uncoated_17(f_uncoated_17>f_cutoff),...
    f_uncoated_18(f_uncoated_18>f_cutoff),...
    f_uncoated_19(f_uncoated_19>f_cutoff),...
    f_uncoated_20(f_uncoated_20>f_cutoff),...
    f_uncoated_21(f_uncoated_21>f_cutoff),...
    f_uncoated_22(f_uncoated_22>f_cutoff),...
    f_uncoated_23(f_uncoated_23>f_cutoff),...
    f_uncoated_24(f_uncoated_24>f_cutoff),...
    f_uncoated_25(f_uncoated_25>f_cutoff),...
    f_uncoated_26(f_uncoated_26>f_cutoff),...
    f_uncoated_27(f_uncoated_27>f_cutoff),...
    f_uncoated_28(f_uncoated_28>f_cutoff),...
    };
 
% generate cell of logical indices for indexing spectra
logIndAll_uncoated = {...
    (f_uncoated_1>f_cutoff),...
    (f_uncoated_2>f_cutoff),...
    (f_uncoated_3>f_cutoff),...
    (f_uncoated_4>f_cutoff),...
    (f_uncoated_5>f_cutoff),...
    (f_uncoated_6>f_cutoff),...
    (f_uncoated_7>f_cutoff),...
    (f_uncoated_8>f_cutoff),...
    (f_uncoated_9>f_cutoff),...
    (f_uncoated_10>f_cutoff),...
    (f_uncoated_11>f_cutoff),...
    (f_uncoated_12>f_cutoff),...
    (f_uncoated_13>f_cutoff),...
    (f_uncoated_14>f_cutoff),...
    (f_uncoated_15>f_cutoff),...
    (f_uncoated_16>f_cutoff),...
    (f_uncoated_17>f_cutoff),...
    (f_uncoated_18>f_cutoff),...
    (f_uncoated_19>f_cutoff),...
    (f_uncoated_20>f_cutoff),...
    (f_uncoated_21>f_cutoff),...
    (f_uncoated_22>f_cutoff),...
    (f_uncoated_23>f_cutoff),...
    (f_uncoated_24>f_cutoff),...
    (f_uncoated_25>f_cutoff),...
    (f_uncoated_26>f_cutoff),...
    (f_uncoated_27>f_cutoff),...
    (f_uncoated_28>f_cutoff),...
    };
 
 
% generate cell of spectra
spectraAll_uncoated = {...
    spectra_uncoated_1,...
    spectra_uncoated_2,...
    spectra_uncoated_3,...
    spectra_uncoated_4,...
    spectra_uncoated_5,...
    spectra_uncoated_6,...
    spectra_uncoated_7,...
    spectra_uncoated_8,...
    spectra_uncoated_9,...
    spectra_uncoated_10,...
    spectra_uncoated_11,...
    spectra_uncoated_12,...
    spectra_uncoated_13,...
    spectra_uncoated_14,...
    spectra_uncoated_15,...
    spectra_uncoated_16,...
    spectra_uncoated_17,...
    spectra_uncoated_18,...
    spectra_uncoated_19,...
    spectra_uncoated_20,...
    spectra_uncoated_21,...
    spectra_uncoated_22,...
    spectra_uncoated_23,...
    spectra_uncoated_24,...
    spectra_uncoated_25,...
    spectra_uncoated_26,...
    spectra_uncoated_27,...
    spectra_uncoated_28,...
    };
 
% number of boot strap iterations
nboot = 10000;
ci_alpha = .05; % default for 95% is .05
 
% do linear interp and bootstrap
[fLin_uncoated,spectraAll_lin_uncoated,avgSpectra_lin_uncoated,ci_avgSpectra_lin_uncoated] = interpBootstrpSpectra(fAll_uncoated,spectraAll_uncoated,logIndAll_uncoated,nboot,ci_alpha);
 
subDir = 'spectra_uncoated';
saveDirMain2 = [saveDirMain,'/',subDir];
if ~isdir(saveDirMain2)
    mkdir(saveDirMain2)
end
 
% save mat file of all linear uncoatedesin spectra
save([saveDirMain2,'/spectraAll_lin_uncoated.mat'],'spectraAll_lin_uncoated')
 
% save mat file of uncoatedesin linear indices
save([saveDirMain2,'/fLin_uncoated.mat'],'fLin_uncoated')
 
% save mat file for boot strap avg and conf ints.
save([saveDirMain2,'/avgSpectra_lin_uncoated'],'avgSpectra_lin_uncoated')
save([saveDirMain2,'/ci_avgSpectra_lin_uncoated'],'ci_avgSpectra_lin_uncoated')


 
%% do plotting


% load all data
% kin
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_kin/avgSpectra_lin_kin.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_kin/ci_avgSpectra_lin_kin.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_kin/fLin_kin.mat')

% tpcterm
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpcterm/avgSpectra_lin_tpcterm.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpcterm/ci_avgSpectra_lin_tpcterm.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpcterm/fLin_tpcterm.mat')

% tpx2_conc_1
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/avgSpectra_lin_tpx2_conc1.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/ci_avgSpectra_lin_tpx2_conc1.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/fLin_tpx2_conc1.mat')

% tpx2_conc_2
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/avgSpectra_lin_tpx2_conc2.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/ci_avgSpectra_lin_tpx2_conc2.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/fLin_tpx2_conc2.mat')

% tpx2_conc_3
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/avgSpectra_lin_tpx2_conc3.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/ci_avgSpectra_lin_tpx2_conc3.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/fLin_tpx2_conc3.mat')

% tpx2_conc_4
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/avgSpectra_lin_tpx2_conc4.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/ci_avgSpectra_lin_tpx2_conc4.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/fLin_tpx2_conc4.mat')

% tpx2 init
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_init/avgSpectra_lin_tpx2_init.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_init/ci_avgSpectra_lin_tpx2_init.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_init/fLin_tpx2_init.mat')

% uncoated
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_uncoated/avgSpectra_lin_uncoated.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_uncoated/ci_avgSpectra_lin_uncoated.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_uncoated/fLin_uncoated.mat')

% get max values for each conc
aMaxTpx2_conc1 = max(mean(avgSpectra_lin_tpx2_conc1));
aMaxTpx2_conc1_Ind = find(mean(avgSpectra_lin_tpx2_conc1)==aMaxTpx2_conc1);
fMaxTpx2_conc1 = fLin_tpx2_conc1(aMaxTpx2_conc1_Ind);

aMaxTpx2_conc2 = max(mean(avgSpectra_lin_tpx2_conc2));
aMaxTpx2_conc2_Ind = find(mean(avgSpectra_lin_tpx2_conc2)==aMaxTpx2_conc2);
fMaxTpx2_conc2 = fLin_tpx2_conc2(aMaxTpx2_conc2_Ind);

aMaxTpx2_conc3 = max(mean(avgSpectra_lin_tpx2_conc3));
aMaxTpx2_conc3_Ind = find(mean(avgSpectra_lin_tpx2_conc3)==aMaxTpx2_conc3);
fMaxTpx2_conc3 = fLin_tpx2_conc3(aMaxTpx2_conc3_Ind);

aMaxTpx2_conc4 = max(mean(avgSpectra_lin_tpx2_conc4));
aMaxTpx2_conc4_Ind = find(mean(avgSpectra_lin_tpx2_conc4)==aMaxTpx2_conc4);
fMaxTpx2_conc4 = fLin_tpx2_conc4(aMaxTpx2_conc4_Ind);

%%
%
% all four tpx2 conc, kinesin, init coated, uncoated
%

doSave = 0;

% set colors
kinColor = 'c';
tpx2_conc2Color = 'b';
tpx2_conc1Color = 'g';
tpx2_conc3Color = 'm';
tpx2_conc4Color = 'r';
tpx2_initColor = 'k';
uncoatedColor = [0.6350    0.0780    0.1840];


% kinColor = [0 0 1];
% tpx2_conc2Color = [0 .5 0];
% tpx2_conc1Color = [1 0 0];
% tpx2_conc3Color = [0 .75 .75];
% tpx2_conc4Color = [.75 0 .75];
% tpx2_initColor = [.75 .75 0];
% uncoatedColor = [.25 .25 .25];

% kinColor=[         0    0.4470    0.7410];
% tpx2_conc2Color=[    0.8500    0.3250    0.0980];
% tpx2_conc1Color=[    0.9290    0.6940    0.1250];
% tpx2_conc3Color=[   0.4940    0.1840    0.5560];
% tpx2_conc4Color=[    0.4660    0.6740    0.1880];
% uncoatedColor=[   0.3010    0.7450    0.9330];
% tpx2_initColor=[    0.6350    0.0780    0.1840];

% set linewidth for mean curve
lw = 2;

% set opacity value for 95% conf interval
alphaValCi = .25;

% set xLims
xMin = 0;
xMax = 0.06;


xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;
doLatex = 1;


figure; 
box on;
hold on;

%marker sizes and line widths for id'ing peaks
ms1 = 20;
lw1 = 2;
ms2 = 15;
lw2 = 3;

plot(fLin_uncoated,mean(avgSpectra_lin_uncoated),'Color',uncoatedColor,'LineWidth',lw)
plot(fLin_tpx2_init,mean(avgSpectra_lin_tpx2_init),'Color',tpx2_initColor,'LineWidth',lw)

plot(fLin_tpx2_conc1,mean(avgSpectra_lin_tpx2_conc1),'Color',tpx2_conc1Color,'LineWidth',lw)
plot(fLin_tpx2_conc2,mean(avgSpectra_lin_tpx2_conc2),'Color',tpx2_conc2Color,'LineWidth',lw)
plot(fLin_tpx2_conc3,mean(avgSpectra_lin_tpx2_conc3),'Color',tpx2_conc3Color,'LineWidth',lw)
plot(fLin_tpx2_conc4,mean(avgSpectra_lin_tpx2_conc4),'Color',tpx2_conc4Color,'LineWidth',lw)
plot(fMaxTpx2_conc1,aMaxTpx2_conc1,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1,'LineStyle','none')

plot(fLin_kin,mean(avgSpectra_lin_kin),'Color',kinColor,'LineWidth',lw)


plot(fMaxTpx2_conc1,aMaxTpx2_conc1,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1)%,'MarkerEdgeColor',tpx2_conc1Color)
plot(fMaxTpx2_conc2,aMaxTpx2_conc2,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1)
plot(fMaxTpx2_conc3,aMaxTpx2_conc3,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1)
plot(fMaxTpx2_conc4,aMaxTpx2_conc4,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1)

plot(fMaxTpx2_conc1,aMaxTpx2_conc1,'Color',tpx2_conc1Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)%,'MarkerEdgeColor',tpx2_conc1Color)
plot(fMaxTpx2_conc2,aMaxTpx2_conc2,'Color',tpx2_conc2Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)
plot(fMaxTpx2_conc3,aMaxTpx2_conc3,'Color',tpx2_conc3Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)
plot(fMaxTpx2_conc4,aMaxTpx2_conc4,'Color',tpx2_conc4Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)


shadedplot(fLin_uncoated,ci_avgSpectra_lin_uncoated(1,:),ci_avgSpectra_lin_uncoated(2,:),alphaValCi,uncoatedColor,uncoatedColor);
shadedplot(fLin_tpx2_init,ci_avgSpectra_lin_tpx2_init(1,:),ci_avgSpectra_lin_tpx2_init(2,:),alphaValCi,tpx2_initColor,tpx2_initColor);

shadedplot(fLin_tpx2_conc1,ci_avgSpectra_lin_tpx2_conc1(1,:),ci_avgSpectra_lin_tpx2_conc1(2,:),alphaValCi,tpx2_conc1Color,tpx2_conc1Color);
shadedplot(fLin_tpx2_conc2,ci_avgSpectra_lin_tpx2_conc2(1,:),ci_avgSpectra_lin_tpx2_conc2(2,:),alphaValCi,tpx2_conc2Color,tpx2_conc2Color);
shadedplot(fLin_tpx2_conc3,ci_avgSpectra_lin_tpx2_conc3(1,:),ci_avgSpectra_lin_tpx2_conc3(2,:),alphaValCi,tpx2_conc3Color,tpx2_conc3Color);
shadedplot(fLin_tpx2_conc4,ci_avgSpectra_lin_tpx2_conc4(1,:),ci_avgSpectra_lin_tpx2_conc4(2,:),alphaValCi,tpx2_conc4Color,tpx2_conc4Color);

shadedplot(fLin_kin,ci_avgSpectra_lin_kin(1,:),ci_avgSpectra_lin_kin(2,:),alphaValCi,kinColor,kinColor);


simplePlotFormat( 'Inverse wavelength $1/\lambda$ (nm$^{-1}$)', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )

legend({'Uncoated MT',...
    'TPX2 initial coating',...
    '0.1 $\pm$ 0.05 $\mu$M TPX2',...
    '0.2 $\pm$ 0.1 $\mu$M TPX2',...
    '0.6 $\pm$ 0.3 $\mu$M TPX2',...
    '0.8 $\pm$ 0.4 $\mu$M TPX2',...
    'Peak wavelengths',...
    '1 $\pm$ 0.5 $\mu$M Kinesin-1'},...
    'Interpreter','latex',...
    'FontSize',14,...
    'Position',[.685 .685 .1 .1])

legend boxoff

set(gca, 'XScale', 'log')
xlim([xMin xMax])

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','spectraAvged_allConditions'])
end


%% just uncoated, initial, final for 0.2uM

doSave = 0;

% set colors
tpx2_conc2Color = 'r';
tpx2_initColor = 'b';
uncoatedColor = 'k';

% set linewidth for mean curve
lw = 2;

% set opacity value for 95% conf interval
alphaValCi = .25;

% set xLims
xMin = 0;
xMax = 0.08;


xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;


figure; 
box on;
hold on;

%marker sizes and line widths for id'ing peaks
ms1 = 20;
lw1 = 2;
ms2 = 15;
lw2 = 3;

plot(fLin_uncoated,mean(avgSpectra_lin_uncoated),'Color',uncoatedColor,'LineWidth',lw)
plot(fLin_tpx2_init,mean(avgSpectra_lin_tpx2_init),'Color',tpx2_initColor,'LineWidth',lw)
plot(fLin_tpx2_conc2,mean(avgSpectra_lin_tpx2_conc2),'Color',tpx2_conc2Color,'LineWidth',lw)

% plot(fLin_uncoated,mean(avgSpectra_lin_uncoated).^2,'Color',uncoatedColor,'LineWidth',lw)
% plot(fLin_tpx2_init,mean(avgSpectra_lin_tpx2_init).^2,'Color',tpx2_initColor,'LineWidth',lw)
% plot(fLin_tpx2_conc2,mean(avgSpectra_lin_tpx2_conc2).^2,'Color',tpx2_conc2Color,'LineWidth',lw)


% plot(fMaxTpx2_conc2,aMaxTpx2_conc2.^2,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1,'LineStyle','none')
plot(fMaxTpx2_conc2,aMaxTpx2_conc2,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1,'LineStyle','none')

% plot(fMaxTpx2_conc2,aMaxTpx2_conc2,'Color',tpx2_conc2Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)
% errorbar(fMaxTpx2_conc2,aMaxTpx2_conc2,...
%     0,0,...
%     (1/stdMaxLmbd_tpx2_conc2)/1,(1/stdMaxLmbd_tpx2_conc2)/1,'Color',tpx2_conc2Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)


shadedplot(fLin_uncoated,ci_avgSpectra_lin_uncoated(1,:),ci_avgSpectra_lin_uncoated(2,:),alphaValCi,uncoatedColor,uncoatedColor);
shadedplot(fLin_tpx2_init,ci_avgSpectra_lin_tpx2_init(1,:),ci_avgSpectra_lin_tpx2_init(2,:),alphaValCi,tpx2_initColor,tpx2_initColor);
shadedplot(fLin_tpx2_conc2,ci_avgSpectra_lin_tpx2_conc2(1,:),ci_avgSpectra_lin_tpx2_conc2(2,:),alphaValCi,tpx2_conc2Color,tpx2_conc2Color);

% shadedplot(fLin_uncoated,ci_avgSpectra_lin_uncoated(1,:).^2,ci_avgSpectra_lin_uncoated(2,:).^2,alphaValCi,uncoatedColor,uncoatedColor);
% shadedplot(fLin_tpx2_init,ci_avgSpectra_lin_tpx2_init(1,:).^2,ci_avgSpectra_lin_tpx2_init(2,:).^2,alphaValCi,tpx2_initColor,tpx2_initColor);
% shadedplot(fLin_tpx2_conc2,ci_avgSpectra_lin_tpx2_conc2(1,:).^2,ci_avgSpectra_lin_tpx2_conc2(2,:).^2,alphaValCi,tpx2_conc2Color,tpx2_conc2Color);


% doLatex = 1;
% simplePlotFormat( 'Inverse wavelength $1/\lambda$ (nm$^{-1}$)', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )

doLatex = 0;
simplePlotFormat( 'Inverse wavelength 1/\lambda (nm^{-1})', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )


legend({'Uncoated',...
    'Initially coated',...
    'After droplet formation',...
    'Mean \lambda = 260 \pm 20 nm'},...
    'FontSize',18,...
    'Position',[.64 .68 .1 .21])

% legend({'Uncoated',...
%     'Initially coated',...
%     'After droplet formation',...
%     'Mean $\lambda$ = 260 $\pm$ 20 nm'},...
%     'Interpreter','latex',...
%     'FontSize',18,...
%     'Position',[.64 .68 .1 .21])

legend boxoff

set(gca, 'XScale', 'log')
xlim([xMin xMax])

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_spectraAvged_uncoatedInitConc2'])
end

%%
%
% all four tpx2 conc

doSave = 1;

% set colors
kinColor = 'c';
tpx2_conc2Color = 'b';
tpx2_conc1Color = 'g';
tpx2_conc3Color = 'm';
tpx2_conc4Color = 'r';
tpx2_initColor = 'k';
uncoatedColor = [0.6350    0.0780    0.1840];

% set linewidth for mean curve
lw = 2;

% set opacity value for 95% conf interval
alphaValCi = .25;

% set xLims
xMin = 0;
xMax = 0.06;


xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;


figure; 
box on;
hold on;

%marker sizes and line widths for id'ing peaks
ms1 = 20;
lw1 = 2;
ms2 = 15;
lw2 = 3;


plot(fLin_tpx2_conc1,mean(avgSpectra_lin_tpx2_conc1),'Color',tpx2_conc1Color,'LineWidth',lw)
plot(fLin_tpx2_conc2,mean(avgSpectra_lin_tpx2_conc2),'Color',tpx2_conc2Color,'LineWidth',lw)
plot(fLin_tpx2_conc3,mean(avgSpectra_lin_tpx2_conc3),'Color',tpx2_conc3Color,'LineWidth',lw)
plot(fLin_tpx2_conc4,mean(avgSpectra_lin_tpx2_conc4),'Color',tpx2_conc4Color,'LineWidth',lw)
plot(fMaxTpx2_conc1,aMaxTpx2_conc1,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1,'LineStyle','none')



plot(fMaxTpx2_conc1,aMaxTpx2_conc1,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1)%,'MarkerEdgeColor',tpx2_conc1Color)
plot(fMaxTpx2_conc2,aMaxTpx2_conc2,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1)
plot(fMaxTpx2_conc3,aMaxTpx2_conc3,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1)
plot(fMaxTpx2_conc4,aMaxTpx2_conc4,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1)

plot(fMaxTpx2_conc1,aMaxTpx2_conc1,'Color',tpx2_conc1Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)%,'MarkerEdgeColor',tpx2_conc1Color)
plot(fMaxTpx2_conc2,aMaxTpx2_conc2,'Color',tpx2_conc2Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)
plot(fMaxTpx2_conc3,aMaxTpx2_conc3,'Color',tpx2_conc3Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)
plot(fMaxTpx2_conc4,aMaxTpx2_conc4,'Color',tpx2_conc4Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)


shadedplot(fLin_tpx2_conc1,ci_avgSpectra_lin_tpx2_conc1(1,:),ci_avgSpectra_lin_tpx2_conc1(2,:),alphaValCi,tpx2_conc1Color,tpx2_conc1Color);
shadedplot(fLin_tpx2_conc2,ci_avgSpectra_lin_tpx2_conc2(1,:),ci_avgSpectra_lin_tpx2_conc2(2,:),alphaValCi,tpx2_conc2Color,tpx2_conc2Color);
shadedplot(fLin_tpx2_conc3,ci_avgSpectra_lin_tpx2_conc3(1,:),ci_avgSpectra_lin_tpx2_conc3(2,:),alphaValCi,tpx2_conc3Color,tpx2_conc3Color);
shadedplot(fLin_tpx2_conc4,ci_avgSpectra_lin_tpx2_conc4(1,:),ci_avgSpectra_lin_tpx2_conc4(2,:),alphaValCi,tpx2_conc4Color,tpx2_conc4Color);


% doLatex = 1;
% simplePlotFormat( 'Inverse wavelength $1/\lambda$ (nm$^{-1}$)', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )
% simplePlotFormat( '1/\lambda (nm^{-1})', 'Power (nm)', xafz, yafz, tvfz, axesLw, 0 )

doLatex = 0;
simplePlotFormat( 'Inverse wavelength 1/\lambda (nm^{-1})', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )

% legend({'0.1 $\pm$ 0.05 $\mu$M',...
%     '0.2 $\pm$ 0.1 $\mu$M',...
%     '0.6 $\pm$ 0.3 $\mu$M',...
%     '0.8 $\pm$ 0.4 $\mu$M',...
%     'Peak wavelengths'},...
%     'Interpreter','latex',...
%     'FontSize',14,...
%     'Position',[.685 .75 .1 .1])

legend({'0.1 \pm 0.05 \muM',...
    '0.2 \pm 0.1 \muM',...
    '0.6 \pm 0.3 \muM',...
    '0.8 \pm 0.4 \muM',...
    'Peak wavelengths'},...
    'FontSize',14,...
    'Position',[.685 .75 .1 .1])

% legend({'0.05 -- 0.15 $\mu$M',...
%     '0.1 -- 0.3 $\mu$M',...
%     '0.3 -- 0.9 $\mu$M',...
%     '0.4 -- 1.2 $\mu$M',...
%     'Peak wavelengths'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.685 .71 .1 .1])

legend boxoff

set(gca, 'XScale', 'log')
xlim([xMin xMax])

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_spectraAvged_tpx2Concs'])
end

%%
%
% kinesin, init coated, uncoated
%

doSave = 1;

% set colors
kinColor = 'c';
tpx2_initColor = 'k';
uncoatedColor = [0.6350    0.0780    0.1840];

% set linewidth for mean curve
lw = 2;

% set opacity value for 95% conf interval
alphaValCi = .25;

% set xLims
xMin = 0;
xMax = 0.06;


xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;


figure; 
box on;
hold on;

%marker sizes and line widths for id'ing peaks
ms1 = 20;
lw1 = 2;
ms2 = 15;
lw2 = 3;

plot(fLin_uncoated,mean(avgSpectra_lin_uncoated),'Color',uncoatedColor,'LineWidth',lw)
plot(fLin_tpx2_init,mean(avgSpectra_lin_tpx2_init),'Color',tpx2_initColor,'LineWidth',lw)
plot(fLin_kin,mean(avgSpectra_lin_kin),'Color',kinColor,'LineWidth',lw)


shadedplot(fLin_uncoated,ci_avgSpectra_lin_uncoated(1,:),ci_avgSpectra_lin_uncoated(2,:),alphaValCi,uncoatedColor,uncoatedColor);
shadedplot(fLin_tpx2_init,ci_avgSpectra_lin_tpx2_init(1,:),ci_avgSpectra_lin_tpx2_init(2,:),alphaValCi,tpx2_initColor,tpx2_initColor);
shadedplot(fLin_kin,ci_avgSpectra_lin_kin(1,:),ci_avgSpectra_lin_kin(2,:),alphaValCi,kinColor,kinColor);

% doLatex = 1;
% simplePlotFormat( 'Inverse wavelength $1/\lambda$ (nm$^{-1}$)', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )


doLatex = 0;
simplePlotFormat( 'Inverse wavelength 1/\lambda (nm^{-1})', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )

% legend({'Uncoated MT',...
%     'TPX2 initial coating',...
%     '0.5 -- 1.5 $\mu$M Kinesin-1'},...
%     'Interpreter','latex',...
%     'FontSize',14,...
%     'Position',[.665 .77 .1 .1])

% legend({'Uncoated MT',...
%     'TPX2 initial coating',...
%     '1 $\pm$ 0.5 $\mu$M Kinesin-1'},...
%     'Interpreter','latex',...
%     'FontSize',14,...
%     'Position',[.665 .77 .1 .1])

legend({'Uncoated MT',...
    'TPX2 initial coating',...
    '1 \pm 0.5 \muM Kinesin-1'},...
    'FontSize',14,...
    'Position',[.665 .77 .1 .1])

legend boxoff

set(gca, 'XScale', 'log')
xlim([xMin xMax])

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_spectraAvged_kin_init_uncoated'])
end

%%
%
% kinesin, init coated, uncoated, tpx2 c term
%

doSave = 1;

% set colors
kinColor = 'c';
tpx2_initColor = 'k';
uncoatedColor = [0.6350    0.0780    0.1840];
tpcterm_color = [0.4660    0.6740    0.1880];


% set linewidth for mean curve
lw = 2;

% set opacity value for 95% conf interval
alphaValCi = .25;

% set xLims
xMin = 0;
xMax = 0.06;


xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;


figure; 
box on;
hold on;

%marker sizes and line widths for id'ing peaks
ms1 = 20;
lw1 = 2;
ms2 = 15;
lw2 = 3;

plot(fLin_uncoated,mean(avgSpectra_lin_uncoated),'Color',uncoatedColor,'LineWidth',lw)
plot(fLin_tpx2_init,mean(avgSpectra_lin_tpx2_init),'Color',tpx2_initColor,'LineWidth',lw)
plot(fLin_kin,mean(avgSpectra_lin_kin),'Color',kinColor,'LineWidth',lw)
plot(fLin_tpcterm,mean(avgSpectra_lin_tpcterm),'Color',tpcterm_color,'LineWidth',lw)


shadedplot(fLin_uncoated,ci_avgSpectra_lin_uncoated(1,:),ci_avgSpectra_lin_uncoated(2,:),alphaValCi,uncoatedColor,uncoatedColor);
shadedplot(fLin_tpx2_init,ci_avgSpectra_lin_tpx2_init(1,:),ci_avgSpectra_lin_tpx2_init(2,:),alphaValCi,tpx2_initColor,tpx2_initColor);
shadedplot(fLin_kin,ci_avgSpectra_lin_kin(1,:),ci_avgSpectra_lin_kin(2,:),alphaValCi,kinColor,kinColor);
shadedplot(fLin_tpcterm,ci_avgSpectra_lin_tpcterm(1,:),ci_avgSpectra_lin_tpcterm(2,:),alphaValCi,tpcterm_color,tpcterm_color);

% doLatex=1;
% simplePlotFormat( 'Inverse wavelength $1/\lambda$ (nm$^{-1}$)', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )

doLatex = 0;
simplePlotFormat( 'Inverse wavelength 1/\lambda (nm^{-1})', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )

% legend({'Uncoated MT',...
%     'TPX2 initial coating',...
%     '0.5 -- 1.5 $\mu$M Kinesin-1'},...
%     'Interpreter','latex',...
%     'FontSize',14,...
%     'Position',[.665 .77 .1 .1])

% legend({'Uncoated MT',...
%     'TPX2 initial coating',...
%     '1 $\pm$ 0.5 $\mu$M Kinesin-1',...
%     '0.6 $\pm$ 0.3 $\mu$M C-terminal TPX2'},...
%     'Interpreter','latex',...
%     'FontSize',14,...
%     'Position',[.6 .77 .1 .1])

legend({'Uncoated MT',...
    'TPX2 initial coating',...
    '1 \pm 0.5 \muM Kinesin-1',...
    '0.6 \pm 0.3 \muM C-terminal TPX2'},...
    'FontSize',14,...
    'Position',[.6 .77 .1 .1])

legend boxoff

set(gca, 'XScale', 'log')
xlim([xMin xMax])

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','sansSerif_spectraAvged_kin_init_uncoated_tpcterm'])
end

%%
%
% fl tpx2 conc 3 and tpx2 c term

doSave = 0;

% set colors
tpx2_conc3Color = [0    0.4470    0.7410];
uncoatedColor = 'k';
% str = '#ff6200';
% tpcterm_color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
% tpcterm_color = [0.4660    0.6740    0.1880];
tpcterm_color = [0.8500    0.3250    0.0980];

% set linewidth for mean curve
lw = 2;

% set opacity value for 95% conf interval
alphaValCi = .25;

% set xLims
xMin = 0;
xMax = 0.06;


xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;


figure; 
box on;
hold on;

%marker sizes and line widths for id'ing peaks
ms1 = 20;
lw1 = 2;
ms2 = 15;
lw2 = 3;


plot(fLin_tpx2_conc3,mean(avgSpectra_lin_tpx2_conc3),'Color',tpx2_conc3Color,'LineWidth',lw)

plot(fLin_tpcterm,mean(avgSpectra_lin_tpcterm),'Color',tpcterm_color,'LineWidth',lw)

plot(fLin_uncoated,mean(avgSpectra_lin_uncoated),'Color',uncoatedColor,'LineWidth',lw)

plot(fMaxTpx2_conc3,aMaxTpx2_conc3,'Color','k','Marker','o','MarkerSize',ms1,'LineWidth',lw1,'LineStyle','none')

plot(fMaxTpx2_conc3,aMaxTpx2_conc3,'Color',tpx2_conc3Color,'Marker','o','MarkerSize',ms2,'LineWidth',lw2)



shadedplot(fLin_tpx2_conc3,ci_avgSpectra_lin_tpx2_conc3(1,:),ci_avgSpectra_lin_tpx2_conc3(2,:),alphaValCi,tpx2_conc3Color,tpx2_conc3Color);
shadedplot(fLin_tpcterm,ci_avgSpectra_lin_tpcterm(1,:),ci_avgSpectra_lin_tpcterm(2,:),alphaValCi,tpcterm_color,tpcterm_color);
shadedplot(fLin_uncoated,ci_avgSpectra_lin_uncoated(1,:),ci_avgSpectra_lin_uncoated(2,:),alphaValCi,uncoatedColor,uncoatedColor);


% doLatex = 1;
% simplePlotFormat( 'Inverse wavelength $1/\lambda$ (nm$^{-1}$)', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )
% simplePlotFormat( '1/\lambda (nm^{-1})', 'Power (nm)', xafz, yafz, tvfz, axesLw, 0 )

doLatex = 0;
simplePlotFormat( 'Inverse wavelength 1/\lambda (nm^{-1})', 'Power (nm)', xafz, yafz, tvfz, axesLw, doLatex )

% legend({'0.1 $\pm$ 0.05 $\mu$M',...
%     '0.2 $\pm$ 0.1 $\mu$M',...
%     '0.6 $\pm$ 0.3 $\mu$M',...
%     '0.8 $\pm$ 0.4 $\mu$M',...
%     'Peak wavelengths'},...
%     'Interpreter','latex',...
%     'FontSize',14,...
%     'Position',[.685 .75 .1 .1])

legend({'Full length TPX2 0.6 \pm 0.3 \muM',...
    'C-terminal TPX2 0.6 \pm 0.3 \muM',...
    'Uncoated MT',...
    'Peak wavelength'},...
    'FontSize',14,...
    'Position',[.65 .78 .1 .1])

% legend({'Full length TPX2',...
%     'C-terminal TPX2',...
%     'Uncoated MT',...
%     'Peak wavelength'},...
%     'Interpreter','latex',...
%     'FontSize',14,...
%     'Position',[.685 .75 .1 .1])

% legend({'0.05 -- 0.15 $\mu$M',...
%     '0.1 -- 0.3 $\mu$M',...
%     '0.3 -- 0.9 $\mu$M',...
%     '0.4 -- 1.2 $\mu$M',...
%     'Peak wavelengths'},...
%     'Interpreter','latex',...
%     'FontSize',16,...
%     'Position',[.685 .71 .1 .1])

legend boxoff

set(gca, 'XScale', 'log')
xlim([xMin xMax])

if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','spectraAvged_uncoated_fl_vs_cTerm'])
end

%% heights for kinesin coated mts
kin_h = [...
    24.6+3.7,...
    26.7+3.2,...
    23.8+5.8,...
    23.7+3.9,...
    22.4+5.4,...
    21.6+8.8,...
    19.6+10.8,...
    18.1+5.9,...
    17.7+10.7,...
    19.8+8.6,...
    18.8+8,...
    23+3,...
    21+3.8
    ];

mean(kin_h)
std(kin_h)

tpcterm_h = [...
    24.5+2.9,...
    23.5+7.2,...
    26.5+3.1,...
    26.7+2.1,...
    26.7+2.6,...
    26.3+3.2,...
    26.8+1.6,...
    28.2+1.8,...
    23.0+1.3,...
    27.2+2.2,...
    ];

mean(tpcterm_h)
std(tpcterm_h)