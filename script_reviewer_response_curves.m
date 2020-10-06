% Sagar Setru
% 2020 09 14
% additional data vs theory plots

addpath(genpath('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/data analysis'))

saveDirMain =    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures';



%% all data

doSave = 0;

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

% plot(h,lmbeff*1e3,'k-','LineWidth',5)%,'MarkerSize',ms)
plot(h,lmb*1e3,'k-','LineWidth',5)


% tpx2_conc_1
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/avgSpectra_lin_tpx2_conc1.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/ci_avgSpectra_lin_tpx2_conc1.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/fLin_tpx2_conc1.mat')

% tpx2_conc_1, long scans only
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/avgSpectra_lin_tpx2_conc1_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/ci_avgSpectra_lin_tpx2_conc1_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/fLin_tpx2_conc1_long.mat')

% tpx2_conc_2
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/avgSpectra_lin_tpx2_conc2.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/ci_avgSpectra_lin_tpx2_conc2.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/fLin_tpx2_conc2.mat')

% tpx2_conc_2, long scans only
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/avgSpectra_lin_tpx2_conc2_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/ci_avgSpectra_lin_tpx2_conc2_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/fLin_tpx2_conc2_long.mat')

% tpx2_conc_3
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/avgSpectra_lin_tpx2_conc3.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/ci_avgSpectra_lin_tpx2_conc3.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/fLin_tpx2_conc3.mat')

% tpx2_conc_3, long scans only
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/avgSpectra_lin_tpx2_conc3_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/ci_avgSpectra_lin_tpx2_conc3_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/fLin_tpx2_conc3_long.mat')

% tpx2_conc_4
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/avgSpectra_lin_tpx2_conc4.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/ci_avgSpectra_lin_tpx2_conc4.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/fLin_tpx2_conc4.mat')

% get max values for each conc
aMaxTpx2_conc1 = max(mean(avgSpectra_lin_tpx2_conc1));
aMaxTpx2_conc1_Ind = find(mean(avgSpectra_lin_tpx2_conc1)==aMaxTpx2_conc1);
fMaxTpx2_conc1 = fLin_tpx2_conc1(aMaxTpx2_conc1_Ind);

aMaxTpx2_conc1_long = max(mean(avgSpectra_lin_tpx2_conc1_long));
aMaxTpx2_conc1_Ind_long = find(mean(avgSpectra_lin_tpx2_conc1_long)==aMaxTpx2_conc1_long);
fMaxTpx2_conc1_long = fLin_tpx2_conc1_long(aMaxTpx2_conc1_Ind_long);

aMaxTpx2_conc2 = max(mean(avgSpectra_lin_tpx2_conc2));
aMaxTpx2_conc2_Ind = find(mean(avgSpectra_lin_tpx2_conc2)==aMaxTpx2_conc2);
fMaxTpx2_conc2 = fLin_tpx2_conc2(aMaxTpx2_conc2_Ind);

aMaxTpx2_conc2_long = max(mean(avgSpectra_lin_tpx2_conc2_long));
aMaxTpx2_conc2_Ind_long = find(mean(avgSpectra_lin_tpx2_conc2_long)==aMaxTpx2_conc2_long);
fMaxTpx2_conc2_long = fLin_tpx2_conc2_long(aMaxTpx2_conc2_Ind_long);

aMaxTpx2_conc3 = max(mean(avgSpectra_lin_tpx2_conc3));
aMaxTpx2_conc3_Ind = find(mean(avgSpectra_lin_tpx2_conc3)==aMaxTpx2_conc3);
fMaxTpx2_conc3 = fLin_tpx2_conc3(aMaxTpx2_conc3_Ind);

aMaxTpx2_conc3_long = max(mean(avgSpectra_lin_tpx2_conc3_long));
aMaxTpx2_conc3_Ind_long = find(mean(avgSpectra_lin_tpx2_conc3_long)==aMaxTpx2_conc3_long);
fMaxTpx2_conc3_long = fLin_tpx2_conc3_long(aMaxTpx2_conc3_Ind_long);

aMaxTpx2_conc4 = max(mean(avgSpectra_lin_tpx2_conc4));
aMaxTpx2_conc4_Ind = find(mean(avgSpectra_lin_tpx2_conc4)==aMaxTpx2_conc4);
fMaxTpx2_conc4 = fLin_tpx2_conc4(aMaxTpx2_conc4_Ind);

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/stdMaxLmbd_tpx2_conc1.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/stdMaxLmbd_tpx2_conc2.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/stdMaxLmbd_tpx2_conc3.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/stdMaxLmbd_tpx2_conc4.mat')


% 50-150
film_conc1 = [
    coatingData_mt10.film
    coatingData_mt11.film
    coatingData_mt12.film
    coatingData_mt13.film
    coatingData_mt14.film
    coatingData_mt15.film
    coatingData_mt16.film
    coatingData_mt17.film
    coatingData_mt18.film
    coatingData_mt19.film
    coatingData_mt20.film
    coatingData_mt21.film
    coatingData_mt22.film
    coatingData_mt23.film
    coatingData_mt24.film
    coatingData_mt25.film
    coatingData_mt26.film
    coatingData_mt27.film
];

% 100-300
film_conc2 = [
    coatingData_mt1.film
    coatingData_mt2.film
    coatingData_mt3.film
    coatingData_mt4.film
    coatingData_mt5.film
    coatingData_mt6.film
    coatingData_mt34.film
    coatingData_mt35.film
    coatingData_mt36.film
    coatingData_mt37.film
    coatingData_mt38.film
    coatingData_mt39.film
    coatingData_mt40.film
    coatingData_mt41.film
    coatingData_mt42.film
    coatingData_mt43.film
    coatingData_mt44.film
];

% 300-900
film_conc3 = [
    coatingData_mt45.film
    coatingData_mt46.film
    coatingData_mt47.film
    coatingData_mt48.film
    coatingData_mt49.film
    coatingData_mt50.film
    coatingData_mt51.film
    coatingData_mt52.film
    coatingData_mt53.film
    coatingData_mt54.film
    coatingData_mt55.film
    coatingData_mt56.film
    coatingData_mt57.film
    coatingData_mt58.film
];

% 400-1200
film_conc4 = [
    coatingData_mt7.film
    coatingData_mt8.film
    coatingData_mt9.film
    coatingData_mt28.film
    coatingData_mt29.film
    coatingData_mt30.film
    coatingData_mt31.film
    coatingData_mt33.film
];

mean_film_conc1 = mean(film_conc1);
mean_film_conc2 = mean(film_conc2);
mean_film_conc3 = mean(film_conc3);
mean_film_conc4 = mean(film_conc4);


std_film_conc1 = std(film_conc1);
std_film_conc2 = std(film_conc2);
std_film_conc3 = std(film_conc3);
std_film_conc4 = std(film_conc4);

xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;

tpData1 = 'gx'; % 50-150nM
tpData2 = 'b^'; % 100-300nM
tpData3 = 'mo'; % 300-900nM
tpData4 = 'rs'; % 400-1200nM

tpLw = 2;
ms = 10;
grid off

all_lmb = [1/fMaxTpx2_conc1,1/fMaxTpx2_conc2,1/fMaxTpx2_conc3,1/fMaxTpx2_conc4];
all_film = [mean_film_conc1,mean_film_conc2,mean_film_conc3,mean_film_conc4];

[r,p]=corrcoef(all_film,all_lmb);

errorbar(mean_film_conc1,1/fMaxTpx2_conc1,stdMaxLmbd_tpx2_conc1,stdMaxLmbd_tpx2_conc1,std_film_conc1,std_film_conc1,tpData1,'LineWidth',tpLw,'MarkerSize',ms)
errorbar(mean_film_conc2,1/fMaxTpx2_conc2,stdMaxLmbd_tpx2_conc2,stdMaxLmbd_tpx2_conc2,std_film_conc2,std_film_conc2,tpData2,'LineWidth',tpLw,'MarkerSize',ms)
errorbar(mean_film_conc3,1/fMaxTpx2_conc3,stdMaxLmbd_tpx2_conc3,stdMaxLmbd_tpx2_conc3,std_film_conc3,std_film_conc3,tpData3,'LineWidth',tpLw,'MarkerSize',ms)
errorbar(mean_film_conc4,1/fMaxTpx2_conc4,stdMaxLmbd_tpx2_conc4,stdMaxLmbd_tpx2_conc4,std_film_conc4,std_film_conc4,tpData4,'LineWidth',tpLw,'MarkerSize',ms)

% figure; hold on;
% plot(mean_film_conc1,(1/fMaxTpx2_conc1),'o')
% plot(mean_film_conc2,(1/fMaxTpx2_conc2),'o')
% plot(mean_film_conc3,(1/fMaxTpx2_conc3),'o')
% plot(mean_film_conc4,(1/fMaxTpx2_conc4),'o')
xlim([9 25])
% ylim([0 550])
ylim([150 400])
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
% set(gca,'YScale','log')
% doLatex = 1;
% simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$(nm)', xafz, yafz, tvfz, axesLw, doLatex )
%simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$($\mu$m)', xafz, yafz, tvfz, axesLw, doLatex )

doLatex = 0;
simplePlotFormat( 'Film thickness \ith\rm (nm)', 'Droplet spacing \lambda_{max} (nm)', xafz, yafz, tvfz, axesLw, doLatex )

box on


if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','avg_peak_vs_theory_v2'])
end


%% only long scans


doSave = 0;

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

% plot(h,lmbeff*1e3,'k-','LineWidth',5)%,'MarkerSize',ms)
plot(h,lmb*1e3,'k-','LineWidth',5)


% tpx2_conc_1
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/avgSpectra_lin_tpx2_conc1.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/ci_avgSpectra_lin_tpx2_conc1.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/fLin_tpx2_conc1.mat')

% tpx2_conc_1, long scans only
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/avgSpectra_lin_tpx2_conc1_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/ci_avgSpectra_lin_tpx2_conc1_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/fLin_tpx2_conc1_long.mat')

% tpx2_conc_2
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/avgSpectra_lin_tpx2_conc2.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/ci_avgSpectra_lin_tpx2_conc2.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/fLin_tpx2_conc2.mat')

% tpx2_conc_2, long scans only
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/avgSpectra_lin_tpx2_conc2_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/ci_avgSpectra_lin_tpx2_conc2_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/fLin_tpx2_conc2_long.mat')

% tpx2_conc_3
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/avgSpectra_lin_tpx2_conc3.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/ci_avgSpectra_lin_tpx2_conc3.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/fLin_tpx2_conc3.mat')

% tpx2_conc_3, long scans only
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/avgSpectra_lin_tpx2_conc3_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/ci_avgSpectra_lin_tpx2_conc3_long.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/fLin_tpx2_conc3_long.mat')

% tpx2_conc_4
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/avgSpectra_lin_tpx2_conc4.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/ci_avgSpectra_lin_tpx2_conc4.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/fLin_tpx2_conc4.mat')

% get max values for each conc
aMaxTpx2_conc1 = max(mean(avgSpectra_lin_tpx2_conc1));
aMaxTpx2_conc1_Ind = find(mean(avgSpectra_lin_tpx2_conc1)==aMaxTpx2_conc1);
fMaxTpx2_conc1 = fLin_tpx2_conc1(aMaxTpx2_conc1_Ind);

aMaxTpx2_conc1_long = max(mean(avgSpectra_lin_tpx2_conc1_long));
aMaxTpx2_conc1_Ind_long = find(mean(avgSpectra_lin_tpx2_conc1_long)==aMaxTpx2_conc1_long);
fMaxTpx2_conc1_long = fLin_tpx2_conc1_long(aMaxTpx2_conc1_Ind_long);

aMaxTpx2_conc2 = max(mean(avgSpectra_lin_tpx2_conc2));
aMaxTpx2_conc2_Ind = find(mean(avgSpectra_lin_tpx2_conc2)==aMaxTpx2_conc2);
fMaxTpx2_conc2 = fLin_tpx2_conc2(aMaxTpx2_conc2_Ind);

aMaxTpx2_conc2_long = max(mean(avgSpectra_lin_tpx2_conc2_long));
aMaxTpx2_conc2_Ind_long = find(mean(avgSpectra_lin_tpx2_conc2_long)==aMaxTpx2_conc2_long);
fMaxTpx2_conc2_long = fLin_tpx2_conc2_long(aMaxTpx2_conc2_Ind_long);

aMaxTpx2_conc3 = max(mean(avgSpectra_lin_tpx2_conc3));
aMaxTpx2_conc3_Ind = find(mean(avgSpectra_lin_tpx2_conc3)==aMaxTpx2_conc3);
fMaxTpx2_conc3 = fLin_tpx2_conc3(aMaxTpx2_conc3_Ind);

aMaxTpx2_conc3_long = max(mean(avgSpectra_lin_tpx2_conc3_long));
aMaxTpx2_conc3_Ind_long = find(mean(avgSpectra_lin_tpx2_conc3_long)==aMaxTpx2_conc3_long);
fMaxTpx2_conc3_long = fLin_tpx2_conc3_long(aMaxTpx2_conc3_Ind_long);

aMaxTpx2_conc4 = max(mean(avgSpectra_lin_tpx2_conc4));
aMaxTpx2_conc4_Ind = find(mean(avgSpectra_lin_tpx2_conc4)==aMaxTpx2_conc4);
fMaxTpx2_conc4 = fLin_tpx2_conc4(aMaxTpx2_conc4_Ind);


load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/stdMaxLmbd_tpx2_conc1.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc1/stdMaxLmbd_tpx2_conc1_long.mat')

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/stdMaxLmbd_tpx2_conc2.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc2/stdMaxLmbd_tpx2_conc2_long.mat')

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/stdMaxLmbd_tpx2_conc3.mat')
load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc3/stdMaxLmbd_tpx2_conc3_long.mat')

load('/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/figures/spectra_tpx2_conc4/stdMaxLmbd_tpx2_conc4.mat')


% 50-150
film_conc1_long = [
    coatingData_mt10.film
    coatingData_mt11.film
    coatingData_mt12.film
    coatingData_mt13.film
    coatingData_mt15.film
    coatingData_mt24.film
];

% 100-300
film_conc2_long = [
    coatingData_mt1.film
    coatingData_mt6.film
    coatingData_mt35.film
    coatingData_mt36.film
    coatingData_mt40.film
    coatingData_mt41.film
    coatingData_mt42.film
    coatingData_mt43.film
];

% 300-900
film_conc3_long = [
    coatingData_mt45.film
    coatingData_mt46.film
    coatingData_mt49.film
    coatingData_mt50.film
    coatingData_mt51.film
    coatingData_mt52.film
    coatingData_mt53.film
    coatingData_mt54.film
    coatingData_mt56.film
    coatingData_mt57.film
    coatingData_mt58.film
];

% 400-1200
film_conc4 = [
    coatingData_mt7.film
    coatingData_mt8.film
    coatingData_mt9.film
    coatingData_mt28.film
    coatingData_mt29.film
    coatingData_mt30.film
    coatingData_mt31.film
    coatingData_mt33.film
];

mean_film_conc1_long = mean(film_conc1_long);
mean_film_conc2_long = mean(film_conc2_long);
mean_film_conc3_long = mean(film_conc3_long);
mean_film_conc4 = mean(film_conc4);


std_film_conc1_long = std(film_conc1_long);
std_film_conc2_long = std(film_conc2_long);
std_film_conc3_long = std(film_conc3_long);
std_film_conc4 = std(film_conc4);

xafz = 24;
yafz = 24;
tvfz = 20;
axesLw = 2;

tpData1 = 'gx'; % 50-150nM
tpData2 = 'b^'; % 100-300nM
tpData3 = 'mo'; % 300-900nM
tpData4 = 'rs'; % 400-1200nM

tpLw = 2;
ms = 10;
grid off

all_lmb = [1/fMaxTpx2_conc1_long,1/fMaxTpx2_conc2_long,1/fMaxTpx2_conc3_long,1/fMaxTpx2_conc4];
all_film = [mean_film_conc1_long,mean_film_conc2_long,mean_film_conc3_long,mean_film_conc4];

errorbar(mean_film_conc1_long,1/fMaxTpx2_conc1_long,stdMaxLmbd_tpx2_conc1_long,stdMaxLmbd_tpx2_conc1_long,std_film_conc1,std_film_conc1_long,tpData1,'LineWidth',tpLw,'MarkerSize',ms)
errorbar(mean_film_conc2_long,1/fMaxTpx2_conc2_long,stdMaxLmbd_tpx2_conc2_long,stdMaxLmbd_tpx2_conc2_long,std_film_conc2,std_film_conc2_long,tpData2,'LineWidth',tpLw,'MarkerSize',ms)
errorbar(mean_film_conc3_long,1/fMaxTpx2_conc3_long,stdMaxLmbd_tpx2_conc3_long,stdMaxLmbd_tpx2_conc3_long,std_film_conc3,std_film_conc3_long,tpData3,'LineWidth',tpLw,'MarkerSize',ms)
errorbar(mean_film_conc4,1/fMaxTpx2_conc4,stdMaxLmbd_tpx2_conc4,stdMaxLmbd_tpx2_conc4,std_film_conc4,std_film_conc4,tpData4,'LineWidth',tpLw,'MarkerSize',ms)

% figure; hold on;
% plot(mean_film_conc1,(1/fMaxTpx2_conc1),'o')
% plot(mean_film_conc2,(1/fMaxTpx2_conc2),'o')
% plot(mean_film_conc3,(1/fMaxTpx2_conc3),'o')
% plot(mean_film_conc4,(1/fMaxTpx2_conc4),'o')
xlim([0 31])
% ylim([0 550])
ylim([150 400])
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
% set(gca,'YScale','log')
% doLatex = 1;
% simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$(nm)', xafz, yafz, tvfz, axesLw, doLatex )
%simplePlotFormat( 'Film thickness $h$ (nm)', 'Droplet spacing $\lambda_\mathrm{max}$($\mu$m)', xafz, yafz, tvfz, axesLw, doLatex )

doLatex = 0;
simplePlotFormat( 'Film thickness \ith\rm (nm)', 'Droplet spacing \lambda_{max} (nm)', xafz, yafz, tvfz, axesLw, doLatex )


box on


if doSave
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[saveDirMain,'/','avg_peak_vs_theory_long_only'])
end


%%
% 50-150
lmb_conc1 = [
    coatingData_mt10.lmb
    coatingData_mt11.lmb
    coatingData_mt12.lmb
    coatingData_mt13.lmb
    coatingData_mt14.lmb
    coatingData_mt15.lmb
    coatingData_mt16.lmb
    coatingData_mt17.lmb
    coatingData_mt18.lmb
    coatingData_mt19.lmb
    coatingData_mt20.lmb
    coatingData_mt21.lmb
    coatingData_mt22.lmb
    coatingData_mt23.lmb
    coatingData_mt24.lmb
    coatingData_mt25.lmb
    coatingData_mt26.lmb
    coatingData_mt27.lmb
];
 
% 100-300
lmb_conc2 = [
    coatingData_mt1.lmb
    coatingData_mt2.lmb
    coatingData_mt3.lmb
    coatingData_mt4.lmb
    coatingData_mt5.lmb
    coatingData_mt6.lmb
    coatingData_mt34.lmb
    coatingData_mt35.lmb
    coatingData_mt36.lmb
    coatingData_mt37.lmb
    coatingData_mt38.lmb
    coatingData_mt39.lmb
    coatingData_mt40.lmb
    coatingData_mt41.lmb
    coatingData_mt42.lmb
    coatingData_mt43.lmb
    coatingData_mt44.lmb
];
 
% 300-900
lmb_conc3 = [
    coatingData_mt45.lmb
    coatingData_mt46.lmb
    coatingData_mt47.lmb
    coatingData_mt48.lmb
    coatingData_mt49.lmb
    coatingData_mt50.lmb
    coatingData_mt51.lmb
    coatingData_mt52.lmb
    coatingData_mt53.lmb
    coatingData_mt54.lmb
    coatingData_mt55.lmb
    coatingData_mt56.lmb
    coatingData_mt57.lmb
    coatingData_mt58.lmb
];
 
% 400-1200
lmb_conc4 = [
    coatingData_mt7.lmb
    coatingData_mt8.lmb
    coatingData_mt9.lmb
    coatingData_mt28.lmb
    coatingData_mt29.lmb
    coatingData_mt30.lmb
    coatingData_mt31.lmb
    coatingData_mt33.lmb
];

mean(lmb_conc1)
mean(lmb_conc2)
mean(lmb_conc3)
mean(lmb_conc4)

%%
l_1 = [300
400
400
450
500
600
600
600
600
600
600
700
900
900
1000
1100
1200
1500
1100
700
850
1200
1200
1950
1950
];

lmb_1 = [64
92
135
230
258
111
190
172
104
188
214
103
230
151
223
186
309
212
68
240
223
198
101
149
216
];

l_2 = [400
400
500
500
600
600
600
650
800
850
900
950
1000
1000
1200
1300
1900
];

lmb_2 = [203
215
258
125
141
203
195
221
276
213
223
135
254
167
190
248
134
];

l_3 = [800
900
950
1150
1200
1300
1600
1600
1600
1600
1600
1650
1900
2500
1450
1250
1350
1350
550
800
1350
1900
1400
1000
];

lmb_3 = [158
178
159
230
172
220
235
268
174
185
268
276
314
313
144
213
90
269
273
278
273
272
280
336
];

l_4 = [750
1000
1000
1100
1200
1800
2500
3800
];

lmb_4 = [255
331
262
283
338
262
280
318
];

[r1,p1]=corrcoef(l_1,lmb_1)
[r2,p2]=corrcoef(l_2,lmb_2)
[r3,p3]=corrcoef(l_3,lmb_3)
[r4,p4]=corrcoef(l_4,lmb_4)


% [r1,p1]=corrcoef(l_1(end-5:end),lmb_1(end-5:end))
% [r2,p2]=corrcoef(l_2(9:end-1),lmb_2(9:end-1))
% [r3,p3]=corrcoef(l_3(2:end-2),lmb_3(2:end-2))
% [r4,p4]=corrcoef(l_4,lmb_4)
