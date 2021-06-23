waitfor(msgbox('Please select mRuby files for random PSTHs'));
[mRubyrandomPSTHfiles,mRubyrandomPSTHpathname] = uigetfile('*.mat', ...
   'MultiSelect', 'on'); 
waitfor(msgbox('Please select Kir files for random PSTHs'));
[KirrandomPSTHfiles,KirrandomPSTHpathname] = uigetfile('*.mat', ...
   'MultiSelect', 'on'); 

nSecPrev = 5; %change to make different window 
nSecPost = 5; 
samplingRate = 40;
% convert seconds to TDT timestamps
nTsPrev = round (nSecPrev * samplingRate);
nTsPost = round (nSecPost * samplingRate);


tstep = samplingRate *60;
minTS = (tstep:tstep:tstep*5000); minTS=transpose(minTS);

%making PSTHs for every 1min TS for mRuby files, binning by 3rds across a
%session.
mRubyMinPSTHArray_Bin1=NaN(1,nTsPrev+nTsPost+1);
mRubyMinPSTHArray_Bin2=NaN(1,nTsPrev+nTsPost+1);
mRubyMinPSTHArray_Bin3=NaN(1,nTsPrev+nTsPost+1);

    for k=1:(length(mRubyrandomPSTHfiles))
    allnormdat = load(mRubyrandomPSTHfiles{k}, 'allnormdat' );
    allnormdat = allnormdat.('allnormdat');
    numMins = floor( length(allnormdat)/(60*samplingRate));
    MinPSTHArray=NaN(numMins, nTsPrev+nTsPost+1);
    bin1end = load(mRubyrandomPSTHfiles{k},'bin1end');
    bin1end = bin1end.('bin1end');
    bin2end = load(mRubyrandomPSTHfiles{k},'bin2end');
    bin2end = bin2end.('bin2end');
    bin3end = load(mRubyrandomPSTHfiles{k},'bin3end');
    bin3end = bin3end.('bin3end');
    bin1endmin = floor(bin1end/60);
    bin2endmin = floor(bin2end/60);
    bin3endmin = floor(bin3end/60);
for i = 1:numMins
    thisTime = minTS(i);
    thisIndex = round((thisTime))+1;
   MinPSTHArray(i,:) = processPhotDataRow_normDat(allnormdat, thisIndex, nTsPrev, nTsPost);
end

MinPSTHArray_Bin1=MinPSTHArray(1:bin1endmin,:);
MinPSTHArray_Bin2=MinPSTHArray((bin1endmin+1):bin2endmin,:);
MinPSTHArray_Bin3=MinPSTHArray((bin2endmin+1):bin3endmin,:);
    
mRubyMinPSTHArray_Bin1=vertcat(mRubyMinPSTHArray_Bin1,MinPSTHArray_Bin1);
mRubyMinPSTHArray_Bin2=vertcat(mRubyMinPSTHArray_Bin2,MinPSTHArray_Bin2);
mRubyMinPSTHArray_Bin3=vertcat(mRubyMinPSTHArray_Bin3,MinPSTHArray_Bin3);
    end

%and now for Kir files
KirMinPSTHArray_Bin1=NaN(1,nTsPrev+nTsPost+1);
KirMinPSTHArray_Bin2=NaN(1,nTsPrev+nTsPost+1);
KirMinPSTHArray_Bin3=NaN(1,nTsPrev+nTsPost+1);

    for k=1:(length(KirrandomPSTHfiles))
    allnormdat = load(KirrandomPSTHfiles{k}, 'allnormdat' );
    allnormdat = allnormdat.('allnormdat');
    MinPSTHArray=NaN(numMins, nTsPrev+nTsPost+1);
    bin1end = load(KirrandomPSTHfiles{k},'bin1end');
    bin1end = bin1end.('bin1end');
    bin2end = load(KirrandomPSTHfiles{k},'bin2end');
    bin2end = bin2end.('bin2end');
    bin3end = load(KirrandomPSTHfiles{k},'bin3end');
    bin3end = bin3end.('bin3end');
    bin1endmin = floor(bin1end/60);
    bin2endmin = floor(bin2end/60);
    bin3endmin = floor(bin3end/60);
    numMins = floor(length(allnormdat)/(60*samplingRate));

for i = 1:numMins
    thisTime = minTS(i);
    thisIndex = round((thisTime))+1;
   MinPSTHArray(i,:) = processPhotDataRow_normDat(allnormdat, thisIndex, nTsPrev, nTsPost);
end

MinPSTHArray_Bin1=MinPSTHArray(1:bin1endmin,:);
MinPSTHArray_Bin2=MinPSTHArray((bin1endmin+1):bin2endmin,:);
MinPSTHArray_Bin3=MinPSTHArray((bin2endmin+1):bin3endmin,:);
    
KirMinPSTHArray_Bin1=vertcat(KirMinPSTHArray_Bin1,MinPSTHArray_Bin1);
KirMinPSTHArray_Bin2=vertcat(KirMinPSTHArray_Bin2,MinPSTHArray_Bin2);
KirMinPSTHArray_Bin3=vertcat(KirMinPSTHArray_Bin3,MinPSTHArray_Bin3);
    end

%Generate PSTHs and errors
PSTH_mRubyMinBin1 = nanmean(mRubyMinPSTHArray_Bin1);
err_mRubyMinBin1 = (nanstd(mRubyMinPSTHArray_Bin1))/sqrt(size(mRubyMinPSTHArray_Bin1,1));
PosErr_mRubyMinBin1 = PSTH_mRubyMinBin1 + err_mRubyMinBin1;
NegErr_mRubyMinBin1 = PSTH_mRubyMinBin1 - err_mRubyMinBin1;
PSTH_mRubyMinBin2 = nanmean(mRubyMinPSTHArray_Bin2);
err_mRubyMinBin2 = (nanstd(mRubyMinPSTHArray_Bin2))/sqrt(size(mRubyMinPSTHArray_Bin2,1));
PosErr_mRubyMinBin2 = PSTH_mRubyMinBin2 + err_mRubyMinBin2;
NegErr_mRubyMinBin2 = PSTH_mRubyMinBin2 - err_mRubyMinBin2;
PSTH_mRubyMinBin3 = nanmean(mRubyMinPSTHArray_Bin3);
err_mRubyMinBin3 = (nanstd(mRubyMinPSTHArray_Bin3))/sqrt(size(mRubyMinPSTHArray_Bin3,1));
PosErr_mRubyMinBin3 = PSTH_mRubyMinBin3 + err_mRubyMinBin3;
NegErr_mRubyMinBin3 = PSTH_mRubyMinBin3 - err_mRubyMinBin3;

PSTH_KirMinBin1 = nanmean(KirMinPSTHArray_Bin1);
err_KirMinBin1 = (nanstd(KirMinPSTHArray_Bin1))/sqrt(size(KirMinPSTHArray_Bin1,1));
PosErr_KirMinBin1 = PSTH_KirMinBin1 + err_KirMinBin1;
NegErr_KirMinBin1 = PSTH_KirMinBin1 - err_KirMinBin1;
PSTH_KirMinBin2 = nanmean(KirMinPSTHArray_Bin2);
err_KirMinBin2 = (nanstd(KirMinPSTHArray_Bin2))/sqrt(size(KirMinPSTHArray_Bin2,1));
PosErr_KirMinBin2 = PSTH_KirMinBin2 + err_KirMinBin2;
NegErr_KirMinBin2 = PSTH_KirMinBin2 - err_KirMinBin2;
PSTH_KirMinBin3 = nanmean(KirMinPSTHArray_Bin3);
err_KirMinBin3 = (nanstd(KirMinPSTHArray_Bin3))/sqrt(size(KirMinPSTHArray_Bin3,1));
PosErr_KirMinBin3 = PSTH_KirMinBin3 + err_KirMinBin3;
NegErr_KirMinBin3 = PSTH_KirMinBin3 - err_KirMinBin3;

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

%mRuby
f(1) = figure('Color',[1 1 1]);
hold on

h4= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')
h5= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 2, 'Color','k')

h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubyMinBin1, fliplr(NegErr_mRubyMinBin1)], [1,.7,.7], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_mRubyMinBin1,'Color',[1,.7,.7], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubyMinBin2, fliplr(NegErr_mRubyMinBin2)], [.8,.37,.37], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_mRubyMinBin2,'Color',[.8,.37,.37], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_mRubyMinBin3, fliplr(NegErr_mRubyMinBin3)], [.6,.01,.01], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_mRubyMinBin3,'Color',[.6,.01,.01], 'Linewidth', 3);



set(gcf, 'Position', [25,25,400,800]);
title('mRuby Every 60s');
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

h1f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirMinBin1, fliplr(NegErr_KirMinBin1)], [0.7,0.8,1], 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,PSTH_KirMinBin1,'Color',[0.7,0.8,1], 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirMinBin2, fliplr(NegErr_KirMinBin2)], [0.37,0.42,0.8], 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,PSTH_KirMinBin2,'Color',[0.37,0.42,0.8], 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[PosErr_KirMinBin3, fliplr(NegErr_KirMinBin3)], [0.01,0.01,0.6], 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,PSTH_KirMinBin3,'Color',[0.01,0.01,0.6], 'Linewidth', 3);


set(gcf, 'Position', [25,25,400,800]);
title('Kir Every 60s');
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