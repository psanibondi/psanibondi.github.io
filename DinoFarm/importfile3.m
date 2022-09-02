function DinoFarmsheet3 = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  DINOFARMSHEET3 = IMPORTFILE(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the data as a cell array.
%
%  DINOFARMSHEET3 = IMPORTFILE(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  DinoFarmsheet3 = importfile("C:\Users\ITSANIBONDIP\OneDrive - Tetra Pak\Documents\GitHub\psanibondi.github.io\DinoFarm\DinoFarm-sheet3.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 02-Sep-2022 12:10:46

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 17);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["VarName1", "Tyrannosaurus", "VarName3", "VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17"];
opts.VariableTypes = ["double", "string", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "Tyrannosaurus", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Tyrannosaurus", "EmptyFieldRule", "auto");

% Import the data
DinoFarmsheet3 = readtable(filename, opts);

%% Convert to output type
DinoFarmsheet3 = table2cell(DinoFarmsheet3);
numIdx = cellfun(@(x) ~isnan(str2double(x)), DinoFarmsheet3);
DinoFarmsheet3(numIdx) = cellfun(@(x) {str2double(x)}, DinoFarmsheet3(numIdx));
end