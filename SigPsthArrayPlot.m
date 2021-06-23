close all;
clear all;

waitfor(msgbox('Please select mRuby files'));
[mRubyfiles,mRubypathname] = uigetfile('*.mat', ...
   'MultiSelect', 'on'); 
waitfor(msgbox('Please select Kir files'));
[Kirfiles,Kirpathname] = uigetfile('*.mat', ...
   'MultiSelect', 'on'); 


mRubySigBin1_ITI = loadCat(1, mRubyfiles, 'SigBin1PsthArray_ITI');
mRubySigBin1_INITIATION = loadCat(1, mRubyfiles, 'SigBin1PsthArray_INITIATION');
mRubySigBin1_CORRECTPRESS = loadCat(1, mRubyfiles, 'SigBin1PsthArray_CORRECTPRESS');
mRubySigBin1_REWARD = loadCat(1, mRubyfiles, 'SigBin1PsthArray_REWARD');
mRubySigBin2_ITI = loadCat(1, mRubyfiles, 'SigBin2PsthArray_ITI');
mRubySigBin2_INITIATION = loadCat(1, mRubyfiles, 'SigBin2PsthArray_INITIATION');
mRubySigBin2_CORRECTPRESS = loadCat(1, mRubyfiles, 'SigBin2PsthArray_CORRECTPRESS');
mRubySigBin2_REWARD = loadCat(1, mRubyfiles, 'SigBin2PsthArray_REWARD');
mRubySigBin3_ITI = loadCat(1, mRubyfiles, 'SigBin3PsthArray_ITI');
mRubySigBin3_INITIATION = loadCat(1, mRubyfiles, 'SigBin3PsthArray_INITIATION');
mRubySigBin3_CORRECTPRESS = loadCat(1, mRubyfiles, 'SigBin3PsthArray_CORRECTPRESS');
mRubySigBin3_REWARD = loadCat(1, mRubyfiles, 'SigBin3PsthArray_REWARD');

Psth_mRubySigBin1_ITI = loadCat(1, mRubyfiles, 'SigBin1PSTH_ITI');
Psth_mRubySigBin1_INITIATION =loadCat(1,mRubyfiles,'SigBin1PSTH_INITIATION');
Psth_mRubySigBin1_CORRECTPRESS = loadCat(1,mRubyfiles,'SigBin1PSTH_CORRECTPRESS');
Psth_mRubySigBin1_REWARD = loadCat(1,mRubyfiles,'SigBin1PSTH_REWARD');
Psth_mRubySigBin2_ITI = loadCat(1, mRubyfiles, 'SigBin2PSTH_ITI');
Psth_mRubySigBin2_INITIATION =loadCat(1,mRubyfiles,'SigBin2PSTH_INITIATION');
Psth_mRubySigBin2_CORRECTPRESS = loadCat(1,mRubyfiles,'SigBin2PSTH_CORRECTPRESS');
Psth_mRubySigBin2_REWARD = loadCat(1,mRubyfiles,'SigBin2PSTH_REWARD');
Psth_mRubySigBin3_ITI = loadCat(1, mRubyfiles, 'SigBin3PSTH_ITI');
Psth_mRubySigBin3_INITIATION =loadCat(1,mRubyfiles,'SigBin3PSTH_INITIATION');
Psth_mRubySigBin3_CORRECTPRESS = loadCat(1,mRubyfiles,'SigBin3PSTH_CORRECTPRESS');
Psth_mRubySigBin3_REWARD = loadCat(1,mRubyfiles,'SigBin3PSTH_REWARD');

KirSigBin1_ITI = loadCat(1, Kirfiles, 'SigBin1PsthArray_ITI');
KirSigBin1_INITIATION = loadCat(1, Kirfiles, 'SigBin1PsthArray_INITIATION');
KirSigBin1_CORRECTPRESS = loadCat(1, Kirfiles, 'SigBin1PsthArray_CORRECTPRESS');
KirSigBin1_REWARD = loadCat(1, Kirfiles, 'SigBin1PsthArray_REWARD');
KirSigBin2_ITI = loadCat(1, Kirfiles, 'SigBin2PsthArray_ITI');
KirSigBin2_INITIATION = loadCat(1, Kirfiles, 'SigBin2PsthArray_INITIATION');
KirSigBin2_CORRECTPRESS = loadCat(1, Kirfiles, 'SigBin2PsthArray_CORRECTPRESS');
KirSigBin2_REWARD = loadCat(1, Kirfiles, 'SigBin2PsthArray_REWARD');
KirSigBin3_ITI = loadCat(1, Kirfiles, 'SigBin3PsthArray_ITI');
KirSigBin3_INITIATION = loadCat(1, Kirfiles, 'SigBin3PsthArray_INITIATION');
KirSigBin3_CORRECTPRESS = loadCat(1, Kirfiles, 'SigBin3PsthArray_CORRECTPRESS');
KirSigBin3_REWARD = loadCat(1, Kirfiles, 'SigBin3PsthArray_REWARD');

Psth_KirSigBin1_ITI = loadCat(1, Kirfiles, 'SigBin1PSTH_ITI');
Psth_KirSigBin1_INITIATION =loadCat(1,Kirfiles,'SigBin1PSTH_INITIATION');
Psth_KirSigBin1_CORRECTPRESS = loadCat(1,Kirfiles,'SigBin1PSTH_CORRECTPRESS');
Psth_KirSigBin1_REWARD = loadCat(1,Kirfiles,'SigBin1PSTH_REWARD');
Psth_KirSigBin2_ITI = loadCat(1, Kirfiles, 'SigBin2PSTH_ITI');
Psth_KirSigBin2_INITIATION =loadCat(1,Kirfiles,'SigBin2PSTH_INITIATION');
Psth_KirSigBin2_CORRECTPRESS = loadCat(1,Kirfiles,'SigBin2PSTH_CORRECTPRESS');
Psth_KirSigBin2_REWARD = loadCat(1,Kirfiles,'SigBin2PSTH_REWARD');
Psth_KirSigBin3_ITI = loadCat(1, Kirfiles, 'SigBin3PSTH_ITI');
Psth_KirSigBin3_INITIATION =loadCat(1,Kirfiles,'SigBin3PSTH_INITIATION');
Psth_KirSigBin3_CORRECTPRESS = loadCat(1,Kirfiles,'SigBin3PSTH_CORRECTPRESS');
Psth_KirSigBin3_REWARD = loadCat(1,Kirfiles,'SigBin3PSTH_REWARD');

PSTH_mRubySigBin1_ITI = nanmean(mRubySigBin1_ITI);
err_mRubySigBin1_ITI = (nanstd(mRubySigBin1_ITI))/sqrt(size(mRubySigBin1_ITI,1));
PosErr_mRubySigBin1_ITI = PSTH_mRubySigBin1_ITI + err_mRubySigBin1_ITI;
NegErr_mRubySigBin1_ITI = PSTH_mRubySigBin1_ITI - err_mRubySigBin1_ITI;
PSTH_mRubySigBin1_INITIATION = nanmean(mRubySigBin1_INITIATION);
err_mRubySigBin1_INITIATION = (nanstd(mRubySigBin1_INITIATION))/sqrt(size(mRubySigBin1_INITIATION,1));
PosErr_mRubySigBin1_INITIATION = PSTH_mRubySigBin1_INITIATION + err_mRubySigBin1_INITIATION;
NegErr_mRubySigBin1_INITIATION = PSTH_mRubySigBin1_INITIATION - err_mRubySigBin1_INITIATION;
PSTH_mRubySigBin1_CORRECTPRESS = nanmean(mRubySigBin1_CORRECTPRESS);
err_mRubySigBin1_CORRECTPRESS = (nanstd(mRubySigBin1_CORRECTPRESS))/sqrt(size(mRubySigBin1_CORRECTPRESS,1));
PosErr_mRubySigBin1_CORRECTPRESS = PSTH_mRubySigBin1_CORRECTPRESS + err_mRubySigBin1_CORRECTPRESS;
NegErr_mRubySigBin1_CORRECTPRESS = PSTH_mRubySigBin1_CORRECTPRESS - err_mRubySigBin1_CORRECTPRESS;
PSTH_mRubySigBin1_REWARD = nanmean(mRubySigBin1_REWARD);
err_mRubySigBin1_REWARD = (nanstd(mRubySigBin1_REWARD))/sqrt(size(mRubySigBin1_REWARD,1));
PosErr_mRubySigBin1_REWARD = PSTH_mRubySigBin1_REWARD + err_mRubySigBin1_REWARD;
NegErr_mRubySigBin1_REWARD = PSTH_mRubySigBin1_REWARD - err_mRubySigBin1_REWARD;
PSTH_mRubySigBin2_ITI = nanmean(mRubySigBin2_ITI);
err_mRubySigBin2_ITI = (nanstd(mRubySigBin2_ITI))/sqrt(size(mRubySigBin2_ITI,1));
PosErr_mRubySigBin2_ITI = PSTH_mRubySigBin2_ITI + err_mRubySigBin2_ITI;
NegErr_mRubySigBin2_ITI = PSTH_mRubySigBin2_ITI - err_mRubySigBin2_ITI;
PSTH_mRubySigBin2_INITIATION = nanmean(mRubySigBin2_INITIATION);
err_mRubySigBin2_INITIATION = (nanstd(mRubySigBin2_INITIATION))/sqrt(size(mRubySigBin2_INITIATION,1));
PosErr_mRubySigBin2_INITIATION = PSTH_mRubySigBin2_INITIATION + err_mRubySigBin2_INITIATION;
NegErr_mRubySigBin2_INITIATION = PSTH_mRubySigBin2_INITIATION - err_mRubySigBin2_INITIATION;
PSTH_mRubySigBin2_CORRECTPRESS = nanmean(mRubySigBin2_CORRECTPRESS);
err_mRubySigBin2_CORRECTPRESS = (nanstd(mRubySigBin2_CORRECTPRESS))/sqrt(size(mRubySigBin2_CORRECTPRESS,1));
PosErr_mRubySigBin2_CORRECTPRESS = PSTH_mRubySigBin2_CORRECTPRESS + err_mRubySigBin2_CORRECTPRESS;
NegErr_mRubySigBin2_CORRECTPRESS = PSTH_mRubySigBin2_CORRECTPRESS - err_mRubySigBin2_CORRECTPRESS;
PSTH_mRubySigBin2_REWARD = nanmean(mRubySigBin2_REWARD);
err_mRubySigBin2_REWARD = (nanstd(mRubySigBin2_REWARD))/sqrt(size(mRubySigBin2_REWARD,1));
PosErr_mRubySigBin2_REWARD = PSTH_mRubySigBin2_REWARD + err_mRubySigBin2_REWARD;
NegErr_mRubySigBin2_REWARD = PSTH_mRubySigBin2_REWARD - err_mRubySigBin2_REWARD;
PSTH_mRubySigBin3_ITI = nanmean(mRubySigBin3_ITI);
err_mRubySigBin3_ITI = (nanstd(mRubySigBin3_ITI))/sqrt(size(mRubySigBin3_ITI,1));
PosErr_mRubySigBin3_ITI = PSTH_mRubySigBin3_ITI + err_mRubySigBin3_ITI;
NegErr_mRubySigBin3_ITI = PSTH_mRubySigBin3_ITI - err_mRubySigBin3_ITI;
PSTH_mRubySigBin3_INITIATION = nanmean(mRubySigBin3_INITIATION);
err_mRubySigBin3_INITIATION = (nanstd(mRubySigBin3_INITIATION))/sqrt(size(mRubySigBin3_INITIATION,1));
PosErr_mRubySigBin3_INITIATION = PSTH_mRubySigBin3_INITIATION + err_mRubySigBin3_INITIATION;
NegErr_mRubySigBin3_INITIATION = PSTH_mRubySigBin3_INITIATION - err_mRubySigBin3_INITIATION;
PSTH_mRubySigBin3_CORRECTPRESS = nanmean(mRubySigBin3_CORRECTPRESS);
err_mRubySigBin3_CORRECTPRESS = (nanstd(mRubySigBin3_CORRECTPRESS))/sqrt(size(mRubySigBin3_CORRECTPRESS,1));
PosErr_mRubySigBin3_CORRECTPRESS = PSTH_mRubySigBin3_CORRECTPRESS + err_mRubySigBin3_CORRECTPRESS;
NegErr_mRubySigBin3_CORRECTPRESS = PSTH_mRubySigBin3_CORRECTPRESS - err_mRubySigBin3_CORRECTPRESS;
PSTH_mRubySigBin3_REWARD = nanmean(mRubySigBin3_REWARD);
err_mRubySigBin3_REWARD = (nanstd(mRubySigBin3_REWARD))/sqrt(size(mRubySigBin3_REWARD,1));
PosErr_mRubySigBin3_REWARD = PSTH_mRubySigBin3_REWARD + err_mRubySigBin3_REWARD;
NegErr_mRubySigBin3_REWARD = PSTH_mRubySigBin3_REWARD - err_mRubySigBin3_REWARD;

PSTH_KirSigBin1_ITI = nanmean(KirSigBin1_ITI);
err_KirSigBin1_ITI = (nanstd(KirSigBin1_ITI))/sqrt(size(KirSigBin1_ITI,1));
PosErr_KirSigBin1_ITI = PSTH_KirSigBin1_ITI + err_KirSigBin1_ITI;
NegErr_KirSigBin1_ITI = PSTH_KirSigBin1_ITI - err_KirSigBin1_ITI;
PSTH_KirSigBin1_INITIATION = nanmean(KirSigBin1_INITIATION);
err_KirSigBin1_INITIATION = (nanstd(KirSigBin1_INITIATION))/sqrt(size(KirSigBin1_INITIATION,1));
PosErr_KirSigBin1_INITIATION = PSTH_KirSigBin1_INITIATION + err_KirSigBin1_INITIATION;
NegErr_KirSigBin1_INITIATION = PSTH_KirSigBin1_INITIATION - err_KirSigBin1_INITIATION;
PSTH_KirSigBin1_CORRECTPRESS = nanmean(KirSigBin1_CORRECTPRESS);
err_KirSigBin1_CORRECTPRESS = (nanstd(KirSigBin1_CORRECTPRESS))/sqrt(size(KirSigBin1_CORRECTPRESS,1));
PosErr_KirSigBin1_CORRECTPRESS = PSTH_KirSigBin1_CORRECTPRESS + err_KirSigBin1_CORRECTPRESS;
NegErr_KirSigBin1_CORRECTPRESS = PSTH_KirSigBin1_CORRECTPRESS - err_KirSigBin1_CORRECTPRESS;
PSTH_KirSigBin1_REWARD = nanmean(KirSigBin1_REWARD);
err_KirSigBin1_REWARD = (nanstd(KirSigBin1_REWARD))/sqrt(size(KirSigBin1_REWARD,1));
PosErr_KirSigBin1_REWARD = PSTH_KirSigBin1_REWARD + err_KirSigBin1_REWARD;
NegErr_KirSigBin1_REWARD = PSTH_KirSigBin1_REWARD - err_KirSigBin1_REWARD;
PSTH_KirSigBin2_ITI = nanmean(KirSigBin2_ITI);
err_KirSigBin2_ITI = (nanstd(KirSigBin2_ITI))/sqrt(size(KirSigBin2_ITI,1));
PosErr_KirSigBin2_ITI = PSTH_KirSigBin2_ITI + err_KirSigBin2_ITI;
NegErr_KirSigBin2_ITI = PSTH_KirSigBin2_ITI - err_KirSigBin2_ITI;
PSTH_KirSigBin2_INITIATION = nanmean(KirSigBin2_INITIATION);
err_KirSigBin2_INITIATION = (nanstd(KirSigBin2_INITIATION))/sqrt(size(KirSigBin2_INITIATION,1));
PosErr_KirSigBin2_INITIATION = PSTH_KirSigBin2_INITIATION + err_KirSigBin2_INITIATION;
NegErr_KirSigBin2_INITIATION = PSTH_KirSigBin2_INITIATION - err_KirSigBin2_INITIATION;
PSTH_KirSigBin2_CORRECTPRESS = nanmean(KirSigBin2_CORRECTPRESS);
err_KirSigBin2_CORRECTPRESS = (nanstd(KirSigBin2_CORRECTPRESS))/sqrt(size(KirSigBin2_CORRECTPRESS,1));
PosErr_KirSigBin2_CORRECTPRESS = PSTH_KirSigBin2_CORRECTPRESS + err_KirSigBin2_CORRECTPRESS;
NegErr_KirSigBin2_CORRECTPRESS = PSTH_KirSigBin2_CORRECTPRESS - err_KirSigBin2_CORRECTPRESS;
PSTH_KirSigBin2_REWARD = nanmean(KirSigBin2_REWARD);
err_KirSigBin2_REWARD = (nanstd(KirSigBin2_REWARD))/sqrt(size(KirSigBin2_REWARD,1));
PosErr_KirSigBin2_REWARD = PSTH_KirSigBin2_REWARD + err_KirSigBin2_REWARD;
NegErr_KirSigBin2_REWARD = PSTH_KirSigBin2_REWARD - err_KirSigBin2_REWARD;
PSTH_KirSigBin3_ITI = nanmean(KirSigBin3_ITI);
err_KirSigBin3_ITI = (nanstd(KirSigBin3_ITI))/sqrt(size(KirSigBin3_ITI,1));
PosErr_KirSigBin3_ITI = PSTH_KirSigBin3_ITI + err_KirSigBin3_ITI;
NegErr_KirSigBin3_ITI = PSTH_KirSigBin3_ITI - err_KirSigBin3_ITI;
PSTH_KirSigBin3_INITIATION = nanmean(KirSigBin3_INITIATION);
err_KirSigBin3_INITIATION = (nanstd(KirSigBin3_INITIATION))/sqrt(size(KirSigBin3_INITIATION,1));
PosErr_KirSigBin3_INITIATION = PSTH_KirSigBin3_INITIATION + err_KirSigBin3_INITIATION;
NegErr_KirSigBin3_INITIATION = PSTH_KirSigBin3_INITIATION - err_KirSigBin3_INITIATION;
PSTH_KirSigBin3_CORRECTPRESS = nanmean(KirSigBin3_CORRECTPRESS);
err_KirSigBin3_CORRECTPRESS = (nanstd(KirSigBin3_CORRECTPRESS))/sqrt(size(KirSigBin3_CORRECTPRESS,1));
PosErr_KirSigBin3_CORRECTPRESS = PSTH_KirSigBin3_CORRECTPRESS + err_KirSigBin3_CORRECTPRESS;
NegErr_KirSigBin3_CORRECTPRESS = PSTH_KirSigBin3_CORRECTPRESS - err_KirSigBin3_CORRECTPRESS;
PSTH_KirSigBin3_REWARD = nanmean(KirSigBin3_REWARD);
err_KirSigBin3_REWARD = (nanstd(KirSigBin3_REWARD))/sqrt(size(KirSigBin3_REWARD,1));
PosErr_KirSigBin3_REWARD = PSTH_KirSigBin3_REWARD + err_KirSigBin3_REWARD;
NegErr_KirSigBin3_REWARD = PSTH_KirSigBin3_REWARD - err_KirSigBin3_REWARD;


%AUC analysis
WindowSize = 1 %in seconds, for AUC integral
samplingRate = 40;
[AUC_ITI_mRubySigBin1_Pre, AUC_ITI_mRubySigBin1_Post, AUC_ITI_mRubySigBin1_Total] = AUCmod(mRubySigBin1_ITI,WindowSize,samplingRate);
[AUC_ITI_mRubySigBin2_Pre, AUC_ITI_mRubySigBin2_Post, AUC_ITI_mRubySigBin2_Total] = AUCmod(mRubySigBin2_ITI,WindowSize,samplingRate);
[AUC_ITI_mRubySigBin3_Pre, AUC_ITI_mRubySigBin3_Post, AUC_ITI_mRubySigBin3_Total] = AUCmod(mRubySigBin3_ITI,WindowSize,samplingRate);
[AUC_INITIATION_mRubySigBin1_Pre, AUC_INITIATION_mRubySigBin1_Post, AUC_INITIATION_mRubySigBin1_Total] = AUCmod(mRubySigBin1_INITIATION,WindowSize,samplingRate);
[AUC_INITIATION_mRubySigBin2_Pre, AUC_INITIATION_mRubySigBin2_Post, AUC_INITIATION_mRubySigBin2_Total] = AUCmod(mRubySigBin2_INITIATION,WindowSize,samplingRate);
[AUC_INITIATION_mRubySigBin3_Pre, AUC_INITIATION_mRubySigBin3_Post, AUC_INITIATION_mRubySigBin3_Total] = AUCmod(mRubySigBin3_INITIATION,WindowSize,samplingRate);
[AUC_CORRECTPRESS_mRubySigBin1_Pre, AUC_CORRECTPRESS_mRubySigBin1_Post, AUC_CORRECTPRESS_mRubySigBin1_Total] = AUCmod(mRubySigBin1_CORRECTPRESS,WindowSize,samplingRate);
[AUC_CORRECTPRESS_mRubySigBin2_Pre, AUC_CORRECTPRESS_mRubySigBin2_Post, AUC_CORRECTPRESS_mRubySigBin2_Total] = AUCmod(mRubySigBin2_CORRECTPRESS,WindowSize,samplingRate);
[AUC_CORRECTPRESS_mRubySigBin3_Pre, AUC_CORRECTPRESS_mRubySigBin3_Post, AUC_CORRECTPRESS_mRubySigBin3_Total] = AUCmod(mRubySigBin3_CORRECTPRESS,WindowSize,samplingRate);
[AUC_REWARD_mRubySigBin1_Pre, AUC_REWARD_mRubySigBin1_Post, AUC_REWARD_mRubySigBin1_Total] = AUCmod(mRubySigBin1_REWARD,WindowSize,samplingRate);
[AUC_REWARD_mRubySigBin2_Pre, AUC_REWARD_mRubySigBin2_Post, AUC_REWARD_mRubySigBin2_Total] = AUCmod(mRubySigBin2_REWARD,WindowSize,samplingRate);
[AUC_REWARD_mRubySigBin3_Pre, AUC_REWARD_mRubySigBin3_Post, AUC_REWARD_mRubySigBin3_Total] = AUCmod(mRubySigBin3_REWARD,WindowSize,samplingRate);

[AUC_ITI_KirSigBin1_Pre, AUC_ITI_KirSigBin1_Post, AUC_ITI_KirSigBin1_Total] = AUCmod(KirSigBin1_ITI,WindowSize,samplingRate);
[AUC_ITI_KirSigBin2_Pre, AUC_ITI_KirSigBin2_Post, AUC_ITI_KirSigBin2_Total] = AUCmod(KirSigBin2_ITI,WindowSize,samplingRate);
[AUC_ITI_KirSigBin3_Pre, AUC_ITI_KirSigBin3_Post, AUC_ITI_KirSigBin3_Total] = AUCmod(KirSigBin3_ITI,WindowSize,samplingRate);
[AUC_INITIATION_KirSigBin1_Pre, AUC_INITIATION_KirSigBin1_Post, AUC_INITIATION_KirSigBin1_Total] = AUCmod(KirSigBin1_INITIATION,WindowSize,samplingRate);
[AUC_INITIATION_KirSigBin2_Pre, AUC_INITIATION_KirSigBin2_Post, AUC_INITIATION_KirSigBin2_Total] = AUCmod(KirSigBin2_INITIATION,WindowSize,samplingRate);
[AUC_INITIATION_KirSigBin3_Pre, AUC_INITIATION_KirSigBin3_Post, AUC_INITIATION_KirSigBin3_Total] = AUCmod(KirSigBin3_INITIATION,WindowSize,samplingRate);
[AUC_CORRECTPRESS_KirSigBin1_Pre, AUC_CORRECTPRESS_KirSigBin1_Post, AUC_CORRECTPRESS_KirSigBin1_Total] = AUCmod(KirSigBin1_CORRECTPRESS,WindowSize,samplingRate);
[AUC_CORRECTPRESS_KirSigBin2_Pre, AUC_CORRECTPRESS_KirSigBin2_Post, AUC_CORRECTPRESS_KirSigBin2_Total] = AUCmod(KirSigBin2_CORRECTPRESS,WindowSize,samplingRate);
[AUC_CORRECTPRESS_KirSigBin3_Pre, AUC_CORRECTPRESS_KirSigBin3_Post, AUC_CORRECTPRESS_KirSigBin3_Total] = AUCmod(KirSigBin3_CORRECTPRESS,WindowSize,samplingRate);
[AUC_REWARD_KirSigBin1_Pre, AUC_REWARD_KirSigBin1_Post, AUC_REWARD_KirSigBin1_Total] = AUCmod(KirSigBin1_REWARD,WindowSize,samplingRate);
[AUC_REWARD_KirSigBin2_Pre, AUC_REWARD_KirSigBin2_Post, AUC_REWARD_KirSigBin2_Total] = AUCmod(KirSigBin2_REWARD,WindowSize,samplingRate);
[AUC_REWARD_KirSigBin3_Pre, AUC_REWARD_KirSigBin3_Post, AUC_REWARD_KirSigBin3_Total] = AUCmod(KirSigBin3_REWARD,WindowSize,samplingRate);

WindowSize2 = 0.5;
[AUC_REWARD_mRubySigBin1_Pre05] = AUCmod(mRubySigBin1_REWARD, WindowSize2, samplingRate);
[AUC_REWARD_mRubySigBin2_Pre05] = AUCmod(mRubySigBin2_REWARD, WindowSize2, samplingRate);
[AUC_REWARD_mRubySigBin3_Pre05] = AUCmod(mRubySigBin3_REWARD, WindowSize2, samplingRate);
[AUC_REWARD_KirSigBin1_Pre05] = AUCmod(KirSigBin1_REWARD, WindowSize2, samplingRate);
[AUC_REWARD_KirSigBin2_Pre05] = AUCmod(KirSigBin2_REWARD, WindowSize2, samplingRate);
[AUC_REWARD_KirSigBin3_Pre05] = AUCmod(KirSigBin3_REWARD, WindowSize2, samplingRate);

AUC_REWARD_mRubySigBin1_Total05 = AUC_REWARD_mRubySigBin1_Pre05+AUC_REWARD_mRubySigBin1_Post;
AUC_REWARD_mRubySigBin2_Total05 = AUC_REWARD_mRubySigBin2_Pre05+AUC_REWARD_mRubySigBin2_Post;
AUC_REWARD_mRubySigBin3_Total05 = AUC_REWARD_mRubySigBin3_Pre05+AUC_REWARD_mRubySigBin3_Post;
AUC_REWARD_KirSigBin1_Total05 = AUC_REWARD_KirSigBin1_Pre05+AUC_REWARD_KirSigBin1_Post;
AUC_REWARD_KirSigBin2_Total05 = AUC_REWARD_KirSigBin2_Pre05+AUC_REWARD_KirSigBin2_Post;
AUC_REWARD_KirSigBin3_Total05 = AUC_REWARD_KirSigBin3_Pre05+AUC_REWARD_KirSigBin3_Post;

%Making Table for Statistics
SubjAUC_ITI_mRubySigBin1 = subj4AUC(mRubyfiles, 'SigBin1PsthArray_ITI');
SubjAUC_ITI_mRubySigBin2 = subj4AUC(mRubyfiles, 'SigBin2PsthArray_ITI');
SubjAUC_ITI_mRubySigBin3 = subj4AUC(mRubyfiles, 'SigBin3PsthArray_ITI');
SubjAUC_INITIATION_mRubySigBin1 = subj4AUC(mRubyfiles, 'SigBin1PsthArray_INITIATION');
SubjAUC_INITIATION_mRubySigBin2 = subj4AUC(mRubyfiles, 'SigBin2PsthArray_INITIATION');
SubjAUC_INITIATION_mRubySigBin3 = subj4AUC(mRubyfiles, 'SigBin3PsthArray_INITIATION');
SubjAUC_CORRECTPRESS_mRubySigBin1 = subj4AUC(mRubyfiles, 'SigBin1PsthArray_CORRECTPRESS');
SubjAUC_CORRECTPRESS_mRubySigBin2 = subj4AUC(mRubyfiles, 'SigBin2PsthArray_CORRECTPRESS');
SubjAUC_CORRECTPRESS_mRubySigBin3 = subj4AUC(mRubyfiles, 'SigBin3PsthArray_CORRECTPRESS');
SubjAUC_REWARD_mRubySigBin1 = subj4AUC(mRubyfiles, 'SigBin1PsthArray_REWARD');
SubjAUC_REWARD_mRubySigBin2 = subj4AUC(mRubyfiles, 'SigBin2PsthArray_REWARD');
SubjAUC_REWARD_mRubySigBin3 = subj4AUC(mRubyfiles, 'SigBin3PsthArray_REWARD');

SubjAUC_ITI_KirSigBin1 = subj4AUC(Kirfiles, 'SigBin1PsthArray_ITI');
SubjAUC_ITI_KirSigBin2 = subj4AUC(Kirfiles, 'SigBin2PsthArray_ITI');
SubjAUC_ITI_KirSigBin3 = subj4AUC(Kirfiles, 'SigBin3PsthArray_ITI');
SubjAUC_INITIATION_KirSigBin1 = subj4AUC(Kirfiles, 'SigBin1PsthArray_INITIATION');
SubjAUC_INITIATION_KirSigBin2 = subj4AUC(Kirfiles, 'SigBin2PsthArray_INITIATION');
SubjAUC_INITIATION_KirSigBin3 = subj4AUC(Kirfiles, 'SigBin3PsthArray_INITIATION');
SubjAUC_CORRECTPRESS_KirSigBin1 = subj4AUC(Kirfiles, 'SigBin1PsthArray_CORRECTPRESS');
SubjAUC_CORRECTPRESS_KirSigBin2 = subj4AUC(Kirfiles, 'SigBin2PsthArray_CORRECTPRESS');
SubjAUC_CORRECTPRESS_KirSigBin3 = subj4AUC(Kirfiles, 'SigBin3PsthArray_CORRECTPRESS');
SubjAUC_REWARD_KirSigBin1 = subj4AUC(Kirfiles, 'SigBin1PsthArray_REWARD');
SubjAUC_REWARD_KirSigBin2 = subj4AUC(Kirfiles, 'SigBin2PsthArray_REWARD');
SubjAUC_REWARD_KirSigBin3 = subj4AUC(Kirfiles, 'SigBin3PsthArray_REWARD');

BinAUC_mRubySigBin1 = transpose(repelem({'Bin1'},numel(AUC_ITI_mRubySigBin1_Total)));
BinAUC_mRubySigBin2 = transpose(repelem({'Bin2'},numel(AUC_ITI_mRubySigBin2_Total)));
BinAUC_mRubySigBin3 = transpose(repelem({'Bin3'},numel(AUC_ITI_mRubySigBin3_Total)));
BinAUC_KirSigBin1 = transpose(repelem({'Bin1'},numel(AUC_ITI_KirSigBin1_Total)));
BinAUC_KirSigBin2 = transpose(repelem({'Bin2'},numel(AUC_ITI_KirSigBin2_Total)));
BinAUC_KirSigBin3 = transpose(repelem({'Bin3'},numel(AUC_ITI_KirSigBin3_Total)));

VirusAUC_mRubySigBin1 = transpose(repelem({'mRuby'},numel(AUC_ITI_mRubySigBin1_Total)));
VirusAUC_mRubySigBin2 = transpose(repelem({'mRuby'},numel(AUC_ITI_mRubySigBin2_Total)));
VirusAUC_mRubySigBin3 = transpose(repelem({'mRuby'},numel(AUC_ITI_mRubySigBin3_Total)));
VirusAUC_KirSigBin1 = transpose(repelem({'Kir'},numel(AUC_ITI_KirSigBin1_Total)));
VirusAUC_KirSigBin2 = transpose(repelem({'Kir'},numel(AUC_ITI_KirSigBin2_Total)));
VirusAUC_KirSigBin3 = transpose(repelem({'Kir'},numel(AUC_ITI_KirSigBin3_Total)));

varNames = {'Subject', 'Virus', 'Bin', 'AUC'};
TotalAUCtable_mRubySigBin1_ITI = table(SubjAUC_ITI_mRubySigBin1, VirusAUC_mRubySigBin1, BinAUC_mRubySigBin1, AUC_ITI_mRubySigBin1_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin2_ITI = table(SubjAUC_ITI_mRubySigBin2, VirusAUC_mRubySigBin2, BinAUC_mRubySigBin2, AUC_ITI_mRubySigBin2_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin3_ITI = table(SubjAUC_ITI_mRubySigBin3, VirusAUC_mRubySigBin3, BinAUC_mRubySigBin3, AUC_ITI_mRubySigBin3_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin1_INITIATION = table(SubjAUC_INITIATION_mRubySigBin1, VirusAUC_mRubySigBin1, BinAUC_mRubySigBin1, AUC_INITIATION_mRubySigBin1_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin2_INITIATION = table(SubjAUC_INITIATION_mRubySigBin2, VirusAUC_mRubySigBin2, BinAUC_mRubySigBin2, AUC_INITIATION_mRubySigBin2_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin3_INITIATION = table(SubjAUC_INITIATION_mRubySigBin3, VirusAUC_mRubySigBin3, BinAUC_mRubySigBin3, AUC_INITIATION_mRubySigBin3_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin1_CORRECTPRESS = table(SubjAUC_CORRECTPRESS_mRubySigBin1, VirusAUC_mRubySigBin1, BinAUC_mRubySigBin1, AUC_CORRECTPRESS_mRubySigBin1_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin2_CORRECTPRESS = table(SubjAUC_CORRECTPRESS_mRubySigBin2, VirusAUC_mRubySigBin2, BinAUC_mRubySigBin2, AUC_CORRECTPRESS_mRubySigBin2_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin3_CORRECTPRESS = table(SubjAUC_CORRECTPRESS_mRubySigBin3, VirusAUC_mRubySigBin3, BinAUC_mRubySigBin3, AUC_CORRECTPRESS_mRubySigBin3_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin1_REWARD = table(SubjAUC_REWARD_mRubySigBin1, VirusAUC_mRubySigBin1, BinAUC_mRubySigBin1, AUC_REWARD_mRubySigBin1_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin2_REWARD = table(SubjAUC_REWARD_mRubySigBin2, VirusAUC_mRubySigBin2, BinAUC_mRubySigBin2, AUC_REWARD_mRubySigBin2_Total, 'VariableNames',varNames);
TotalAUCtable_mRubySigBin3_REWARD = table(SubjAUC_REWARD_mRubySigBin3, VirusAUC_mRubySigBin3, BinAUC_mRubySigBin3, AUC_REWARD_mRubySigBin3_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin1_ITI = table(SubjAUC_ITI_KirSigBin1, VirusAUC_KirSigBin1, BinAUC_KirSigBin1, AUC_ITI_KirSigBin1_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin2_ITI = table(SubjAUC_ITI_KirSigBin2, VirusAUC_KirSigBin2, BinAUC_KirSigBin2, AUC_ITI_KirSigBin2_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin3_ITI = table(SubjAUC_ITI_KirSigBin3, VirusAUC_KirSigBin3, BinAUC_KirSigBin3, AUC_ITI_KirSigBin3_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin1_INITIATION = table(SubjAUC_INITIATION_KirSigBin1, VirusAUC_KirSigBin1, BinAUC_KirSigBin1, AUC_INITIATION_KirSigBin1_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin2_INITIATION = table(SubjAUC_INITIATION_KirSigBin2, VirusAUC_KirSigBin2, BinAUC_KirSigBin2, AUC_INITIATION_KirSigBin2_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin3_INITIATION = table(SubjAUC_INITIATION_KirSigBin3, VirusAUC_KirSigBin3, BinAUC_KirSigBin3, AUC_INITIATION_KirSigBin3_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin1_CORRECTPRESS = table(SubjAUC_CORRECTPRESS_KirSigBin1, VirusAUC_KirSigBin1, BinAUC_KirSigBin1, AUC_CORRECTPRESS_KirSigBin1_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin2_CORRECTPRESS = table(SubjAUC_CORRECTPRESS_KirSigBin2, VirusAUC_KirSigBin2, BinAUC_KirSigBin2, AUC_CORRECTPRESS_KirSigBin2_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin3_CORRECTPRESS = table(SubjAUC_CORRECTPRESS_KirSigBin3, VirusAUC_KirSigBin3, BinAUC_KirSigBin3, AUC_CORRECTPRESS_KirSigBin3_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin1_REWARD = table(SubjAUC_REWARD_KirSigBin1, VirusAUC_KirSigBin1, BinAUC_KirSigBin1, AUC_REWARD_KirSigBin1_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin2_REWARD = table(SubjAUC_REWARD_KirSigBin2, VirusAUC_KirSigBin2, BinAUC_KirSigBin2, AUC_REWARD_KirSigBin2_Total, 'VariableNames',varNames);
TotalAUCtable_KirSigBin3_REWARD = table(SubjAUC_REWARD_KirSigBin3, VirusAUC_KirSigBin3, BinAUC_KirSigBin3, AUC_REWARD_KirSigBin3_Total, 'VariableNames',varNames);

AUCTable_ITI_Total = [TotalAUCtable_mRubySigBin1_ITI; TotalAUCtable_mRubySigBin2_ITI; TotalAUCtable_mRubySigBin3_ITI; TotalAUCtable_KirSigBin1_ITI; TotalAUCtable_KirSigBin2_ITI; TotalAUCtable_KirSigBin3_ITI];
AUCTable_INITIATION_Total = [TotalAUCtable_mRubySigBin1_INITIATION; TotalAUCtable_mRubySigBin2_INITIATION; TotalAUCtable_mRubySigBin3_INITIATION; TotalAUCtable_KirSigBin1_INITIATION; TotalAUCtable_KirSigBin2_INITIATION; TotalAUCtable_KirSigBin3_INITIATION];
AUCTable_CORRECTPRESS_Total = [TotalAUCtable_mRubySigBin1_CORRECTPRESS; TotalAUCtable_mRubySigBin2_CORRECTPRESS; TotalAUCtable_mRubySigBin3_CORRECTPRESS; TotalAUCtable_KirSigBin1_CORRECTPRESS; TotalAUCtable_KirSigBin2_CORRECTPRESS; TotalAUCtable_KirSigBin3_CORRECTPRESS];
AUCTable_REWARD_Total = [TotalAUCtable_mRubySigBin1_REWARD; TotalAUCtable_mRubySigBin2_REWARD; TotalAUCtable_mRubySigBin3_REWARD; TotalAUCtable_KirSigBin1_REWARD; TotalAUCtable_KirSigBin2_REWARD; TotalAUCtable_KirSigBin3_REWARD];

AUCTable_CORRECTPRESS_Pre = vertcat(AUC_CORRECTPRESS_mRubySigBin1_Pre, AUC_CORRECTPRESS_mRubySigBin2_Pre, AUC_CORRECTPRESS_mRubySigBin3_Pre, AUC_CORRECTPRESS_KirSigBin1_Pre, AUC_CORRECTPRESS_KirSigBin2_Pre, AUC_CORRECTPRESS_KirSigBin3_Pre);
AUCTable_CORRECTPRESS_Pre = horzcat(AUCTable_CORRECTPRESS_Total(:,1:3),table(AUCTable_CORRECTPRESS_Pre));
AUCTable_CORRECTPRESS_Post = vertcat(AUC_CORRECTPRESS_mRubySigBin1_Post, AUC_CORRECTPRESS_mRubySigBin2_Post, AUC_CORRECTPRESS_mRubySigBin3_Post, AUC_CORRECTPRESS_KirSigBin1_Post, AUC_CORRECTPRESS_KirSigBin2_Post, AUC_CORRECTPRESS_KirSigBin3_Post);
AUCTable_CORRECTPRESS_Post = horzcat(AUCTable_CORRECTPRESS_Total(:,1:3),table(AUCTable_CORRECTPRESS_Post));


%okay, now ve vant to see what the big signals are, and where they are! 
[mRubyPSTHPeakArray_InitiationBin1,mRubyPSTHPeakArrayLocs_InitiationBin1] = PSTHPeaks(mRubySigBin1_INITIATION, WindowSize, samplingRate);
[mRubyPSTHPeakArray_InitiationBin2,mRubyPSTHPeakArrayLocs_InitiationBin2] = PSTHPeaks(mRubySigBin2_INITIATION, WindowSize, samplingRate);
[mRubyPSTHPeakArray_InitiationBin3,mRubyPSTHPeakArrayLocs_InitiationBin3] = PSTHPeaks(mRubySigBin3_INITIATION, WindowSize, samplingRate);
[mRubyPSTHPeakArray_ITIBin1,mRubyPSTHPeakArrayLocs_ITIBin1] = PSTHPeaks(mRubySigBin1_ITI, WindowSize, samplingRate);
[mRubyPSTHPeakArray_ITIBin2,mRubyPSTHPeakArrayLocs_ITIBin2] = PSTHPeaks(mRubySigBin2_ITI, WindowSize, samplingRate);
[mRubyPSTHPeakArray_ITIBin3,mRubyPSTHPeakArrayLocs_ITIBin3] = PSTHPeaks(mRubySigBin3_ITI, WindowSize, samplingRate);
[mRubyPSTHPeakArray_CorrectBin1,mRubyPSTHPeakArrayLocs_CorrectBin1] = PSTHPeaks(mRubySigBin1_CORRECTPRESS, WindowSize, samplingRate);
[mRubyPSTHPeakArray_CorrectBin2,mRubyPSTHPeakArrayLocs_CorrectBin2] = PSTHPeaks(mRubySigBin2_CORRECTPRESS, WindowSize, samplingRate);
[mRubyPSTHPeakArray_CorrectBin3,mRubyPSTHPeakArrayLocs_CorrectBin3] = PSTHPeaks(mRubySigBin3_CORRECTPRESS, WindowSize, samplingRate);
[mRubyPSTHPeakArray_RewardBin1,mRubyPSTHPeakArrayLocs_RewardBin1] = PSTHPeaks(mRubySigBin1_REWARD, WindowSize, samplingRate);
[mRubyPSTHPeakArray_RewardBin2,mRubyPSTHPeakArrayLocs_RewardBin2] = PSTHPeaks(mRubySigBin2_REWARD, WindowSize, samplingRate);
[mRubyPSTHPeakArray_RewardBin3,mRubyPSTHPeakArrayLocs_RewardBin3] = PSTHPeaks(mRubySigBin3_REWARD, WindowSize, samplingRate);

[KirPSTHPeakArray_InitiationBin1,KirPSTHPeakArrayLocs_InitiationBin1] = PSTHPeaks(KirSigBin1_INITIATION, WindowSize, samplingRate);
[KirPSTHPeakArray_InitiationBin2,KirPSTHPeakArrayLocs_InitiationBin2] = PSTHPeaks(KirSigBin2_INITIATION, WindowSize, samplingRate);
[KirPSTHPeakArray_InitiationBin3,KirPSTHPeakArrayLocs_InitiationBin3] = PSTHPeaks(KirSigBin3_INITIATION, WindowSize, samplingRate);
[KirPSTHPeakArray_ITIBin1,KirPSTHPeakArrayLocs_ITIBin1] = PSTHPeaks(KirSigBin1_ITI, WindowSize, samplingRate);
[KirPSTHPeakArray_ITIBin2,KirPSTHPeakArrayLocs_ITIBin2] = PSTHPeaks(KirSigBin2_ITI, WindowSize, samplingRate);
[KirPSTHPeakArray_ITIBin3,KirPSTHPeakArrayLocs_ITIBin3] = PSTHPeaks(KirSigBin3_ITI, WindowSize, samplingRate);
[KirPSTHPeakArray_CorrectBin1,KirPSTHPeakArrayLocs_CorrectBin1] = PSTHPeaks(KirSigBin1_CORRECTPRESS, WindowSize, samplingRate);
[KirPSTHPeakArray_CorrectBin2,KirPSTHPeakArrayLocs_CorrectBin2] = PSTHPeaks(KirSigBin2_CORRECTPRESS, WindowSize, samplingRate);
[KirPSTHPeakArray_CorrectBin3,KirPSTHPeakArrayLocs_CorrectBin3] = PSTHPeaks(KirSigBin3_CORRECTPRESS, WindowSize, samplingRate);
[KirPSTHPeakArray_RewardBin1,KirPSTHPeakArrayLocs_RewardBin1] = PSTHPeaks(KirSigBin1_REWARD, WindowSize, samplingRate);
[KirPSTHPeakArray_RewardBin2,KirPSTHPeakArrayLocs_RewardBin2] = PSTHPeaks(KirSigBin2_REWARD, WindowSize, samplingRate);
[KirPSTHPeakArray_RewardBin3,KirPSTHPeakArrayLocs_RewardBin3] = PSTHPeaks(KirSigBin3_REWARD, WindowSize, samplingRate);

%For Initiation and ITI, we want the min total signal. For Correct Press
%and Reward retrieval, we want the max total signal. 

PSTHPeakArray_Initiation = vertcat(mRubyPSTHPeakArray_InitiationBin1, mRubyPSTHPeakArray_InitiationBin2, mRubyPSTHPeakArray_InitiationBin3, KirPSTHPeakArray_InitiationBin1, KirPSTHPeakArray_InitiationBin2, KirPSTHPeakArray_InitiationBin3);
PeakMinTotal_Initiation=horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArray_Initiation(:,7)));
PSTHPeakArray_Correct = vertcat(mRubyPSTHPeakArray_CorrectBin1, mRubyPSTHPeakArray_CorrectBin2, mRubyPSTHPeakArray_CorrectBin3, KirPSTHPeakArray_CorrectBin1, KirPSTHPeakArray_CorrectBin2, KirPSTHPeakArray_CorrectBin3);
PeakMaxTotal_Correct=horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArray_Correct(:,8)));
PeakMaxPre_Correct = horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArray_Correct(:,2)));
PeakMaxPost_Correct = horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArray_Correct(:,5)));
PSTHPeakArray_Reward = vertcat(mRubyPSTHPeakArray_RewardBin1, mRubyPSTHPeakArray_RewardBin2, mRubyPSTHPeakArray_RewardBin3, KirPSTHPeakArray_RewardBin1, KirPSTHPeakArray_RewardBin2, KirPSTHPeakArray_RewardBin3);
PeakMaxTotal_Reward=horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArray_Reward(:,8)));
PSTHPeakArray_ITI = vertcat(mRubyPSTHPeakArray_ITIBin1, mRubyPSTHPeakArray_ITIBin2, mRubyPSTHPeakArray_ITIBin3, KirPSTHPeakArray_ITIBin1, KirPSTHPeakArray_ITIBin2, KirPSTHPeakArray_ITIBin3);
PeakMinTotal_ITI=horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArray_ITI(:,7)));

PSTHPeakArrayLocs_Initiation = vertcat(mRubyPSTHPeakArrayLocs_InitiationBin1, mRubyPSTHPeakArrayLocs_InitiationBin2, mRubyPSTHPeakArrayLocs_InitiationBin3, KirPSTHPeakArrayLocs_InitiationBin1, KirPSTHPeakArrayLocs_InitiationBin2, KirPSTHPeakArrayLocs_InitiationBin3);
PeakMinTotalLocs_Initiation=horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArrayLocs_Initiation(:,7)));
PSTHPeakArrayLocs_Correct = vertcat(mRubyPSTHPeakArrayLocs_CorrectBin1, mRubyPSTHPeakArrayLocs_CorrectBin2, mRubyPSTHPeakArrayLocs_CorrectBin3, KirPSTHPeakArrayLocs_CorrectBin1, KirPSTHPeakArrayLocs_CorrectBin2, KirPSTHPeakArrayLocs_CorrectBin3);
PeakMaxTotalLocs_Correct=horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArrayLocs_Correct(:,8)));
PSTHPeakArrayLocs_Reward = vertcat(mRubyPSTHPeakArrayLocs_RewardBin1, mRubyPSTHPeakArrayLocs_RewardBin2, mRubyPSTHPeakArrayLocs_RewardBin3, KirPSTHPeakArrayLocs_RewardBin1, KirPSTHPeakArrayLocs_RewardBin2, KirPSTHPeakArrayLocs_RewardBin3);
PeakMaxTotalLocs_Reward=horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArrayLocs_Reward(:,8)));
PSTHPeakArrayLocs_ITI = vertcat(mRubyPSTHPeakArrayLocs_ITIBin1, mRubyPSTHPeakArrayLocs_ITIBin2, mRubyPSTHPeakArrayLocs_ITIBin3, KirPSTHPeakArrayLocs_ITIBin1, KirPSTHPeakArrayLocs_ITIBin2, KirPSTHPeakArrayLocs_ITIBin3);
PeakMinTotalLocs_ITI=horzcat(AUCTable_INITIATION_Total(:,1:3),table(PSTHPeakArrayLocs_ITI(:,7)));




%%Let's Plot!
nSecPrev = 5; %change to make different window 
nSecPost = 5; 
samplingRate = 40; %change if this changes
ymin = -1;
ymax = 2;
% convert seconds to TDT timestamps
nTsPrev = round (nSecPrev * samplingRate);
nTsPost = round (nSecPost * samplingRate);
totalTs = nTsPrev + nTsPost;
increment = (nSecPrev + nSecPost) / totalTs;
timeAxis = (-1 * nSecPrev) : increment : nSecPost;

%%%%%%ITIs in bins split by sigmoidal fit
%mRuby
f(1) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')

h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin1_ITI, fliplr(NegErr_mRubySigBin1_ITI)], [1,.7,.7], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_mRubySigBin1_ITI,'Color',[1,.7,.7], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin2_ITI, fliplr(NegErr_mRubySigBin2_ITI)], [.8,.37,.37], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_mRubySigBin2_ITI,'Color',[.8,.37,.37], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin3_ITI, fliplr(NegErr_mRubySigBin3_ITI)], [.6,.01,.01], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_mRubySigBin3_ITI,'Color',[.6,.01,.01], 'Linewidth', 3);



set(gcf, 'Position', [25,25,400,800]);
title('mRuby ITI');
xlabel('Time (s)', 'FontSize', 30);
ylabel('Z-Score', 'FontSize', 30);
legend ([h1 h2 h3], 'Pre-Learning', 'Actively Learning', 'Contingency Learned','orientation', 'vertical', 'Location', 'Southoutside');
legend BOXOFF;
xlim ([-2.5, 2.5])
ylim ([ymin, ymax]);
yticks(ylim:1:ymax);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 30, ...
  'LineWidth'   , 2    );
set(gca, 'layer', 'top');

%Kir
f(2) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')

h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin1_ITI, fliplr(NegErr_KirSigBin1_ITI)], [0.7,0.8,1], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_KirSigBin1_ITI,'Color',[0.7,0.8,1], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin2_ITI, fliplr(NegErr_KirSigBin2_ITI)], [0.37,0.42,0.8], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_KirSigBin2_ITI,'Color',[0.37,0.42,0.8], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin3_ITI, fliplr(NegErr_KirSigBin3_ITI)], [0.01,0.01,0.6], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_KirSigBin3_ITI,'Color',[0.01,0.01,0.6], 'Linewidth', 3);


set(gcf, 'Position', [25,25,400,800]);
title('Kir ITI');
xlabel('Time (s)', 'FontSize', 30);
ylabel('Z-Score', 'FontSize', 30);
legend ([h1 h2 h3], 'Pre-Learning', 'Actively Learning', 'Contingency Learned','orientation', 'vertical', 'Location', 'Southoutside');
legend BOXOFF;
xlim ([-2.5, 2.5])
ylim ([ymin, ymax]);
yticks(ylim:1:ymax);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 30, ...
  'LineWidth'   , 2    );
set(gca, 'layer', 'top');


%%%%%%Initiations in bins split by sigmoidal fit
%mRuby
f(3) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')

h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin1_INITIATION, fliplr(NegErr_mRubySigBin1_INITIATION)], [1,.7,.7], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_mRubySigBin1_INITIATION,'Color',[1,.7,.7], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin2_INITIATION, fliplr(NegErr_mRubySigBin2_INITIATION)], [.8,.37,.37], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_mRubySigBin2_INITIATION,'Color',[.8,.37,.37], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin3_INITIATION, fliplr(NegErr_mRubySigBin3_INITIATION)], [.6,.01,.01], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_mRubySigBin3_INITIATION,'Color',[.6,.01,.01], 'Linewidth', 3);

set(gcf, 'Position', [25,25,400,800]);
title('mRuby Initiations');
xlabel('Time (s)', 'FontSize', 30);
ylabel('Z-Score', 'FontSize', 30);
legend ([h1 h2 h3], 'Pre-Learning', 'Actively Learning', 'Contingency Learned','orientation', 'vertical', 'Location', 'Southoutside');
legend BOXOFF;
xlim ([-2.5, 2.5])
ylim ([ymin, ymax]);
yticks(ylim:1:ymax);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 30, ...
  'LineWidth'   , 2    );
set(gca, 'layer', 'top');

%Kir
f(4) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin1_INITIATION, fliplr(NegErr_KirSigBin1_INITIATION)], [0.7,0.8,1], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_KirSigBin1_INITIATION,'Color',[0.7,0.8,1], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin2_INITIATION, fliplr(NegErr_KirSigBin2_INITIATION)], [0.37,0.42,0.8], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_KirSigBin2_INITIATION,'Color',[0.37,0.42,0.8], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin3_INITIATION, fliplr(NegErr_KirSigBin3_INITIATION)], [0.01,0.01,0.6], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_KirSigBin3_INITIATION,'Color',[0.01,0.01,0.6], 'Linewidth', 3);


set(gcf, 'Position', [25,25,400,800]);
title('Kir Initiations');
xlabel('Time (s)', 'FontSize', 30);
ylabel('Z-Score', 'FontSize', 30);
legend ([h1 h2 h3], 'Pre-Learning', 'Actively Learning', 'Contingency Learned','orientation', 'vertical', 'Location', 'Southoutside');
legend BOXOFF;
xlim ([-2.5, 2.5])
ylim ([ymin, ymax]);
yticks(ylim:1:ymax);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 30, ...
  'LineWidth'   , 2    );
set(gca, 'layer', 'top');


%%%%%%Correct Presses in bins split by sigmoidal fit
%mRuby
f(5) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin1_CORRECTPRESS, fliplr(NegErr_mRubySigBin1_CORRECTPRESS)], [1,.7,.7], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_mRubySigBin1_CORRECTPRESS,'Color',[1,.7,.7], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin2_CORRECTPRESS, fliplr(NegErr_mRubySigBin2_CORRECTPRESS)], [.8,.37,.37], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_mRubySigBin2_CORRECTPRESS,'Color',[.8,.37,.37], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin3_CORRECTPRESS, fliplr(NegErr_mRubySigBin3_CORRECTPRESS)], [.6,.01,.01], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_mRubySigBin3_CORRECTPRESS,'Color',[.6,.01,.01], 'Linewidth', 3);

set(gcf, 'Position', [25,25,400,800]);
title('mRuby Correct Presses');
xlabel('Time (s)', 'FontSize', 30);
ylabel('Z-Score', 'FontSize', 30);
legend ([h1 h2 h3], 'Pre-Learning', 'Actively Learning', 'Contingency Learned','orientation', 'vertical', 'Location', 'Southoutside');
legend BOXOFF;
xlim ([-2.5, 2.5])
ylim ([ymin, ymax]);
yticks(ylim:1:ymax);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 30, ...
  'LineWidth'   , 2    );
set(gca, 'layer', 'top');

%Kir
f(6) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin1_CORRECTPRESS, fliplr(NegErr_KirSigBin1_CORRECTPRESS)], [0.7,0.8,1], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_KirSigBin1_CORRECTPRESS,'Color',[0.7,0.8,1], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin2_CORRECTPRESS, fliplr(NegErr_KirSigBin2_CORRECTPRESS)], [0.37,0.42,0.8], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_KirSigBin2_CORRECTPRESS,'Color',[0.37,0.42,0.8], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin3_CORRECTPRESS, fliplr(NegErr_KirSigBin3_CORRECTPRESS)], [0.01,0.01,0.6], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_KirSigBin3_CORRECTPRESS,'Color',[0.01,0.01,0.6], 'Linewidth', 3);


set(gcf, 'Position', [25,25,400,800]);
title('Kir Correct Presses');
xlabel('Time (s)', 'FontSize', 30);
ylabel('Z-Score', 'FontSize', 30);
legend ([h1 h2 h3], 'Pre-Learning', 'Actively Learning', 'Contingency Learned','orientation', 'vertical', 'Location', 'Southoutside');
legend BOXOFF;
xlim ([-2.5, 2.5])
ylim ([ymin, ymax]);
yticks(ylim:1:ymax);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 30, ...
  'LineWidth'   , 2    );
set(gca, 'layer', 'top');


%%%%%%Reward Retrievals in bins split by sigmoidal fit
%mRuby
f(7) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin1_REWARD, fliplr(NegErr_mRubySigBin1_REWARD)], [1,.7,.7], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_mRubySigBin1_REWARD,'Color',[1,.7,.7], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin2_REWARD, fliplr(NegErr_mRubySigBin2_REWARD)], [.8,.37,.37], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_mRubySigBin2_REWARD,'Color',[.8,.37,.37], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin3_REWARD, fliplr(NegErr_mRubySigBin3_REWARD)], [.6,.01,.01], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_mRubySigBin3_REWARD,'Color',[.6,.01,.01], 'Linewidth', 3);

set(gcf, 'Position', [25,25,400,800]);
title('mRuby Reward Retrievals');
xlabel('Time (s)', 'FontSize', 30);
ylabel('Z-Score', 'FontSize', 30);
legend ([h1 h2 h3], 'Pre-Learning', 'Actively Learning', 'Contingency Learned','orientation', 'vertical', 'Location', 'Southoutside');
legend BOXOFF;
xlim ([-2.5, 2.5])
ylim ([ymin, ymax]);
yticks(ylim:1:ymax);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 30, ...
  'LineWidth'   , 2    );
set(gca, 'layer', 'top');

%Kir
f(8) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin1_REWARD, fliplr(NegErr_KirSigBin1_REWARD)], [0.7,0.8,1], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_KirSigBin1_REWARD,'Color',[0.7,0.8,1], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin2_REWARD, fliplr(NegErr_KirSigBin2_REWARD)], [0.37,0.42,0.8], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_KirSigBin2_REWARD,'Color',[0.37,0.42,0.8], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirSigBin3_REWARD, fliplr(NegErr_KirSigBin3_REWARD)], [0.01,0.01,0.6], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_KirSigBin3_REWARD,'Color',[0.01,0.01,0.6], 'Linewidth', 3);

set(gcf, 'Position', [25,25,400,800]);
title('Kir Reward Retrievals');
xlabel('Time (s)', 'FontSize', 30);
ylabel('Z-Score', 'FontSize', 30);
legend ([h1 h2 h3], 'Pre-Learning', 'Actively Learning', 'Contingency Learned','orientation', 'vertical', 'Location', 'Southoutside');
legend BOXOFF;
xlim ([-2.5, 2.5])
ylim ([ymin, ymax]);
yticks(ylim:1:ymax);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 30, ...
  'LineWidth'   , 2    );
set(gca, 'layer', 'top');

% 
% %%%%%%Avg PSTHs for each mouse
% figure;plot(timeAxis,Psth_mRubySigBin1_CORRECTPRESS,'DisplayName','Psth_mRubySigBin1_CORRECTPRESS');title('mRuby Bin 1 Correct');
% figure;plot(timeAxis,Psth_mRubySigBin2_CORRECTPRESS,'DisplayName','Psth_mRubySigBin2_CORRECTPRESS');title('mRuby Bin 2 Correct');
% figure;plot(timeAxis,Psth_mRubySigBin3_CORRECTPRESS,'DisplayName','Psth_mRubySigBin3_CORRECTPRESS');title('mRuby Bin 3 Correct');
% figure;plot(timeAxis,Psth_KirSigBin1_CORRECTPRESS,'DisplayName','Psth_KirSigBin1_CORRECTPRESS');title('Kir Bin 1 Correct');
% figure;plot(timeAxis,Psth_KirSigBin2_CORRECTPRESS,'DisplayName','Psth_KirSigBin2_CORRECTPRESS');title('Kir Bin 2 Correct');
% figure;plot(timeAxis,Psth_KirSigBin3_CORRECTPRESS,'DisplayName','Psth_KirSigBin3_CORRECTPRESS');title('Kir Bin 3 Correct');
% figure;plot(timeAxis,Psth_mRubySigBin1_REWARD,'DisplayName','Psth_mRubySigBin1_REWARD');title('mRuby Bin 1 Reward');
% figure;plot(timeAxis,Psth_mRubySigBin2_REWARD,'DisplayName','Psth_mRubySigBin2_REWARD');title('mRuby Bin 2 Reward');
% figure;plot(timeAxis,Psth_mRubySigBin3_REWARD,'DisplayName','Psth_mRubySigBin3_REWARD');title('mRuby Bin 3 Reward');
% figure;plot(timeAxis,Psth_KirSigBin1_REWARD,'DisplayName','Psth_KirSigBin1_REWARD');title('Kir Bin 1 Reward');
% figure;plot(timeAxis,Psth_KirSigBin2_REWARD,'DisplayName','Psth_KirSigBin2_REWARD');title('Kir Bin 2 Reward');
% figure;plot(timeAxis,Psth_KirSigBin3_REWARD,'DisplayName','Psth_KirSigBin3_REWARD');title('Kir Bin 3 Reward');

PSTH_first5Initiation = nanmean(mRuby_First5Init);
PSTH_Second5Initiation = nanmean(mRuby_Second5Init);
Err_first= (nanstd(mRuby_First5Init))/sqrt(size(mRuby_First5Init,1));
Poserr_first = PSTH_first5Initiation + Err_first;
Negerr_first = PSTH_first5Initiation - Err_first;

Err_Second= (nanstd(mRuby_Second5Init))/sqrt(size(mRuby_Second5Init,1));
Poserr_Second = PSTH_Second5Initiation + Err_Second;
Negerr_Second = PSTH_Second5Initiation - Err_Second;



f(9) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')

h1f=fill([timeAxis, fliplr(timeAxis)],[Poserr_first, fliplr(Negerr_first)], [1,.7,.7], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_first5Initiation,'Color',[1,.7,.7], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[Poserr_Second, fliplr(Negerr_Second)], [.8,.37,.37], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_Second5Initiation,'Color',[.8,.37,.37], 'Linewidth', 3);

% h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubySigBin3_INITIATION, fliplr(NegErr_mRubySigBin3_INITIATION)], [.6,.01,.01], 'EdgeColor', 'none');
% set(h3f,'facealpha',.5);
% h3= plot (timeAxis,PSTH_mRubySigBin3_INITIATION,'Color',[.6,.01,.01], 'Linewidth', 3);

set(gcf, 'Position', [25,25,400,800]);
title('mRuby Initiations');
xlabel('Time (s)', 'FontSize', 30);
ylabel('Z-Score', 'FontSize', 30);
legend ([h1 h2 h3], 'Pre-Learning', 'Actively Learning', 'Contingency Learned','orientation', 'vertical', 'Location', 'Southoutside');
legend BOXOFF;
xlim ([-2.5, 2.5])
ylim ([ymin, ymax]);
yticks(ylim:1:ymax);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 30, ...
  'LineWidth'   , 2    );
set(gca, 'layer', 'top');
