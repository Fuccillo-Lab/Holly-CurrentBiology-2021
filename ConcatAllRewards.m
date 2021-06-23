close all;
clear all;
waitfor(msgbox('Please select  files'));
[files,pathname] = uigetfile('*.mat', ...
   'MultiSelect', 'on'); 

name2save = inputdlg('Save name');

tf = ischar(files);

if tf==0
    AcqPsthArray_ITI = loadCat(1, files, 'PsthArray_rITI');
    AcqPsthArray_INITIATION = loadCat(1, files, 'PsthArray_rINITIATION');
    AcqPsthArray_CORRECTPRESS = loadCat(1, files, 'PsthArray_CORRECTPRESS');
    AcqPsthArray_REWARD = loadCat(1, files, 'PsthArray_REWARD');
    
else   
    AcqPsthArray_ITI = cell2mat(struct2cell(load(files, 'PsthArray_rITI')));
    AcqPsthArray_INITIATION = cell2mat(struct2cell(load(files, 'PsthArray_rINITIATION')));
    AcqPsthArray_CORRECTPRESS = cell2mat(struct2cell(load(files, 'PsthArray_CORRECTPRESS')));
    AcqPsthArray_REWARD = cell2mat(struct2cell(load(files, 'PsthArray_REWARD')));
    
end
name2save=cell2mat(name2save);
save(fullfile(pathname,name2save));
