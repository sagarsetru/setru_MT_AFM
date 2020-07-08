function [heff_p,V_incl,V_excl] = determineEffectiveFilmHeight(h)
%determineEffectiveFilmHeight.m - uses trig to determine effective film
%height due to exclusion of MT surface on mica surface during AFM
%acquisition
%
% Sagar Setru, 6 July 2020

%%

% define MT inner radius
ri = 12.5; %nm

% define MT outer radius
ro = h + ri;

% volume in free space of coating
V = pi.*(ro.^2-ri.^2);

% volume of 'pie slice' sweeping across excluded volume
V1 = pi.*ro.^2.*(acos(ri./ro)./(pi));

% volume of triangle to be ignored in 'pie slice'
V2 = ri.*sqrt(ro.^2-ri.^2);

% V3 = pi.*ri.^2.*acos(ri./ro);

% define 'V_excl' variable, which is volume removed by MT being on surface
V_excl = (1/pi)*(V - (V1 - V2));

% define 'V_incl' variable, which is volume on MT when it is on surface
V_incl = V - V_excl;

% define 'chi' variable
% chi = h.^2+2*ri.*h;
% 
% % define 'Z' variable
% Z = chi - (chi./pi).*acos(ri./(ri+h)) + (ri/pi).*chi.^(1/2);

% determine effective film height
heff_p = -ri + sqrt(ri^2+V_excl);

end

