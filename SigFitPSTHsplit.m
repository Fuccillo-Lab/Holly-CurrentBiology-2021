
close all;
clear all;

[file, folder] = uigetfile;
savename = inputdlg('Enter Mouse ID');
savename = cell2mat(savename);
savename =strcat(savename,'_SigFitPSTHbins');
load(file, 'AcqPsthArray_ITI', 'AcqPsthArray_INITIATION', 'AcqPsthArray_CORRECTPRESS', 'AcqPsthArray_REWARD');
bins = inputdlg({'Last trial first bin', 'Last trial second bin'})
bin1end = str2num(bins{1});
bin2beg = bin1end+1;
bin2end = str2num(bins{2});
bin3beg = bin2end+1;
bin3end = size(AcqPsthArray_REWARD,1);

SigBin1PsthArray_ITI = AcqPsthArray_ITI(1:bin1end,:);
SigBin2PsthArray_ITI = AcqPsthArray_ITI(bin2beg:bin2end,:);
SigBin3PsthArray_ITI = AcqPsthArray_ITI(bin3beg:bin3end,:);
SigBin1PsthArray_INITIATION = AcqPsthArray_INITIATION(1:bin1end,:);
SigBin2PsthArray_INITIATION = AcqPsthArray_INITIATION(bin2beg:bin2end,:);
SigBin3PsthArray_INITIATION = AcqPsthArray_INITIATION(bin3beg:bin3end,:);
SigBin1PsthArray_CORRECTPRESS = AcqPsthArray_CORRECTPRESS(1:bin1end,:);
SigBin2PsthArray_CORRECTPRESS = AcqPsthArray_CORRECTPRESS(bin2beg:bin2end,:);
SigBin3PsthArray_CORRECTPRESS = AcqPsthArray_CORRECTPRESS(bin3beg:bin3end,:);
SigBin1PsthArray_REWARD = AcqPsthArray_REWARD(1:bin1end,:);
SigBin2PsthArray_REWARD = AcqPsthArray_REWARD(bin2beg:bin2end,:);
SigBin3PsthArray_REWARD = AcqPsthArray_REWARD(bin3beg:bin3end,:);

SigBin1PSTH_ITI = nanmean(SigBin1PsthArray_ITI);
SigBin2PSTH_ITI = nanmean(SigBin2PsthArray_ITI);
SigBin3PSTH_ITI = nanmean(SigBin3PsthArray_ITI);
SigBin1PSTH_INITIATION = nanmean(SigBin1PsthArray_INITIATION);
SigBin2PSTH_INITIATION = nanmean(SigBin2PsthArray_INITIATION);
SigBin3PSTH_INITIATION = nanmean(SigBin3PsthArray_INITIATION);
SigBin1PSTH_CORRECTPRESS = nanmean(SigBin1PsthArray_CORRECTPRESS);
SigBin2PSTH_CORRECTPRESS = nanmean(SigBin2PsthArray_CORRECTPRESS);
SigBin3PSTH_CORRECTPRESS = nanmean(SigBin3PsthArray_CORRECTPRESS);
SigBin1PSTH_REWARD = nanmean(SigBin1PsthArray_REWARD);
SigBin2PSTH_REWARD = nanmean(SigBin2PsthArray_REWARD);
SigBin3PSTH_REWARD = nanmean(SigBin3PsthArray_REWARD);

save(fullfile(folder,savename));

