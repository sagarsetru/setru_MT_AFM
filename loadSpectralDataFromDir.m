function fNameStruct = loadSpectralDataFromDir(pathname)
%loadSpectralDataFromDir.m - will get mat file names in pathname

%%

% get the std dev for the power per frequency
fName = dir(fullfile(pathname,'/*stdSpectra*.mat'));
fName = fName.name;
fNameStruct.stdSpectra = [pathname,'/',fName];

% get the average power per frequency
fName = dir(fullfile(pathname,'/*avgSpectra*.mat'));
fName = fName.name;
fNameStruct.avgSpectra = [pathname,'/',fName];

% get the frequencies used
fName = dir(fullfile(pathname,'/frequencies_*.mat'));
fName = fName.name;
fNameStruct.f = [pathname,'/',fName];

% get all the spectra generated
fName = dir(fullfile(pathname,'/spectra_*.mat'));
fName = fName.name;
fNameStruct.spectra = [pathname,'/',fName];

fName = dir(fullfile(pathname,'/indsFor*.mat'));

if numel(fName) == 1
    
    % this MT was analyzed prior to implementing "indsForAverage"
    % variable, so just use all spectra in the spectra variable
    
    % do not need to use input value here
    fNameStruct.indsForAverage = ['USE ALL IN SPECTRA VARIABLE'];
    
elseif numel(fName) == 2
    
    % this MT was analyzed after "indsForAverage" variable was implemented,
    % so have to use specific subset of spectra
    fName = dir(fullfile(pathname,'/indsForAverage*.mat'));
    fName = fName.name;
    fNameStruct.indsForAverage = [pathname,'/',fName];
    
end


end

