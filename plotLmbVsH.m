function plotLmbVsH(coatingStruct,tpData,tpLw,ms)
%plotLmbVsH.m - fxn to do plot from coating data structure
% Sagar Setru, 2019 10 23
%%

film = coatingStruct.film;
lmb = coatingStruct.lmb;
errFilm = coatingStruct.errFilm;
stdErrLmb = coatingStruct.stdErrLmb;

errorbar(film,lmb,stdErrLmb*1e3,stdErrLmb*1e3,errFilm,errFilm,tpData,'LineWidth',tpLw,'MarkerSize',ms)

end

