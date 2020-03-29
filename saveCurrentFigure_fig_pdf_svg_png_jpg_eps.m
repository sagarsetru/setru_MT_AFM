function saveCurrentFigure_fig_pdf_svg_png_jpg_eps(fig,fileName)
% saveCurrentFigure_fig_pdf_svg_png_jpg_eps.m - fxn saves currently
% selected figure to currently opened folder in the following formats:
% fig, pdf, svg, png, jpg, eps
%
% Sagar Setru, 2019 08 09

%%

disp('SAVING')

% save as fig
savefig(fig,[fileName,'.fig'])

% save as pdf
print(fig,fileName,'-dpdf','-r300')
%saveas(fig,[fileName,'.pdf'])

% save as svg
print(fig,fileName,'-dsvg','-r300')
%saveas(fig,fileName,'svg')

% % save as png
% print(fig,fileName,'-dpng','-r300')
% %saveas(fig,[fileName,'.png'])
% 
% % save as jpg
% print(fig,fileName,'-djpeg','-r300')
% %saveas(fig,[fileName,'jpg'])

% save as eps
print(fig,fileName,'-depsc','-r300')
%saveas(fig,fileName,'epsc')

disp('DONE SAVING')


