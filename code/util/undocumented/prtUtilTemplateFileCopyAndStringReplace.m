function prtUtilTemplateFileCopyAndStringReplace(templateFile,writeFile,varargin)
% prtUtilTemplateFileReplace(templateFile,writeFile,varargin)

% Copyright (c) 2014 CoVar Applied Technologies
%
% Permission is hereby granted, free of charge, to any person obtaining a
% copy of this software and associated documentation files (the
% "Software"), to deal in the Software without restriction, including
% without limitation the rights to use, copy, modify, merge, publish,
% distribute, sublicense, and/or sell copies of the Software, and to permit
% persons to whom the Software is furnished to do so, subject to the
% following conditions:
%
% The above copyright notice and this permission notice shall be included
% in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
% NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
% DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
% OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
% USE OR OTHER DEALINGS IN THE SOFTWARE.





if ~exist(templateFile,'file')
    error('prtUtilTemplateFileCopyAndStringReplace:missingTemplate','The template file %s was not found.',templateFile);
end
fid = fopen(templateFile,'r');
templateFileString = fscanf(fid,'%c');
fclose(fid);


for i = 1:2:length(varargin)
    templateFileString = strrep(templateFileString,varargin{i},varargin{i+1});
end

fid = fopen(writeFile,'w');
if fid == -1
    error('prtUtilTemplateFileCopyAndStringReplace:CannotOpenFile','Error opening file %s for writing.  File not found, or permission denied',fullMfile);
end
fwrite(fid,templateFileString);
fclose(fid);