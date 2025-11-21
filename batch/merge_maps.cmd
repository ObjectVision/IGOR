set pf="Program Files"
set config=E:\ProjDir\PopAge_disagg
set geodmsversion=GeoDMS7165

rem set list=(Under15 y15t29 y30t49 y50t64 y65t84 Over85)
set list=(y15t29 y30t49 y50t64 y65t84 Over85)

for %%x in %list% do (
	C:\%pf%\ObjectVision\%geodmsversion%\GeoDmsRun.exe %config%\main.dms fit_proportionally/merge_maps/%%x/result
	)