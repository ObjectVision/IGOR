@echo off
rem Regenerates the IGOR Analysis end results with a recent GeoDMS (tested 2026-09-03 with GeoDms 20.19.1):
rem   /Analysis/StoreResults/button  -> 36 sex x 5-year-age population maps (1km, persons) + Total.tif and
rem                                     rel\ (shares per cell), IPF-fitted from the 100m ARDECO map, the LAU
rem                                     census pyramids (POP_AGE_SEX_<year>...csv) and the ESTAT 1km sex/age grids.
rem Output folder: %LocalDataDir%\IGOR\reference\<StudyArea>_<PopVersie>_<PopYear>_<Gridsize>_x0\
rem (ModelParameters in cfg\main.dms; default EU_Ardeco_2011_100_x0).
rem
rem Needs the source data from cfg\main\SourceData.dms and SourceData\RegionalUnits.dms under
rem %SourceDataDir%\IGOR (Population\ and Regions\), or an IGOR_DataDir override.
rem Runtime on a 16-core / 128 GB workstation (GeoDms 20.19.1, 2026-09-03): EU 2 min 10 s, peak 11 GB RAM, 0.7 GB output; Nederland 15 s.
rem
rem The registry override IGOR_DataDir (GUI > Tools > Config Options) wins over cfg\main\ConfigSettings.dms;
rem uncomment the next line to pin the data folder for this run regardless of that override:
rem set GEODMS_Overridable_IGOR_DataDir=F:/SourceData/IGOR

set geodms=C:\Program Files\ObjectVision\GeoDms20.19.1.m\GeoDmsRun.exe
set cfg=%~dp0..\cfg\main.dms
set log=%LocalAppData%\Temp\IGOR_regenerate_analysis.log

"%geodms%" /L"%log%" /S1 /S2 /S3 "%cfg%" /Analysis/StoreResults/button @statistics /Analysis/result/MAPE /Analysis/result/Diff_X_i_P_i /Analysis/Checks/Qr_0_and_Pr_gt0
echo GeoDmsRun exit code %ERRORLEVEL%, log: %log%
