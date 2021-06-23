function [realpeakloc,realpeakMag, realpeakwidth, realpeakprom, fig]=peakfinder_EHedit_10s_mod(normDat_DB, Fs, ts)
%{
PEAKFINDER
Plots data.
Finds all peaks above threshold. 
Finds median of subthreshold peaks.
Returns all peaks larger than x medians.
Input: 
    mod_dat1: normalized data
    Fs: Sampling frequency
    ts: time vector
Output: 
    peakInd:Index of the peaks in ts
    peakMag: Magnitude of the peaks
%}

minpeakdist= 0.75; %default was 0.2
tstart_loc=1;
tstop_loc=length(normDat_DB);
t_ind=[tstart_loc:tstop_loc];
colors.green=[0 150 36]/255;
colors.red=[229 28 35]/255;

%Find peak threshold: 2 mads over the median of the normalized data
thr=2;
medval=median(normDat_DB); 
smmad=mad(normDat_DB);
thresh=medval+thr*smmad;

%this is EH edit for a moving threshold; number * Fs is number of seconds
%you want the moving window. trying 10s for now?
moving_medval = zeros(1,length(normDat_DB));
moving_smmad = zeros(1, length(normDat_DB));
moving_medval(1:30*Fs) = median(normDat_DB(1:10*Fs));
moving_smmad(1:30*Fs) = mad(normDat_DB(1:10*Fs));
moving_medval(end-(30*Fs):end) = median(normDat_DB(end-(10*Fs):end));
moving_smmad(end-(30*Fs):end) = mad(normDat_DB(end-(10*Fs):end));


for i = (30*Fs)+1:(length(normDat_DB)-(30*Fs))
    moving_medval(i) = median(normDat_DB((i-30*Fs):(i+30*Fs)));
    moving_smmad(i) = mad(normDat_DB((i-30*Fs):(i+30*Fs)));
end

moving_thresh = zeros(1,length(normDat_DB));
for i = 1:length(normDat_DB)
    moving_thresh(i) = moving_medval(i)+thr*moving_smmad(i);
end



%Plot Data
fig = figure;
plot(ts(tstart_loc:tstop_loc), normDat_DB(tstart_loc:tstop_loc))
hold on
%plot(ts([1 length(normDat_DB_modZ)]),[1 1]*thresh,'color',colors.green);
%EH EDIT for the moving threshold
plot(ts(tstart_loc:tstop_loc), moving_thresh(tstart_loc:tstop_loc),'color',colors.green);

%Find all local maxima (no threshold)
[allpeaks, allpeaklocs, allpeakswidth, allpeaksprominence]=findpeaks(normDat_DB(t_ind),'MinPeakDistance',round(minpeakdist*Fs),'MinPeakProminence',.2,'Annotate','extents');
allpeaklocs=allpeaklocs+tstart_loc-1;

%we first need to eliminate all the data points that are over that moving threshold 
%I just made, then get a new median/mad that excludes our outliers, and this is the 
%real moving threshold for the peaks. 
%In order to do this, I make a new array that sets all values above
%the moving threshold for that time point as NaNs, then use functions that
%exclude NaNs to come up with a new moving threshold.


sub_movingthresh=zeros(1,length(normDat_DB));
for q=1:length(normDat_DB)
    if normDat_DB(q)>moving_thresh(q)
        sub_movingthresh(q)=NaN;
    else sub_movingthresh(q)=normDat_DB(q);
    end
end
sub_movingthresh=transpose(sub_movingthresh);

%Getting official peak threshold: 3 MADs above median, excluding values
%above the first threshold
newthr=4;
newmedval=nanmedian(sub_movingthresh); 
newsmmad=mad(sub_movingthresh);
newthresh=newmedval+newthr*newsmmad;

new_moving_medval = zeros(1,length(sub_movingthresh));
new_moving_smmad = zeros(1, length(sub_movingthresh));
new_moving_medval(1:30*Fs) = nanmedian(sub_movingthresh(1:10*Fs));
new_moving_smmad(1:30*Fs) = mad(sub_movingthresh(1:10*Fs));
new_moving_medval(end-(30*Fs):end) = nanmedian(sub_movingthresh(end-(10*Fs):end));
new_moving_smmad(end-(30*Fs):end) = mad(sub_movingthresh(end-(10*Fs):end));

for j = (30*Fs)+1:(length(sub_movingthresh)-(30*Fs))
    new_moving_medval(j) = nanmedian(sub_movingthresh((j-30*Fs):(j+30*Fs)));
    new_moving_smmad(j) = mad(sub_movingthresh((j-30*Fs):(j+30*Fs)));
end

new_moving_thresh = zeros(1,length(sub_movingthresh));
for j = 1:length(sub_movingthresh)
    new_moving_thresh(j) = new_moving_medval(j)+newthr*new_moving_smmad(j);
end

realpeakMag=[];
realpeakInd=[];
realpeakwidth=[];
realpeakprom=[];

for r=1:length(allpeaks)
    if allpeaks(r)>=new_moving_thresh(allpeaklocs(r))
        realpeakMag(length(realpeakMag)+1)=allpeaks(r);
        realpeakInd(length(realpeakInd)+1)=allpeaklocs(r);
        realpeakwidth(length(realpeakwidth)+1)=allpeakswidth(r);
        realpeakprom(length(realpeakprom)+1)=allpeaksprominence(r);
    end
end

%peakLoc=ts(peakInd);
realpeakloc=ts(realpeakInd);

%Plot peaks
plot(ts(realpeakInd),realpeakMag,'o','markersize',5,'linewidth',2,'color',colors.red);
plot(ts(tstart_loc:tstop_loc), new_moving_thresh(tstart_loc:tstop_loc),'color',colors.red);

hold off

end