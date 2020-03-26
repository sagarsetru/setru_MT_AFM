%% Plot of dispersion relation

function [] = dispersion_relation_plot()

K = linspace(0, 1, 1000);
A_max = 0.8;
A_min = 0.01;
A = linspace(A_max, A_min, 50); % [0.75, 0.5, 0.45, 0.33, 0.25, 0.125, 0.1, 0.05, 0.01]; % A = r_i/r_o
lmda = zeros(size(A));
LMDA = zeros(size(A));
sigma = zeros(length(K), length(A));
K_max = zeros(size(A));
sigma_max = zeros(size(A));

r_i = 12.5; % [nm]
r_o = r_i./A; % [nm]
h = r_o - r_i; % [nm]

for j = 1:length(A)
    
    delta_1 = -1.0 + ...
    2.0.*K.*A(j).*(K0(K.*A(j)).*I1(K) + I0(K.*A(j)).*K1(K)).*(K1(K.*A(j)).*I1(K) - I1(K.*A(j)).*K1(K)) + ...
    K.^2.*A(j).^2.*(K0(K.*A(j)).*I1(K) + I0(K.*A(j)).*K1(K)).^2 - ...
    K.^2.*A(j).^2.*(K1(K.*A(j)).*I1(K) - I1(K.*A(j)).*K1(K)).^2;

    delta_2 = -(1.0 + K.^2.*A(j).^2) + ...
    2.0.*K.*A(j).*K.^2.*(K0(K).*I1(K.*A(j)) + I0(K).*K1(K.*A(j))).*(K0(K).*I0(K*A(j)) - I0(K).*K0(K.*A(j))) + ...
    K.^2.*A(j).^2.*K.^2.*(K0(K).*I1(K.*A(j)) + I0(K).*K1(K.*A(j))).^2 - ...
    K.^2.*A(j).^2.*K.^2.*(K0(K).*I0(K.*A(j)) - I0(K).*K0(K.*A(j))).^2;

    sigma(:, j) = (0.5.*(K.^2 - 1.0).*delta_1)./(delta_2 + (K.^2 + 1.0).*delta_1);
    
    [~, max_idx] = max(sigma(:, j));
    K_max(j) = K(max_idx);
    sigma_j = sigma(:, j);
    sigma_max(j) = sigma_j(max_idx);
    LMDA(j) = (2*pi)/K_max(j);
    lmda(j) = LMDA(j)*r_o(j);
    
end

clr = jet(length(A));
figure(1) 
hold on; 
box on;
for j = 1:length(A)
    plot(K, 1000*sigma(:, j), '-', 'Color', clr(j, :), 'LineWidth', 2.0)
    plot(K_max, 1000.0*sigma_max, 'ko', 'MarkerSize', 8.0, 'LineWidth', 1.5)
    plot(K_max, 1000.0*sigma_max, 'k-', 'LineWidth', 2.0)
end
c = colorbar;
colormap jet
c.LineWidth = 2;
c.FontSize = 14;
c.TickLabelInterpreter = 'latex';
caxis([A_min, A_max])
ylabel(c,'Aspect ratio $r_{\mathrm{i}}/r_{\mathrm{o}}$','FontSize',20,'Interpreter','latex');

x_label = 'Wave number $2\pi r_{\mathrm{o}}/\lambda$';
y_label = 'Growth rate $\sigma\mu a/\gamma\ \left(\times 10^3\right)$';
x_font_size = 24;
y_font_size = 24;
tick_size = 20;
line_width = 2;
doLatex = 1;
simplePlotFormat(x_label, y_label, x_font_size, y_font_size, tick_size, line_width, doLatex)
print(figure(1), 'dispersion_relation.pdf','-dpdf','-r300')


% lgd = legend({'Uncoated','Initially coated','After droplet formation'}, ...
% 
%     'Interpreter','latex',...
% 
%     'Position',[.63 .37 .1 .1]);
% 
% legend boxoff
% 
% lgd.FontSize = 20;

end

%% Subfunctions

function [value] = I0(z)

value = besseli(0, z);

end

function [value] = I1(z)

value = besseli(1, z);

end

function [value] = K0(z)

value = besselk(0, z);

end

function [value] = K1(z)

value = besselk(1, z);

end
