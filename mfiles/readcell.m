%% read text file into cell array of string
%SYNTAX: 
%             [cellout] = readcell( filename )
%
%             filename: the string of file path 
%           
function [cellout] = readcell(filename)
    fileID = fopen(filename);
            temp = textscan(fileID,'%s');
            cellout = temp{1}'; % variable names for each column stored in  [Data]
    fclose(fileID); 
