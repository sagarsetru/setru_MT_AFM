% Sagar Setru, 2020 March 29
% quick script for stats for droplet and branch colocalization

%%
% MT 1: in paper
mt1 = [6, 10, 1];

% MT 2: Ray?s main figure
mt2 = [4, 7, 2];

% Timelapse 2, Top MT
mt3 = [4, 4, 3];

% Timelapse 2, Middle MT
mt4 = [6, 8, 2];

% Timelapse 2, Bottom MT
mt5 = [4, 6, 2];

% Timelapse 1, Left MT
mt6 = [4, 6, 3];

% Timelapse 1, Right MT
mt7 = [6, 6, 2];

totalDrops = mt1(2)+mt2(2)+mt3(2)+mt4(2)+mt5(2)+mt6(2)+mt7(2)
totalBranches = mt1(1)+mt2(1)+mt3(1)+mt4(1)+mt5(1)+mt6(1)+mt7(1)

mean([10 7 4 8 6 6 6])
std([10 7 4 8 6 6 6])

mean([6 4 4 6 4 4 6])
std([6 4 4 6 4 4 6])

mean([1 2 3 2 2 3 2])
std([1 2 3 2 2 3 2])
%%
[mtfrac1,mtfrac2_1] = findBranchDropFraction(mt1);
[mtfrac2,mtfrac2_2] = findBranchDropFraction(mt2);
[mtfrac3,mtfrac2_3] = findBranchDropFraction(mt3);
[mtfrac4,mtfrac2_4] = findBranchDropFraction(mt4);
[mtfrac5,mtfrac2_5] = findBranchDropFraction(mt5);
[mtfrac6,mtfrac2_6] = findBranchDropFraction(mt6);
[mtfrac7,mtfrac2_7] = findBranchDropFraction(mt7);

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

fracAll_2 = [...,
    mtfrac2_1,
    mtfrac2_2,
    mtfrac2_3,
    mtfrac2_4,
    mtfrac2_5,
    mtfrac2_6,
    mtfrac2_7];

mean(fracAll_2)
std(fracAll_2)
std(fracAll_2)/sqrt(numel(fracAll_2))
%%
dropCount = [mt1(2),mt2(2),mt3(2),mt4(2),mt5(2),mt6(2),mt7(2)]
mean(dropCount)
std(dropCount)
    