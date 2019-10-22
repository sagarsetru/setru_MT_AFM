function [err] = mtLmb_a_RatioErrorProp(tpx2HeightErr,lmbErr,tpx2Height,lmb,nakedHeight)
%mtLmb_a_RatioErrorProp.m - fxn to calculate propagated error of lambda/a
%ratio

% Sagar Setru 22 Oct 2019

%%

a = tpx2Height;
y = lmb;
s = nakedHeight;

a_sigma = tpx2HeightErr;
y_sigma = lmbErr;

err = sqrt(...
    ( (y_sigma).^2 * ( 1/(a - s/2) ).^2 ) +...
    ( (a_sigma).^2 * ( -(4*y)/(2*a - s).^2 ).^2 ) ...
    );

end
