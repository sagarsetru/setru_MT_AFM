%% Sagar Setru
% 2020 08 24
% script to save csv plotted data


%% fig s7a all spectra, fig 2c uncoated, init coated, final coated data

% load data
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

% move to directory
cd('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/manuscript/naturePhysicsSubmission/finalSubmission/csv_plot_data/fig_s7/fig_s7a_all_spectra')

data_s7a_conc1 = [...,
    fLin_tpx2_conc1;...
    mean(avgSpectra_lin_tpx2_conc1).^2;...
    ci_avgSpectra_lin_tpx2_conc1.^2;...
    ];

data_s7a_conc2 = [...,
    fLin_tpx2_conc2;...
    mean(avgSpectra_lin_tpx2_conc2).^2;...
    ci_avgSpectra_lin_tpx2_conc2.^2;...
    ];
 
data_s7a_conc3 = [...,
    fLin_tpx2_conc3;...
    mean(avgSpectra_lin_tpx2_conc3).^2;...
    ci_avgSpectra_lin_tpx2_conc3.^2;...
    ];
 
data_s7a_conc4 = [...,
    fLin_tpx2_conc4;...
    mean(avgSpectra_lin_tpx2_conc4).^2;...
    ci_avgSpectra_lin_tpx2_conc4.^2;...
    ];


data_s7a_kin = [...,
    fLin_kin;...
    mean(avgSpectra_lin_kin).^2;...
    ci_avgSpectra_lin_kin.^2;...
    ];

data_s7a_uncoated = [...,
    fLin_uncoated;...
    mean(avgSpectra_lin_uncoated).^2;...
    ci_avgSpectra_lin_uncoated.^2;...
    ];

data_s7a_init_coated = [...
    fLin_tpx2_init;...
    mean(avgSpectra_lin_tpx2_init).^2;...
    ci_avgSpectra_lin_tpx2_init.^2;...
    ];

data_s7a_tpx2_cterm = [...
    fLin_tpcterm;...
    mean(avgSpectra_lin_tpcterm).^2;...
    ci_avgSpectra_lin_tpcterm.^2;...
    ];

csvwrite('s7a_conc1.csv',data_s7a_conc1)
csvwrite('s7a_conc2.csv',data_s7a_conc2)
csvwrite('s7a_conc3.csv',data_s7a_conc3)
csvwrite('s7a_conc4.csv',data_s7a_conc4)
csvwrite('s7a_uncoated.csv',data_s7a_uncoated)
csvwrite('s7a_init_coated.csv',data_s7a_init_coated)
csvwrite('s7a_kinesin_coated.csv',data_s7a_kin)
csvwrite('s7a_cterm_coated.csv',data_s7a_tpx2_cterm)


cd(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/manuscript/naturePhysicsSubmission/finalSubmission/csv_plot_data/fig_2c_spectra')
csvwrite('2c_after_droplet_formation.csv',data_s7a_conc2)
csvwrite('2c_init_coated.csv',data_s7a_init_coated)
csvwrite('2c_uncoated.csv',data_s7a_uncoated)


%% fig s7b spectral power timelapse

cd(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/manuscript/naturePhysicsSubmission/finalSubmission/csv_plot_data/fig_s7/fig_s7b_spectral_power_timelapse')

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/powerAtMaxF_Values_37_bottomRightMt_tStamps.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/powerAtMaxF_Values_37_bottomRightMt.mat')
t_pMax1 = t_pMax;
pAtMax1 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/powerAtMaxF_Values_37_topLeftMt_tStamps.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data/2019 07 16/expt1/powerAtMaxF_Values_37_topLeftMt.mat')
t_pMax2 = t_pMax;
pAtMax2 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 16 tpx2 brb80/expt2/valuesForPowerVsT_TopLeftMt/powerAtMaxF_Values_7_topLeft.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 16 tpx2 brb80/expt2/valuesForPowerVsT_TopLeftMt/powerAtMaxF_Values_7_topLeft_tStamps.mat')
t_pMax3 = t_pMax;
pAtMax3 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 16 tpx2 brb80/expt2/valuesForPowerVsT_BottomAcrossMt/powerAtMaxF_Values_8_bottomAcross.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 16 tpx2 brb80/expt2/valuesForPowerVsT_BottomAcrossMt/powerAtMaxF_Values_8_bottomAcross_tStamps.mat')
t_pMax4 = t_pMax;
pAtMax4 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/powerAtMaxF_LeftBottomMt_tStamps.mat')
t_pMax5 = t_pMax;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-7-124_cy_mt-y-156-230/powerAtMaxF_LeftBottomMt.mat')
pAtMax5 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166/powerAtMaxF_RightMt_tStamps.mat')
t_pMax6 = t_pMax;
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-113-197_cy_mt-y-99-166/powerAtMaxF_RightMt.mat')
pAtMax6 = pAtMax;
clear t_pMax
clear pAtMax

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/powerAtMaxF_LeftMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt1 brb80 tpx2 0.5x 50nM 150nM/expt1_tifStacks/Stack_expt1_1-25_20191028_affine/c_cx_mt-x-81-117_cy_mt-y-87-200/powerAtMaxF_LeftMt_tStamps.mat')
t_pMax7 = t_pMax;
pAtMax7 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-219-249_cy_mt-y-142-167/powerAtMaxF_RightTinyMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-219-249_cy_mt-y-142-167/powerAtMaxF_RightTinyMt_tStamps.mat')
t_pMax8 = t_pMax;
pAtMax8 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/powerAtMaxF_LeftTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-9-73_cy_mt-y-15-29/powerAtMaxF_LeftTopMt_tStamps.mat')
t_pMax9 = t_pMax;
pAtMax9 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83/powerAtMaxF_RightTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-169-200_cy_mt-y-44-83/powerAtMaxF_RightTopMt_tStamps.mat')
t_pMax10 = t_pMax;
pAtMax10 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-123-178_cy_mt-y-57-119/powerAtMaxF_MiddleTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 28 tpx2 brb80 concentration tests 0.5x 0.5x 0.75x 0.75x/expt2 brb80 tpx2 0.5x 50nM 150nM/expt2_tifStacks/Stack_expt2_37-59_20191028_stackReg_rigidBody/c_cx_mt-x-123-178_cy_mt-y-57-119/powerAtMaxF_MiddleTopMt_tStamps.mat')
t_pMax11 = t_pMax;
pAtMax11 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/powerAtMaxF_MiddleTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/powerAtMaxF_MiddleTopMt_tStamps.mat')
t_pMax12 = t_pMax;
pAtMax12 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/powerAtMaxF_MiddleTopMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt4 4x tpx2fl 400nM 1200nM/expt4_tifStacks/Stack_expt4_20191031_3xTpx2fl_254-273_stackReg_affine/c_cx_mt-x-113-215_cy_mt-y-108-41/powerAtMaxF_MiddleTopMt_tStamps.mat')
t_pMax13 = t_pMax;
pAtMax13 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123/powerAtMaxF_AcrossMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-14-253_cy_mt-y-143-123/powerAtMaxF_AcrossMt_tStamps.mat')
t_pMax14 = t_pMax;
pAtMax14 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192/powerAtMaxF_AcrossBottomMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_affine/c_cx_mt-x-106-232_cy_mt-y-161-192/powerAtMaxF_AcrossBottomMt_tStamps.mat')
t_pMax15 = t_pMax;
pAtMax15 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120/powerAtMaxF_TopMiddlMt_tStamps.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_tifStacks/Stack_expt1_1xTpx2Fl_10312019_168-177_rowsAligned_affine/c_cx_mt-x-113-128_cy_mt-y-7-120/powerAtMaxF_TopMiddlMt.mat')
t_pMax16 = t_pMax;
pAtMax16 = pAtMax;
clear t_pMax
clear pAtMax


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71/powerAtMaxF_diagonalMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 25 tpx2 brb80 concentration tests 1x 2x 3x/expt3 300nM 900nM/expt3_3xTPX2_tifStacks/Stack_expt3_3xTpx2_75-113_rigidBody/c_cx_mt-x-27-237_cy_mt-y-244-71/powerAtMaxF_diagonalMt_tStamps.mat')
t_pMax17 = t_pMax;
pAtMax17 = pAtMax;


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-181-206_cy_mt-y-44-251/powerAtMaxF_rightMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-181-206_cy_mt-y-44-251/powerAtMaxF_rightMt_tStamps.mat')
t_pMax18 = t_pMax;
pAtMax18 = pAtMax;


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249/powerAtMaxF_middleMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-75-123_cy_mt-y-103-249/powerAtMaxF_middleMt_tStamps.mat')
t_pMax19 = t_pMax;
pAtMax19 = pAtMax;


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4/powerAtMaxF_topLeftMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-23-50_cy_mt-y-117-4/powerAtMaxF_topLeftMt_tStamps.mat')
t_pMax20 = t_pMax;
pAtMax20 = pAtMax;


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250/powerAtMaxF_bottomLeftMt.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt3 3x tpx2fl 300nM 900nM/expt3_tifStacks/Stack_expt3_20191031_3xTpx2fl_229-245_stackReg/c_cx_mt-x-6-105_cy_mt-y-178-250/powerAtMaxF_bottomLeftMt_tStamps.mat')
t_pMax21 = t_pMax;
pAtMax21 = pAtMax;

data_p_vs_t_1 = [t_pMax1; pAtMax1'];
csvwrite('s7b_p_vs_t_1.csv',data_p_vs_t_1)

data_p_vs_t_2 = [t_pMax2; pAtMax2'];
csvwrite('s7b_p_vs_t_2.csv',data_p_vs_t_2)

data_p_vs_t_3 = [t_pMax3; pAtMax3'];
csvwrite('s7b_p_vs_t_3.csv',data_p_vs_t_3)

data_p_vs_t_4 = [t_pMax4; pAtMax4'];
csvwrite('s7b_p_vs_t_4.csv',data_p_vs_t_4)

data_p_vs_t_5 = [t_pMax5; pAtMax5'];
csvwrite('s7b_p_vs_t_5.csv',data_p_vs_t_5)

data_p_vs_t_6 = [t_pMax6; pAtMax6'];
csvwrite('s7b_p_vs_t_6.csv',data_p_vs_t_6)

data_p_vs_t_7 = [t_pMax7; pAtMax7'];
csvwrite('s7b_p_vs_t_7.csv',data_p_vs_t_7)

data_p_vs_t_8 = [t_pMax8; pAtMax8'];
csvwrite('s7b_p_vs_t_8.csv',data_p_vs_t_8)

data_p_vs_t_9 = [t_pMax9; pAtMax9'];
csvwrite('s7b_p_vs_t_9.csv',data_p_vs_t_9)

data_p_vs_t_10 = [t_pMax10; pAtMax10'];
csvwrite('s7b_p_vs_t_10.csv',data_p_vs_t_10)

data_p_vs_t_11 = [t_pMax11; pAtMax11'];
csvwrite('s7b_p_vs_t_11.csv',data_p_vs_t_11)

data_p_vs_t_12 = [t_pMax12; pAtMax12'];
csvwrite('s7b_p_vs_t_12.csv',data_p_vs_t_12)

data_p_vs_t_13 = [t_pMax13; pAtMax13'];
csvwrite('s7b_p_vs_t_13.csv',data_p_vs_t_13)

data_p_vs_t_14 = [t_pMax14; pAtMax14'];
csvwrite('s7b_p_vs_t_14.csv',data_p_vs_t_14)

data_p_vs_t_15 = [t_pMax15; pAtMax15'];
csvwrite('s7b_p_vs_t_15.csv',data_p_vs_t_15)

data_p_vs_t_16 = [t_pMax16; pAtMax16'];
csvwrite('s7b_p_vs_t_16.csv',data_p_vs_t_16)

data_p_vs_t_17 = [t_pMax17; pAtMax17'];
csvwrite('s7b_p_vs_t_17.csv',data_p_vs_t_17)

data_p_vs_t_18 = [t_pMax18; pAtMax18'];
csvwrite('s7b_p_vs_t_18.csv',data_p_vs_t_18)

data_p_vs_t_19 = [t_pMax19; pAtMax19'];
csvwrite('s7b_p_vs_t_19.csv',data_p_vs_t_19)

data_p_vs_t_20 = [t_pMax20; pAtMax20'];
csvwrite('s7b_p_vs_t_20.csv',data_p_vs_t_20)

data_p_vs_t_21 = [t_pMax21; pAtMax21'];
csvwrite('s7b_p_vs_t_21.csv',data_p_vs_t_21)
        
data_p_vs_t = [...
    tLinPlot;...
    mean(pAvgPlot);...
    pci;...
    ];
csvwrite('s7b_p_vs_t_avg_ci.csv',data_p_vs_t);

data_p_vs_t_fit = [X;exp_fit];
csvwrite('s7b_p_vs_t_lin_fit.csv',data_p_vs_t_fit)

%% fig 2b linescans uncoated initcoated after droplet formation
cd(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/manuscript/naturePhysicsSubmission/finalSubmission/csv_plot_data/fig_2/fig_2b_line_scans')

fig = openfig(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/sansSerif_uncoated_initCoated_final_c_cx_mt-x-22-184_cy_mt-y-51-160.fig');

dataObjs = findobj(fig,'-property','YData');
y1 = dataObjs(1).YData;
y2 = dataObjs(2).YData;
y3 = dataObjs(3).YData;
dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(1).XData;
%
close all

data_fig_2b = [x1;y1;y2;y3];
csvwrite('2b_lineScans.csv',data_fig_2b)

%% fig 3c theory and experiment

cd(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/manuscript/naturePhysicsSubmission/finalSubmission/csv_plot_data/fig_3c_theory_and_expt')

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

data_main_theory_curve = [h;lmb*1e3];
data_corrected_theory_curve = [h;lmbeff*1e3];
csvwrite('3c_theory_curve.csv',data_main_theory_curve)
csvwrite('3c_effective_theory_curve.csv',data_corrected_theory_curve)

% NOTE: FOR INDIVIDUAL DATA POINTS, EDITED 'plotLmbVsH.m' FUNCTION
% saved these by running commented code in mt_height_theoryAndDataPlot_script.m

%% figure s3a raw and smoothed height profiles

cd(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/manuscript/naturePhysicsSubmission/finalSubmission/csv_plot_data/fig_s3/fig_s3/fig_s3a_raw_smooth_line_scans')

fig = openfig(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/sansSerif_uncoated_initCoated_final_c_cx_mt-x-22-184_cy_mt-y-51-160_noSmooth.fig');
dataObjs = findobj(fig,'-property','YData');
y1 = dataObjs(1).YData;
y2 = dataObjs(2).YData;
y3 = dataObjs(3).YData;
dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(1).XData;
%
close all

data_fig_s3a_1 = [x1;y1;y2;y3];
csvwrite('s3a_rawLineScans.csv',data_fig_s3a_1)

%
fig = openfig(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/sansSerif_uncoated_initCoated_final_c_cx_mt-x-22-184_cy_mt-y-51-160.fig');

dataObjs = findobj(fig,'-property','YData');
y1 = dataObjs(1).YData;
y2 = dataObjs(2).YData;
y3 = dataObjs(3).YData;
dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(1).XData;
close all

data_fig_s3a_2 = [x1;y1;y2;y3];
csvwrite('s3a_smoothLineScans.csv',data_fig_s3a_2)

%% fig s3b spectra for line scans shown

cd(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/manuscript/naturePhysicsSubmission/finalSubmission/csv_plot_data/fig_s3a_individual_spectra_for_main_figure')

fig = openfig('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra/mt1_avgSpectra_forSupFig.fig')
dataObjs = findobj(fig,'-property','YData');
YNeg = findobj(fig,'-property','YNegativeDelta');
y1 = dataObjs(2).YData;
y1_err = YNeg.YNegativeDelta;
y2 = dataObjs(3).YData;
y3 = dataObjs(4).YData;

dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(2).XData;
x2 = dataObjs(3).XData;
x3 = dataObjs(4).XData;

close all

data_fig_s3b_1 = [x1;y1;y1_err];
csvwrite('s3b_spectra_after_droplet_formation.csv',data_fig_s3b_1)

data_fig_s3b_2 = [x2;y2];
csvwrite('s3b_spectra_init_coated.csv',data_fig_s3b_2)

data_fig_s3b_3 = [x3;y3];
csvwrite('s3b_spectra_uncoated.csv',data_fig_s3b_3)

%% fig s5 individual line scans and spectra at different concs

cd(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/manuscript/naturePhysicsSubmission/finalSubmission/csv_plot_data/fig_s5_individual_line_scans_spectra_other_concs')

% mt 14 (conc 1) spectra
fig = openfig('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra/mt14_avgSpectra.fig')
dataObjs = findobj(fig,'-property','YData');
YNeg = findobj(fig,'-property','YNegativeDelta');
y1 = dataObjs(2).YData;
y1_err = YNeg.YNegativeDelta;
y2 = dataObjs(3).YData;
y3 = dataObjs(4).YData;

dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(2).XData;
x2 = dataObjs(3).XData;
x3 = dataObjs(4).XData;

close all

data_fig_s5_conc1 = [x1;y1;y1_err];
csvwrite('s5_spectra_conc1_after_droplet_formation.csv',data_fig_s5_conc1)

data_fig_s5_conc1 = [x2;y2];
csvwrite('s5_spectra_conc1_init_coated.csv',data_fig_s5_conc1)

data_fig_s5_conc1 = [x3;y3];
csvwrite('s5_spectra_conc1_uncoated.csv',data_fig_s5_conc1)


% mt 14 (conc 1) line scans
fig = openfig('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra/mt14_lineScans.fig');
dataObjs = findobj(fig,'-property','YData');
y1 = dataObjs(1).YData;
y2 = dataObjs(2).YData;
y3 = dataObjs(3).YData;
dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(1).XData;
x2 = dataObjs(2).XData;
x3 = dataObjs(3).XData;
close all

data_fig_s5_conc1_ls = [x1;y1];
csvwrite('s5_lineScans_conc1_after.csv',data_fig_s5_conc1_ls)

data_fig_s5_conc1_ls = [x2;y2];
csvwrite('s5_lineScans_conc1_init.csv',data_fig_s5_conc1_ls)

data_fig_s5_conc1_ls = [x3;y3];
csvwrite('s5_lineScans_conc1_uncoated.csv',data_fig_s5_conc1_ls)

% mt 46 (conc3) spectra
fig = openfig('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra/mt46_avgSpectra_forPub.fig');
dataObjs = findobj(fig,'-property','YData');
YNeg = findobj(fig,'-property','YNegativeDelta');
y1 = dataObjs(2).YData;
y1_err = YNeg.YNegativeDelta;
y2 = dataObjs(3).YData;
y3 = dataObjs(4).YData;

dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(2).XData;
x2 = dataObjs(3).XData;
x3 = dataObjs(4).XData;

close all

data_fig_s5_conc3 = [x1;y1;y1_err];
csvwrite('s5_spectra_conc3_after_droplet_formation.csv',data_fig_s5_conc3)

data_fig_s5_conc3 = [x2;y2];
csvwrite('s5_spectra_conc3_init_coated.csv',data_fig_s5_conc3)

data_fig_s5_conc3 = [x3;y3];
csvwrite('s5_spectra_conc3_uncoated.csv',data_fig_s5_conc3)

% mt 46 (conc 3) line scans
fig = openfig('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra/mt46_lineScans_forPub.fig');
dataObjs = findobj(fig,'-property','YData');
y1 = dataObjs(1).YData;
y2 = dataObjs(2).YData;
y3 = dataObjs(3).YData;
dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(1).XData;
x2 = dataObjs(2).XData;
x3 = dataObjs(3).XData;
close all

data_fig_s5_conc3_ls = [x1;y1];
csvwrite('s5_lineScans_conc3_after.csv',data_fig_s5_conc3_ls)

data_fig_s5_conc3_ls = [x2;y2];
csvwrite('s5_lineScans_conc3_init.csv',data_fig_s5_conc3_ls)

data_fig_s5_conc3_ls = [x3;y3];
csvwrite('s5_lineScans_conc3_uncoated.csv',data_fig_s5_conc3_ls)

% mt 9 (conc4) spectra
fig = openfig('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra/mt9_avgSpectra_forPub.fig');
dataObjs = findobj(fig,'-property','YData');
YNeg = findobj(fig,'-property','YNegativeDelta');
y1 = dataObjs(2).YData;
y1_err = YNeg.YNegativeDelta;
y2 = dataObjs(3).YData;

dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(2).XData;
x2 = dataObjs(3).XData;

close all

data_fig_s5_conc4 = [x1;y1;y1_err];
csvwrite('s5_spectra_conc4_after_droplet_formation.csv',data_fig_s5_conc4)

data_fig_s5_conc4 = [x2;y2];
csvwrite('s5_spectra_conc4_init_coated.csv',data_fig_s5_conc4)

% mt 9 (conc 4) line scans
fig = openfig('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/individualMTs_lineScans_spectra/mt9_lineScans_forPub.fig');
dataObjs = findobj(fig,'-property','YData');
y1 = dataObjs(1).YData;
y2 = dataObjs(2).YData;
y3 = dataObjs(3).YData;
dataObjs = findobj(fig,'-property','XData');
x1 = dataObjs(1).XData;
x2 = dataObjs(2).XData;
x3 = dataObjs(3).XData;
close all

data_fig_s5_conc4_ls = [x1;y1];
csvwrite('s5_lineScans_conc4_after.csv',data_fig_s5_conc4_ls)

data_fig_s5_conc4_ls = [x2;y2];
csvwrite('s5_lineScans_conc4_init.csv',data_fig_s5_conc4_ls)

data_fig_s5_conc4_ls = [x3;y3];
csvwrite('s5_lineScans_conc4_uncoated.csv',data_fig_s5_conc4_ls)