function [rho_tpx2_density_in_film,V_exposed_to_bulk_total,l_mt_total,n_molecule_total] = estimate_tpx2_density_on_MTs(c_bulk,V_meniscus,l_mt_total_measured,A_total_measured,V_exposed_to_bulk)
%estimate_tpx2_density_on_MTs.m  - estimate TPX2 molecule number density in
%AFM experiments

% arithmetic:

% 1) c_bulk * n_avogadro * V_meniscus = n_molecule_total
% 2) l_mt_total_measured/A_total_measured * A_of_mica_disk = l_mt_total
% 3) V_exposed_to_bulk * l_mt_total = V_exposed_to_bulk_total
% 4) rho_tpx2_density_in_film = n_molecule_total/V_exposed_to_bulk_total

% notes:
% V_exposed_to_bulk includes film height information corrected for mica
% surface
% use MKS units for all (i.e meters, moles)

%%

% mica disk area:
d = .012; %m
r = d/2;%m
A_of_mica_disk = pi * r^2; %m

% avogadro's num
n_avogadro = 6.02*10^23;

% get number of molecules total in solution
n_molecule_total= c_bulk .* n_avogadro .* V_meniscus;

l_mt_total = mean(l_mt_total_measured./A_total_measured) .* A_of_mica_disk;

V_exposed_to_bulk_total = V_exposed_to_bulk .* l_mt_total;

rho_tpx2_density_in_film = n_molecule_total./V_exposed_to_bulk_total;


end

