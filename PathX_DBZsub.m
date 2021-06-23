close all;
clear all;

%% Extract photometry data from TDT Data Tank


filepath=uigetdir;

 %change these storenames for different paths or TTLs
storenames = {'470A' '405A' 'Ms1/' 'Ms1\' 'Ms2/' 'Ms2\' };

% extract
for k = 1:numel(storenames)
  storename = storenames{k};
  S{k} = TDT_MATconvertBDH(filepath, storename); 
end



%% Massage data and get time stamps
% Get data as a vector (repeat for each channel)
dat1 = S{1};
dat1.data = reshape(dat1.data', [],1); % unwrap data from m x 256 array
dat1.data = dat1.data(1:end-5000); %removing the last bit in case mouse was removed before recording ended
dat2 = S{2};
dat2.data = reshape(dat2.data', [],1); % unwrap data from m x 256 array
dat2.data = dat2.data(1:end-5000);

% Get timestamps
ts = dat1.timestamps;
t_rec_start = ts(1);
samplingRate = dat1.sampling_rate; % TDT returns 'true' sample rate.

ts = ts-ts(1); % convert from Unix time to 'seconds from block start'
ts = bsxfun(@plus, ts(:), (0:dat1.npoints-1)*(1./dat1.sampling_rate));
ts = reshape(ts',[],1);
ts = ts(1:end-5000);

% Get TTL input timestamps; change these if your TTLs differ
Initiation = S{3}.timestamps - t_rec_start;
midITI = S{4}.timestamps - t_rec_start;
CorrectPress = S{6}.timestamps - t_rec_start;
RewardRetrieval = S{5}.timestamps - t_rec_start;

%% Single fit - if both channels change consistently for the whole session

% Smooth dat1 and dat2, fit dat2 (control) to dat1 (signal)

dat1 = filtfilt(ones(1,100)/100,1, dat1.data);
dat2 = filtfilt(ones(1,100)/100,1, dat2.data);

tsOrig=ts;
[dat1,ts]=resample(dat1,tsOrig,40,10,10);
dat2=resample(dat2,tsOrig,40,10,10);
samplingRate = 40;

debleach_flag=1;
[dfof, mod_dat1, fit_dat1, offset_dat1]=debleachBDH(ts',dat1,debleach_flag);
[dfof_control, mod_dat2, fit_dat2, offset_dat2] =debleachBDH(ts',dat2,debleach_flag);

% f(1) = figure('Color',[1 1 1]);
% zoom on;
% %subplot (2, 1, 1);
% plot(ts/60,dat1);
% hold on
% plot(ts/60,fit_dat1+offset_dat1,'r');
% plot(ts/60,mod_dat1,'g');
% legend('Signal','Exponential Fit','Debleached');
% legend BOXOFF;
% xlabel('Time(s)');
% ylabel('Fluorescence');
% title('Debleaching Results for 470');
% 
% f(2) = figure('Color',[1 1 1]);
% zoom on;
% %subplot (2, 1, 2);
% plot(ts/60,dat2);
% hold on
% plot(ts/60,fit_dat2+offset_dat2,'r');
% plot(ts/60,mod_dat2,'g');
% legend('Signal','Exponential Fit','Debleached');
% legend BOXOFF;
% xlabel('Time(s)');
% ylabel('Fluorescence');
% title('Debleaching Results for 405');

dfofCorr=subtract_refBDH(ts',dfof,dfof_control,'None'); 
dfofCorr_sub=subtract_refBDH(ts',dfof,dfof_control,'Subtract');

[controlFit] = controlFit (dat1, dat2);

%From here on, we have multiple ways to calculate the dfof. The first was 
%from code originally written by Elizabeth Steinberg (normDat). "DB" refers 
%to 'debleached' data, where the overall data is essentially flattened to
%account for overall decrease in signal across long recordings . "Z" means
%the data is Z-scored, without a moving window (so using the overall mean
%and std dev); modZ means a moving window was used for the Z-score; the
%size of the window can be adjusted. Anything with diff is a differenced
%time series, and "sub" means the 405 signal was subtracted from the 470.
%For Holly et al. 2021, DBZ_sub was used for analysis. 


% Get delta F/F using controlFit
[normDat] = deltaFF (dat1, controlFit);

normDat_DB = 100*dfofCorr';
normDat_DBZ = (normDat_DB-mean(normDat_DB))/std(normDat_DB);
% normDat_DBZ_diff = diff(normDat_DBZ);

normDat_DB_sub = 100*dfofCorr_sub';
normDat_DBZ_sub = (normDat_DB_sub-mean(normDat_DB_sub))/std(normDat_DB_sub);
% normDat_DBZ_sub_diff = diff(normDat_DBZ_sub);


%calculate local means and std in 10s windows; this takes a while so if you
%are not using it, I'd leave it commented out. Currently, the moving window
%is 10s, but change 10 to whatever length you want... you should definitely
%be looking at your data output with this and all other means of
%transforming the data to ensure it most closely mirrors the raw dat1 signal.

% moving_mean = zeros(1,length(normDat));
% moving_sd = zeros(1,length(normDat));
% moving_mean(1:10*samplingRate) = mean(normDat(1:10*samplingRate));
% moving_sd(1:10*samplingRate) = std(normDat(1:10*samplingRate));
% moving_mean(end-(10*samplingRate):end) = mean(normDat(end-(10*samplingRate):end));
% moving_sd(end-(10*samplingRate):end) = std(normDat(end-(10*samplingRate):end));
% for i = (10*samplingRate)+1:(length(normDat)-(10*samplingRate))
%     moving_mean(i) = mean(normDat((i-10*samplingRate):(i+10*samplingRate)));
%     moving_sd(i) = std(normDat((i-10*samplingRate):(i+10*samplingRate)));
% end
% 
% %z-score data using local means and standard deviations
% normDat_modZ = zeros(1,length(normDat_DB));
% for i = 1:length(normDat)
%     normDat_modZ(i) = (normDat(i)-moving_mean(i))/moving_sd(i);
% end
% 
% normDat_modZ = normDat_modZ';

%calculate local means and std in 10s windows for debleached data
%with no subtraction
% moving_mean = zeros(1,length(normDat_DB));
% moving_sd = zeros(1,length(normDat_DB));
% moving_mean(1:10*samplingRate) = mean(normDat_DB(1:10*samplingRate));
% moving_sd(1:10*samplingRate) = std(normDat_DB(1:10*samplingRate));
% moving_mean(end-(10*samplingRate):end) = mean(normDat_DB(end-(10*samplingRate):end));
% moving_sd(end-(10*samplingRate):end) = std(normDat_DB(end-(10*samplingRate):end));
% for i = (10*samplingRate)+1:(length(normDat_DB)-(10*samplingRate))
%     moving_mean(i) = mean(normDat_DB((i-10*samplingRate):(i+10*samplingRate)));
%     moving_sd(i) = std(normDat_DB((i-10*samplingRate):(i+10*samplingRate)));
% end
% 
% %z-score data using local means and standard deviations
% normDat_DB_modZ = zeros(1,length(normDat_DB));
% for i = 1:length(normDat_DB)
%     normDat_DB_modZ(i) = (normDat_DB(i)-moving_mean(i))/moving_sd(i);
% end
% 
% normDat_DB_modZ = normDat_DB_modZ';
% % 
% %calculate local means and std in 10s  windows for debleached data with
% %subtraction of 405
% moving_mean = zeros(1,length(normDat_DB_sub));
% moving_sd = zeros(1,length(normDat_DB_sub));
% moving_mean(1:10*samplingRate) = mean(normDat_DB_sub(1:10*samplingRate));
% moving_sd(1:10*samplingRate) = std(normDat_DB_sub(1:10*samplingRate));
% moving_mean(end-(10*samplingRate):end) = mean(normDat_DB_sub(end-(10*samplingRate):end));
% moving_sd(end-(10*samplingRate):end) = std(normDat_DB_sub(end-(10*samplingRate):end));
% for i = (10*samplingRate)+1:(length(normDat_DB_sub)-(10*samplingRate))
%     moving_mean(i) = mean(normDat_DB_sub((i-10*samplingRate):(i+10*samplingRate)));
%     moving_sd(i) = std(normDat_DB_sub((i-10*samplingRate):(i+10*samplingRate)));
% end
% 
% %z-score data using local means and standard deviations
% normDat_DB_sub_modZ = zeros(1,length(normDat_DB_sub));
% for i = 1:length(normDat_DB_sub)
%     normDat_DB_sub_modZ(i) = (normDat_DB_sub(i)-moving_mean(i))/moving_sd(i);
% end
% 
% normDat_DB_sub_modZ = normDat_DB_sub_modZ';

%this bit below will plot everything, thats just so that you can inspect
%it to see what looks good. what you can tell a lot is whether the
%subtracting 405 adds noise, whether you want to, etc. 

%f(3) = figure('Color',[1 1 1]);
%zoom on;
%subplot (2, 1, 1);
%plot(ts(51:end)/60, normDat(51:end));
%xlabel('Time(s)');
%ylabel('\DeltaF/F (%)');
%title('\DeltaF/F - No Transformations');

%f(4) = figure('Color',[1 1 1]);
%zoom on;
%subplot (2, 1, 2);
%plot(ts(51:end)/60, normDat_modZ(51:end));
%xlabel('Time(s)');
%ylabel('\DeltaF/F (z-score)');
%title('\DeltaF/F Z-Score (Local Mean/Standard Deviation); Original Data)');

%f(5) = figure('Color',[1 1 1]);
%zoom on;
%subplot (4, 1, 1);
%plot(ts/60, normDat_DB);
%xlabel('Time(s)');
%ylabel('\DeltaF/F (%)');
%title('\DeltaF/F Debleached');

%f(6) = figure('Color',[1 1 1]);
%zoom on;
%subplot (4, 1, 2);
%plot(ts/60, normDat_DBZ);
%xlabel('Time(s)');
%ylabel('\DeltaF/F (z-score)');
%title('\DeltaF/F Z-Score (Global Standard Deviation); Debleached Data)');
% 
% f(7) = figure('Color',[1 1 1]);
% zoom on;
% %subplot (4, 1, 3);
% plot(ts/60, normDat_DB_modZ);
% xlabel('Time(s)');
% ylabel('\DeltaF/F (z-score)');
% title('\DeltaF/F Z-Score (Local Mean/Standard Deviation); Debleached Data)');

%f(8) = figure('Color',[1 1 1]);
%zoom on;
%subplot (4, 1, 4);
%plot(ts(2:end)/60, normDat_DBZ_diff);
%xlabel('Time(s)');
%ylabel('\DeltaF/F (z-score)');
%title('Differencing of Debleached Z-Score Data)');

%f(9) = figure('Color',[1 1 1]);
%zoom on;
%%subplot (4, 1, 1);
%plot(ts/60, normDat_DB_sub);
%xlabel('Time(s)');
%ylabel('\DeltaF/F (%)');
%title('\DeltaF/F Debleached w/ Subtraction of 405');

%f(10) = figure('Color',[1 1 1]);
%zoom on;
%subplot (4, 1, 2);
%plot(ts/60, normDat_DBZ_sub);
%xlabel('Time(s)');
%ylabel('\DeltaF/F (z-score)');
%title('\DeltaF/F Z-Score (Global Standard Deviation); Debleached Data w/ 405 Subtraction');

%f(11) = figure('Color',[1 1 1]);
%zoom on;
%subplot (4, 1, 3);
%plot(ts/60, normDat_DB_sub_modZ);
%xlabel('Time(s)');
%ylabel('\DeltaF/F (z-score)');
%title('\DeltaF/F Z-Score (Local Mean/Standard Deviation); Debleached Data w/ 405 Subtraction');

%f(12) = figure('Color',[1 1 1]);
%zoom on;
%subplot (4, 1, 4);
%plot(ts(2:end)/60, normDat_DBZ_sub_diff);
%xlabel('Time(s)');
%ylabel('\DeltaF/F (z-score)');
%title('Differencing of Debleached Z-Score Data w/ 405 Subtraction');

% 
% save('SSC312_1024_peak_analysis.mat');
%% Peakfinder, to determine the peaks in the signal; see program for more detail

%change DBZ_sub for whatever analysis method you determine looks best for
%your data. "DBZ_subpeakinfo" is a matrix of all the outputs

[DBZ_subpeakloc,DBZ_subrealpeakMag, DBZ_subrealpeakwidth, DBZ_subrealpeakprom, DBZ_subrealpeakheight, f(5)] = peakfinder_EHedit_10s_withmodeBL(normDat_DBZ_sub, samplingRate, ts);
zoom on;
DBZ_subrealpeakMag=transpose(DBZ_subrealpeakMag); DBZ_subrealpeakprom=transpose(DBZ_subrealpeakprom); DBZ_subrealpeakwidth=transpose(DBZ_subrealpeakwidth); DBZ_subrealpeakheight=transpose(DBZ_subrealpeakheight);
DBZ_subpeakinfo=[DBZ_subpeakloc, DBZ_subrealpeakMag, DBZ_subrealpeakprom, DBZ_subrealpeakwidth, DBZ_subrealpeakheight];

%% make  arrays based on behavior timestamps, then average rows into a mean vector for plotting
nSecPrev = 5; %change to make different window 
nSecPost = 5; 
% convert seconds to TDT timestamps
nTsPrev = round (nSecPrev * samplingRate);
nTsPost = round (nSecPost * samplingRate);
%%%%%%%%%
%% make  arrays for behavior timestamps 

% make PSTH for midITI
nITI = size(midITI,1);
PsthArray_ITI = NaN(nITI,nTsPrev+nTsPost+1); 
for i = 1:nITI
    thisTime = midITI(i);
    thisIndex = round((thisTime*samplingRate))+1;
    PsthArray_ITI(i,:) = processPhotDataRow_normDat(normDat_DBZ_sub, thisIndex, nTsPrev, nTsPost);
end
err_ITI = (nanstd(PsthArray_ITI))/sqrt(size(PsthArray_ITI,1));
Psth_ITI = nanmean(PsthArray_ITI);

% make PSTH for initiation
nINITIATION = size(Initiation,1);
PsthArray_INITIATION = NaN(nINITIATION,nTsPrev+nTsPost+1); 
for i = 1:nINITIATION
    thisTime = Initiation(i);
    thisIndex = round((thisTime*samplingRate))+1;
    PsthArray_INITIATION(i,:) = processPhotDataRow_normDat(normDat_DBZ_sub, thisIndex, nTsPrev, nTsPost);
end
err_INITIATION = (nanstd(PsthArray_INITIATION))/sqrt(size(PsthArray_INITIATION,1));
Psth_INITIATION = nanmean(PsthArray_INITIATION);

% make PSTH for Correct Press
nCORRECTPRESS = size(CorrectPress,1);
PsthArray_CORRECTPRESS = NaN(nCORRECTPRESS,nTsPrev+nTsPost+1); 
for i = 1:nCORRECTPRESS
    thisTime = CorrectPress(i);
    thisIndex = round((thisTime*samplingRate))+1;
    PsthArray_CORRECTPRESS(i,:) = processPhotDataRow_normDat(normDat_DBZ_sub, thisIndex, nTsPrev, nTsPost);
end
err_CORRECTPRESS = (nanstd(PsthArray_CORRECTPRESS))/sqrt(size(PsthArray_CORRECTPRESS,1));
Psth_CORRECTPRESS = nanmean(PsthArray_CORRECTPRESS);     

% make PSTH for RewardRetrieval
nREWARD = size(RewardRetrieval,1);
PsthArray_REWARD = NaN(nREWARD,nTsPrev+nTsPost+1); 
for i = 1:nREWARD
    thisTime = RewardRetrieval(i);
    thisIndex = round((thisTime*samplingRate))+1;
    PsthArray_REWARD(i,:) = processPhotDataRow_normDat(normDat_DBZ_sub, thisIndex, nTsPrev, nTsPost);
end
err_REWARD = (nanstd(PsthArray_REWARD))/sqrt(size(PsthArray_REWARD,1));
Psth_REWARD = nanmean(PsthArray_REWARD);


%%for just the rewarded trials 
for i = 1: nREWARD
    rITI(i)=midITI(find(midITI<RewardRetrieval(i),1,'last'));
    rInitiation(i)=Initiation(find(Initiation<RewardRetrieval(i),1,'last'));
end

PsthArray_rITI = NaN(nREWARD, nTsPrev+nTsPost+1);
for i = 1:nREWARD
    thisTime = rITI(i);
    thisIndex = round((thisTime*samplingRate))+1;
    PsthArray_rITI(i,:) = processPhotDataRow_normDat(normDat_DBZ_sub, thisIndex, nTsPrev, nTsPost);
end

PsthArray_rINITIATION = NaN(nREWARD, nTsPrev+nTsPost+1);
for i = 1:nREWARD
    thisTime = rInitiation(i);
    thisIndex = round((thisTime*samplingRate))+1;
    PsthArray_rINITIATION(i,:) = processPhotDataRow_normDat(normDat_DBZ_sub, thisIndex, nTsPrev, nTsPost);
end  

    
%% let's make a figure! all TTLs on the same graph
ymin = -2;
ymax = 2; 

totalTs = nTsPrev + nTsPost;
increment = (nSecPrev + nSecPost) / totalTs;
timeAxis = (-1 * nSecPrev) : increment : nSecPost;
Err1Pos = Psth_ITI + err_ITI;
Err1Neg = Psth_ITI - err_ITI;
Err2Pos = Psth_INITIATION + err_INITIATION;
Err2Neg = Psth_INITIATION - err_INITIATION;
Err3Pos = Psth_CORRECTPRESS + err_CORRECTPRESS;
Err3Neg = Psth_CORRECTPRESS - err_CORRECTPRESS;
Err4Pos = Psth_REWARD + err_REWARD;
Err4Neg = Psth_REWARD - err_REWARD;
f(13) = figure('Color',[1 1 1]);
hold on

h1f=fill([timeAxis, fliplr(timeAxis)],[Err1Pos, fliplr(Err1Neg)], 'g', 'EdgeColor', 'none');
set(h1f,'facealpha',.5);
h1= plot (timeAxis,Psth_ITI,'Color','g', 'Linewidth', 3);

h2f=fill([timeAxis, fliplr(timeAxis)],[Err2Pos, fliplr(Err2Neg)], 'b', 'EdgeColor', 'none');
set(h2f,'facealpha',.5);
h2= plot (timeAxis,Psth_INITIATION,'Color','b', 'Linewidth', 3);

h3f=fill([timeAxis, fliplr(timeAxis)],[Err3Pos, fliplr(Err3Neg)], 'r', 'EdgeColor', 'none');
set(h3f,'facealpha',.5);
h3= plot (timeAxis,Psth_CORRECTPRESS,'Color','r', 'Linewidth', 3);
    
h4f=fill([timeAxis, fliplr(timeAxis)],[Err4Pos, fliplr(Err4Neg)], 'm', 'EdgeColor', 'none');
set(h4f,'facealpha',0.5)
h4= plot (timeAxis,Psth_REWARD,'Color','m', 'Linewidth', 3);



h5= line('XData', [(-1 * nSecPrev),nSecPost], 'YData', [0 0], 'LineStyle', '--', ...
    'LineWidth', 1, 'Color','k')
h6= line('XData', [0 0], 'YData', [ymin, ymax], 'LineStyle', '--', ...
    'LineWidth', 1, 'Color','k')

%labels, legend, make pretty, size
xlabel('Time (s)', 'FontSize', 20);
ylabel('\DeltaF/F (%)', 'FontSize', 20);
legend ([h1 h2 h3 h4], 'mid ITI', 'Initiation', 'Correct Press', 'Reward Retrieval', 'orientation', 'vertical', 'Location', 'SouthWest');
legend BOXOFF;
xlim ([(-1 * nSecPrev),nSecPost]);
ylim ([ymin, ymax]);
set(gca, ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.01 .01] , ...
  'Fontsize', 18, ...
  'LineWidth'   , 2         );

set(gca, 'layer', 'top');
set(gcf, 'Position', [0 0 700 500])

