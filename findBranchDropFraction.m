function [mtfrac1,mtfrac2] = findBranchDropFraction(mt)
%findBranchDropFraction.m - quick fxn for fraction of drops that make
%branches in vitro
% Sagar Setru, 2020 03 29
%%

mtfrac1 = mt(1)/mt(2);
mtfrac2 = mt(3)/mt(2);

end

