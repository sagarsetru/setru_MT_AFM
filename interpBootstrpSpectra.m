function [fLin,spectraAll_lin,avgSpectra_lin,ci_lin,avgMaxLmbd,ci_maxLmbd] = interpBootstrpSpectra(fAll,spectraAll,logIndAll,nboot,ci_alpha)
%interpBootstrpSpectra.m  - do interpolation of linear spectra
% first find spectra, then interpolate, then do boot strap stats
% Sagar Setru, 2019 12 13

%%

% get lowest of the lowest frequencies sampled
% f_min = max(cellfun(@min,fAll));
f_min = min(cellfun(@min,fAll));

% get lowest of the highest frequencies sampled
f_max = min(cellfun(@max,fAll));
% f_max = max(cellfun(@max,fAll));

% get average spacing between frequencies sampled
df = mean(cellfun(@mean,cellfun(@diff,fAll,'UniformOutput',false)));

fLin = [f_min:df:f_max];

% loop through cell of spectra and index
for j = 1:numel(logIndAll)
    
    spectraAll{j} = spectraAll{j}(logIndAll{j},:);
    
end

% initialize cell for linearized spectra
spectraAll_lin = cell(size(spectraAll));

% loop through spectra, interpolate all, also get max vals
counter = 0;
for j = 1:numel(spectraAll)
    
    % get a set of spectra
    spec = spectraAll{j};
    
    % initialize matrix for linearized spectra
    specLin = zeros(length(fLin),size(spec,2));
    
    % loop through this set of spectra and interpolate
    for k = 1:size(spec,2)
        
        counter = counter + 1;
        
        maxFs(counter) = find(spec(:,k)==max(spec(:,k)));
        
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

% bootstrap for avgs
avgSpectra_lin = bootstrp(nboot,@mean,spectraAll_lin');
ci_lin = bootci(nboot,{@mean,spectraAll_lin'},'alpha',ci_alpha);

% bootstrap for frequency of max power

% first, find the linear indices of these max values
maxInds=find(avgSpectra_lin'==max(avgSpectra_lin'));

% then get the subscript indices of these max values
[I,~]=ind2sub(size(avgSpectra_lin'),maxInds);

% loop through the linear frequencies to find the frequencies of max power
maxFs = zeros(length(I),1);
for j = 1:length(I)
    
    maxFs(j) = fLin(I(j));

end

% convert to wavelength
maxLmbds = 1./maxFs;

% then, bootstrap to get mean and 95% conf ints for max wavelength
avgMaxLmbd = mean(bootstrp(nboot,@mean,maxLmbds));
ci_maxLmbd = bootci(nboot,{@mean,maxLmbds},'alpha',ci_alpha);


% % first, get all maximum power values
% maxVals = max(spectraAll_lin);
% 
% maxVals = find(spectraAll_lin==maxVals);
% 
% % then, get the subscript indices for the max vals
% [I,~]=ind2sub(size(spectraAll_lin),maxVals);
% 
% % use the first subscript indices to find the frequency of the max vals
% maxFs = zeros(length(I),1);
% for j = 1:length(I)
%     
%     maxFs(j) = fLin(I(j));
% 
% end
% 
% avgMaxFs = bootstrp(nboot,@mean,maxFs);
% 
% maxLmbds = 1./maxFs;
% avgMaxLmbd = bootstrp(nboot,@mean,maxLmbds);