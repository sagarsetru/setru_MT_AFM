function [err] = mtFilmRatioErrorProp_a_over_s(tpx2HeightErr,nakedHeightErr,tpx2Height,nakedHeight)
%mtFilmRatioErrorProp_a_over_s.m - fxn to calculate propagated error of tpx2 film
%thickness ratio

% Sagar Setru 21 Oct 2019

%%

a = tpx2Height;
s = nakedHeight;

a_sigma = tpx2HeightErr;
s_sigma = nakedHeightErr;

err = sqrt(...
    ( (s_sigma).^2 * ( -(2*a)/s.^2 ).^2 ) +...
    ( (a_sigma).^2 * ( 2/s ).^2 ) ...
    );
end
