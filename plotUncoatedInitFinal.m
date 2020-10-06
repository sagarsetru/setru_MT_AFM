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
xPlot_un = psp.unStart:pix_to_nm:length(un)*pix_to_nm+psp.unStart-pix_to_nm;
xPlot_init = psp.initStart:pix_to_nm:length(init)*pix_to_nm+psp.initStart-pix_to_nm;
xPlot_drop = psp.dropStart:pix_to_nm:length(drop)*pix_to_nm+psp.dropStart-pix_to_nm;

% 0:pix_to_nm:size(y,2)*pix_to_nm-pix_to_nm
% center around 25nm for uncoated
un = un-mean(un)+25;

% center around height for initial coated and droplet
init = init-mean(init)+(h+25);
drop = drop-mean(drop)+(h+25);

figure; hold on; box on;

if un == 25
    colShape = [psp.unColor,psp.missingLineSpec];
    plot(xPlot_un,un,colShape,'LineWidth',psp.lw);
else
%     plot(xPlot_un,smooth(un,sm),psp.unColor,'LineWidth',psp.lw);
    plot(xPlot_un,smooth(un,sm),'k:','LineWidth',psp.lw);
end

if init == (h+25)
    colShape = [psp.initColor,psp.missingLineSpec];
    plot(xPlot_init,init,colShape,'LineWidth',psp.lw); 
else
    plot(xPlot_init,smooth(init,sm),psp.initColor,'LineWidth',psp.lw); 
%     plot(xPlot_init,smooth(init,sm),'b:','LineWidth',psp.lw); 

end

plot(xPlot_drop,drop,psp.dropColor,'LineWidth',psp.lw);

mt_length = max(xPlot_drop)-min(xPlot_drop);

% lgd = legend({'Uncoated','Initially coated','After droplet formation'},...
%     'Position',[.63 .37 .1 .1]);
% legend boxoff
% lgd.FontSize = 20;
% xlim([psp.xmin psp.xmax])
xlim([psp.xmin max([xPlot_drop xPlot_init xPlot_un])])
ylim([psp.ymin psp.ymax])
% ylim([psp.ymin max([un init drop])])
% pbaspect([1.0000    0.7638    0.7638])
if psp.fixAsp
    daspect(psp.dAsp)
end
% set(gcf,'PaperPosition',[0.3611    2.5833    7.7778    5.8333])
set(gca, 'XTick', psp.xTicks)
simplePlotFormat( psp.xAxisLabel, psp.yAxisLabel, psp.xafz, psp.yafz, psp.tvfz, psp.axesLw, psp.doLatex )

if psp.doSave == 1
    
    save([psp.saveDirMain,psp.fname,'_length_nm.mat'],'mt_length')
    
    saveCurrentFigure_fig_pdf_svg_png_jpg_eps(gcf,[psp.saveDirMain,psp.fname,'_lineScans'])

end

end

