function J20data = importfile1(filename, dataLines)
%IMPORTFILE1 Import data from a text file
%  J20DATA = IMPORTFILE1(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a cell array.
%
%  J20DATA = IMPORTFILE1(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  J20data = importfile1("C:\Users\ITSANIBONDIP\OneDrive - Tetra Pak\Documents\GitHub\psanibondi.github.io\jugger18\J20- data.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 26-Jul-2022 08:36:04

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 9);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["ID", "NOME", "Velocit", "Ruolo", "VarName5", "Sum", "Supermossapower", "Supermossanumber", "Supermossa"];
opts.VariableTypes = ["double", "string", "double", "string", "double", "double", "double", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["NOME", "Ruolo", "Supermossa"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["NOME", "Ruolo", "Supermossa"], "EmptyFieldRule", "auto");

% Import the data
J20data = readtable(filename, opts);

%% Convert to output type
J20data = table2cell(J20data);
numIdx = cellfun(@(x) ~isnan(str2double(x)), J20data);
J20data(numIdx) = cellfun(@(x) {str2double(x)}, J20data(numIdx));
end