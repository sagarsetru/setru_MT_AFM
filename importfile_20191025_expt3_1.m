function mt13xTpx2Coated12bg3MtTpx220191025 = importfile_20191025_expt3_1(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   MT13XTPX2COATED12BG3MTTPX220191025 = IMPORTFILE(FILENAME) Reads data
%   from text file FILENAME for the default selection.
%
%   MT13XTPX2COATED12BG3MTTPX220191025 = IMPORTFILE(FILENAME, STARTROW,
%   ENDROW) Reads data from rows STARTROW through ENDROW of text file
%   FILENAME.
%
% Example:
%   mt13xTpx2Coated12bg3MtTpx220191025 = importfile_20191025_expt3_1('mt1_3xTpx2Coated_12bg_3MtTpx2_20191025', 4, 147);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2019/10/28 10:12:23

%% Initialize variables.
delimiter = ' ';
if nargin<=2
    startRow = 4;
    endRow = inf;
end

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6]
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
mt13xTpx2Coated12bg3MtTpx220191025 = table;
mt13xTpx2Coated12bg3MtTpx220191025.x = cell2mat(raw(:, 1));
mt13xTpx2Coated12bg3MtTpx220191025.y = cell2mat(raw(:, 2));
mt13xTpx2Coated12bg3MtTpx220191025.x1 = cell2mat(raw(:, 3));
mt13xTpx2Coated12bg3MtTpx220191025.y1 = cell2mat(raw(:, 4));
mt13xTpx2Coated12bg3MtTpx220191025.x2 = cell2mat(raw(:, 5));
mt13xTpx2Coated12bg3MtTpx220191025.y2 = cell2mat(raw(:, 6));

