@ECHO OFF
@REM ###########################################
@REM # Script file to run the flow 
@REM # 
@REM ###########################################
@REM #
@REM # Command line for ngdbuild
@REM #
ngdbuild -p xc6slx4tqg144-3 -nt timestamp -bm kkk.bmm "D:/fpga_project/cpu/17/implementation/kkk.ngc" -uc kkk.ucf kkk.ngd 

@REM #
@REM # Command line for map
@REM #
map -o kkk_map.ncd -w -pr b -ol high -timing -detail kkk.ngd kkk.pcf 

@REM #
@REM # Command line for par
@REM #
par -w -ol high kkk_map.ncd kkk.ncd kkk.pcf 

@REM #
@REM # Command line for post_par_trce
@REM #
trce -e 3 -xml kkk.twx kkk.ncd kkk.pcf 

