set pf="Program Files"
set config=F:\ProjDir\PopAge_disagg\cfg
set geodmsversion=GeoDMS7218

set list=(Austria BelgLux Bulgaria Croatia Cyprus Czechia Denmark Estonia Finland  Hungary Latvia Lithuania Malta Netherlands Portugal Slovakia Slovenia Greece Ireland)


for %%x in %list% do (
	C:\%pf%\ObjectVision\%geodmsversion%\GeoDmsRun.exe %config%\main.dms /LUISA_sequence/ModelSequence/%%x/ModelSequence/P2050/StoreResults
	)