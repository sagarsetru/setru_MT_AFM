function [err] = mtHeightErrorProp(h,h_bg)
%mtHeightErrorProp.m - fxn to calculate propagated error of MT
% Sagar Setru 18 Aug 2019
%%

err = sqrt(( (std(h*1e9).^2) + (std(h_bg*1e9).^2) ));
end