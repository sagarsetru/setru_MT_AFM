function plotUncoatedInitFinal(un,init,drop,h,sm,smPlaneFrac,pix_to_nm,psp)
%plotMT_UncoatedInitFinal.m - fxn that plots uncoated, initial, and final
%topographies for individual MTs

% Sagar Setru, 2020 03 25
%
%
% un - uncoated profile
% init - init coated profile
% drop - droplet profile(s)
% sm - smoothing window
% psp - plotStyleParameters, various variables to adjust plot style/fonts/sizes
%%


% remove plane background
un = un + ( mean(un)-smooth(un,length(un)/smPlaneFrac)' );
init = init +( mean(init)-smooth(init,length(init)/smPlaneFrac)' );

for t = 1:size(drop,1)
    drop(t,:) = drop(t,:) +( mean(drop(t,:))-smooth(drop(t,:),size(drop,2)/smPlaneFrac)' );
    drop(t,:) = smooth(drop(t,:),sm);
end

% get the x axis to plot
xPlot_un = 0:pix_to_nm:length(un)*pix_to_nm-pix_to_nm;
xPlot_init = 0:pix_to_nm:length(init)*pix_to_nm-pix_to_nm;
xPlot_drop = 0:pix_to_nm:length(drop)*pix_to_nm-pix_to_nm;

% center around 25nm for uncoated
un = un-mean(un)+25;

% center around height for initial coated and droplet
init = init-mean(init)+(h+25);
drop = drop-mean(drop)+(h+25);

figure; hold on; box on;

plot(xPlot_un,smooth(un,sm),psp.unColor,'LineWidth',psp.lw);
plot(xPlot_init,smooth(init,sm),psp.initColor,'LineWidth',psp.lw); 
% plot(xPlot_drop,smooth(drop,sm),psp.dropColor,'LineWidth',psp.lw);
plot(xPlot_drop,drop,psp.dropColor,'LineWidth',psp.lw);

% lgd = legend({'Uncoated','Initially coated','After droplet formation'},...
%     'Position',[.63 .37 .1 .1]);
% legend boxoff
% lgd.FontSize = 20;
% xlim([psp.xmin psp.xmax])
xlim([psp.xmin max(xPlot_drop)])
ylim([psp.ymin psp.ymax])
% pbaspect([1.0000    0.7638    0.7638])
daspect(psp.dAsp)
% set(gcf,'PaperPosition',[0.3611    2.5833    7.7778    5.8333])
set(gca, 'XTick', psp.xTicks)
simplePlotFormat( psp.xAxisLabel, psp.yAxisLabel, psp.xafz, psp.yafz, psp.tvfz, psp.axesLw, psp.doLatex )



end

