%% Import data from text file.
% Script for importing data from the following text file:
%
%    /Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_2468bg_1357mtTpx2Coated1x_frame165_20191031
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2019/11/17 13:34:06

%% Initialize variables.
filename = '/Users/sagarsetru/Documents/Princeton/woods hole physio 2019/afm data stevens/2019 10 31 tpx2 brb80 concentration tests/expt1 1x tpx2 100nM 300nM/expt1_2468bg_1357mtTpx2Coated1x_frame165_20191031';
delimiter = ' ';
startRow = 4;

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
expt12468bg1357mtTpx2Coated1xframe16520191031 = table;
expt12468bg1357mtTpx2Coated1xframe16520191031.x = cell2mat(raw(:, 1));
expt12468bg1357mtTpx2Coated1xframe16520191031.y = cell2mat(raw(:, 2));
expt12468bg1357mtTpx2Coated1xframe16520191031.x1 = cell2mat(raw(:, 3));
expt12468bg1357mtTpx2Coated1xframe16520191031.y1 = cell2mat(raw(:, 4));
expt12468bg1357mtTpx2Coated1xframe16520191031.x2 = cell2mat(raw(:, 5));
expt12468bg1357mtTpx2Coated1xframe16520191031.y2 = cell2mat(raw(:, 6));
expt12468bg1357mtTpx2Coated1xframe16520191031.x3 = cell2mat(raw(:, 7));
expt12468bg1357mtTpx2Coated1xframe16520191031.y3 = cell2mat(raw(:, 8));
expt12468bg1357mtTpx2Coated1xframe16520191031.x4 = cell2mat(raw(:, 9));
expt12468bg1357mtTpx2Coated1xframe16520191031.y4 = cell2mat(raw(:, 10));
expt12468bg1357mtTpx2Coated1xframe16520191031.x5 = cell2mat(raw(:, 11));
expt12468bg1357mtTpx2Coated1xframe16520191031.y5 = cell2mat(raw(:, 12));
expt12468bg1357mtTpx2Coated1xframe16520191031.x6 = cell2mat(raw(:, 13));
expt12468bg1357mtTpx2Coated1xframe16520191031.y6 = cell2mat(raw(:, 14));
expt12468bg1357mtTpx2Coated1xframe16520191031.x7 = cell2mat(raw(:, 15));
expt12468bg1357mtTpx2Coated1xframe16520191031.y7 = cell2mat(raw(:, 16));

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp R;