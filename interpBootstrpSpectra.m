function [fLin,spectraAll_lin,avgSpectra_lin,ci_lin] = interpBootstrpSpectra(fAll,spectraAll,logIndAll,nboot,ci_alpha)
%interpBootstrpSpectra.m  - do interpolation of linear spectra
% first find spectra, then interpolate, then do boot strap stats
% Sagar Setru, 2019 12 13
%
%%

% get highest of the lowest frequencies sampled
f_min = max(cellfun(@min,fAll));

% get lowest of the highest frequencies sampled
f_max = min(cellfun(@max,fAll));

% get average spacing between frequencies sampled
df = mean(cellfun(@mean,cellfun(@diff,fAll,'UniformOutput',false)));

fLin = [f_min:df:f_max];

% loop through cell of spectra and index
for j = 1:numel(logIndAll)
    
    spectraAll{j} = spectraAll{j}(logIndAll{j},:);
    
end

% initialize cell for linearized spectra
spectraAll_lin = cell(size(spectraAll));

% loop through spectra, interpolate all
for j = 1:numel(spectraAll)
    
    % get a set of spectra
    spec = spectraAll{j};
    
    % initialize matrix for linearized spectra
    specLin = zeros(length(fLin),size(spec,2));
    
    % loop through this set of spectra and interpolate
    for k = 1:size(spec,2)
        
        specLin(:,k) = interp1(fAll{j}(:),...
            spec(:,k),...
            fLin(:),...
            'linear','extrap');
        
    end
    
    % add to new cell
    spectraAll_lin{j} = specLin;
    
end

% convert to mat
spectraAll_lin = cell2mat(spectraAll_lin);

% perform bootstrap statistics

% avgSpectra_lin = mean(spectraAll_lin,2);
avgSpectra_lin = bootstrp(nboot,@mean,spectraAll_lin');
ci_lin = bootci(nboot,{@mean,spectraAll_lin'},'alpha',ci_alpha);


end

