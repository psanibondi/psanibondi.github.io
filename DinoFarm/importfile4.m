function DinoFarmsheet4 = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  DINOFARMSHEET4 = IMPORTFILE(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the numeric data.
%
%  DINOFARMSHEET4 = IMPORTFILE(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  DinoFarmsheet4 = importfile("C:\Users\ITSANIBONDIP\OneDrive - Tetra Pak\Documents\GitHub\psanibondi.github.io\DinoFarm\DinoFarm-sheet4.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 02-Sep-2022 13:19:48

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 25);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2", "VarName3", "VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20", "VarName21", "VarName22", "VarName23", "VarName24", "VarName25"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["VarName2", "VarName3", "VarName6", "VarName10", "VarName16", "VarName17", "VarName23", "VarName24"], "TrimNonNumeric", true);
opts = setvaropts(opts, ["VarName2", "VarName3", "VarName6", "VarName10", "VarName16", "VarName17", "VarName23", "VarName24"], "ThousandsSeparator", ",");

% Import the data
DinoFarmsheet4 = readtable(filename, opts);

%% Convert to output type
DinoFarmsheet4 = table2array(DinoFarmsheet4);
end