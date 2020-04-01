% Sagar Setru, 2020 March 29
% quick script for stats for droplet and branch colocalization

%%
% MT 1: in paper
mt1 = [6, 10];

% MT 2: Ray?s main figure
mt2 = [4, 7];

% Timelapse 2, Top MT
mt3 = [4, 4];

% Timelapse 2, Middle MT
mt4 = [6, 8];

% Timelapse 2, Bottom MT
mt5 = [4, 5];

% Timelapse 1, Left MT
mt6 = [4, 6];

% Timelapse 1, Right MT
mt7 = [6, 6];

totalDrops = mt1(2)+mt2(2)+mt3(2)+mt4(2)+mt5(2)+mt6(2)+mt7(2)
totalBranches = mt1(1)+mt2(1)+mt3(1)+mt4(1)+mt5(1)+mt6(1)+mt7(1)

%%
[mtfrac1] = findBranchDropFraction(mt1);
[mtfrac2] = findBranchDropFraction(mt2);
[mtfrac3] = findBranchDropFraction(mt3);
[mtfrac4] = findBranchDropFraction(mt4);
[mtfrac5] = findBranchDropFraction(mt5);
[mtfrac6] = findBranchDropFraction(mt6);
[mtfrac7] = findBranchDropFraction(mt7);

fracAll = [...,
    mtfrac1,
    mtfrac2,
    mtfrac3,
    mtfrac4,
    mtfrac5,
    mtfrac6,
    mtfrac7];

mean(fracAll)
std(fracAll)
std(fracAll)/sqrt(numel(fracAll))
%%
dropCount = [mt1(2),mt2(2),mt3(2),mt4(2),mt5(2),mt6(2),mt7(2)]
mean(dropCount)
std(dropCount)
    