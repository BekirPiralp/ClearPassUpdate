::--------------------------------------------------------------
::
::	Cler Pass Update   <==>  Bekir PİRALP
::
::--------------------------------------------------------------

:: Global Değişkenler
	set alVeri=;D
	set ekranVeri=E
:: Global Değişken Bitiş



:Basla
	call :Ekran-Ayar
	
	call :Menu
	call :Veri-Al
	@echo.
	@echo.
	call :Yonel
goto Basla

exit /B 0


::	Fonksiyonlar

:Ekran-Ayar
	@echo off
		::Ekranda girilen komutları gizler

	if %ekranVeri%==E (
		cls
	)
	
		::Ekranı temizler

	color 0b	
		::Yazı rengi Yeşil

	Title Clear Pass Guncelleme 
		::Başlık
exit /B 0



:Menu
	set Not= NOT: Bu program Clear Pass Uygulamasini guncellemek icin yapilmistir.!
	set Ekran= Ekrani temizlemeyi acmak ve kapatmak icin d'ye basiniz.
	set Ayrac============================================================================
	set Bilgi=aa

	set Normal=Normal guncelleme icin       N
	set    Zor=Zorlayarak guncelleme icin   Z
	set    Cik=Cikmak icin                  C
	
	if %ekranVeri%==E (
		set bilgi=                           EKRAN TEMiZLEME ACiK
	)
	if %ekranVeri%==H (
		set bilgi=                           EKRAN TEMiZLEME KAPALI
	)

	@echo %Ayrac%	
	@echo.
	@echo %Not%
	@echo %Ekran%
	@echo.
	@echo %Ayrac%
	@echo %Bilgi%
	@echo %Ayrac%	
	@echo.
	@echo.
	
	@echo %Normal% 
	@echo %Zor% 
	@echo %Cik%
	@echo.    

exit /B 0

:Veri-Al
	set /p alVeri=Lutfen secim yapiniz:
exit /B 0

:Yonel
	if %alVeri%==n (
		goto :Normal
	) 
	if %alVeri%==N (
		goto :Normal
	)
	
	if %alVeri%==z (
		goto :Zorla
	)
	if %alVeri%==Z (
		goto :Zorla
	)
	
	if %alVeri%==d (
		goto :Ekran-Veri-Degis
	) 
	if %alVeri%==D (
		goto :Ekran-Veri-Degis
	)
	
	if %alVeri%==c (
		goto :Cik
	) 
	if %alVeri%==C (
		goto :Cik
	)
	
	
	:: hic bir durumda olmaz ise ...
exit /B 0

:Zorla
	gpupdate /force
exit /B 0

:Normal
	gpupdate 
exit /B 0

:Cik
	exit
exit /B 0 
		:: çık fonksiyonunun bitimi olduğu anlaşılsın diye

:Ekran-Veri-Degis

	set val=F
	if %ekranVeri%==E (
		set ekranVeri=H
		set val=T
		cls
	)
	if %ekranVeri%==H (
		if %val%==F ( 
			set ekranVeri=E
		)
	)

exit /B 0

::	Fonksiyonlar Bitiş
