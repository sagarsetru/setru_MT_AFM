function [lmb] = plotLmbVsH_v2(coatingStruct,tpData,tpLw,ms)
% function plotLmbVsH(coatingStruct,tpData,tpLw,ms,n,conc)
%plotLmbVsH.m - fxn to do plot from coating data structure
% Sagar Setru, 2019 10 23
%%

film = coatingStruct.film;
lmb = coatingStruct.lmb;
errFilm = coatingStruct.errFilm;
stdErrLmb = coatingStruct.stdErrLmb;

errorbar(film,lmb,stdErrLmb*1e3,stdErrLmb*1e3,errFilm,errFilm,tpData,'LineWidth',tpLw,'MarkerSize',ms)

% cd(    '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/manuscript/naturePhysicsSubmission/finalSubmission/csv_plot_data/fig_3c_theory_and_expt')
% csvwrite(['mt_',num2str(n),'_conc',num2str(conc),'.csv'],[film,lmb,errFilm,stdErrLmb*1e3])

end

