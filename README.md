The following series of Matlab programs were used to analyze the data and generate graphs in Holly et al., 2021 (Current Biology). As is often the case, analyses evolved over time; as such there are multiple programs to run in sequence:
1. PathX_DBZSub : Run all raw TDT files and save each workspace. 
2. ConcatAllRewards : Run this only if you want to concatenate multiple sessions for each mouse. Omit otherwise
3. Run sigm_fit on behavioral data to determine bins; I typically save the sigmoidal fits for each mouse in the same workspace. 
4. SigFitPSTHSplit: This will split the PSTHs for each mouse based on the bins you set. (program will prompt for bins). Run for each mouse.
5. SigPSTHArrayPlot: This will make the figures combining PSTHs for all the mice.

GenerateEveryMinPSTHs_BinSigBins will generate PSTHs every 60s in the set bins; from Figure S1M.

If you have any questions or run into errors, contact eholly@pennmedicine.upenn.edu
