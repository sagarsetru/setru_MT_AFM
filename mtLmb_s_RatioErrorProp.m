function [err] = mtLmb_s_RatioErrorProp(nakedHeightErr,lmbErr,nakedHeight,lmb)
%mtLmb_s_RatioErrorProp.m - fxn to calculate propagated error of lambda/a
%ratio

% Sagar Setru 22 Oct 2019

%%

y = lmb;
s = nakedHeight;

s_sigma = nakedHeightErr;
y_sigma = lmbErr;

err = sqrt(...
    ( (y_sigma).^2 * ( 2/s ).^2 ) +...
    ( (s_sigma).^2 * ( -(2*y)/s^2 ).^2 ) ...
    );

end
