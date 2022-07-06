@echo off
setlocal enabledelayedexpansion
:: inc;x = increment x
:: dec;x = decrement x
:: start;x;y = start loop x while y is not zero
:: end;x;y = end loop x
@echo off
set cmd=0
set v=%%
FOR /F "delims=; tokens=1,2,3,4,5,6,7" %%a in (%1) do (
	set /a cmd=!cmd!+1
	set /a cmdnext=!cmd!+1
	if %%a == inc (
		echo !cmd!;%%b;-1;%cmd%;>>%1.lag
	) else if %%a == dec (
		echo !cmd!;%%b;1;%cmdnext%;>>%1.lag
	) else if %%a == start (
		echo start%%b;%%c;0;end%%b;>>%1.lag
	) else if %%a == end (
		echo end%%b;%%c;0;after%%b;>>%1.lag
		echo loop%%b;go;0;start%%b;>>%1.lag
		echo after%%b;endloop;1;after%%b;>>%1.lag
	)


)
