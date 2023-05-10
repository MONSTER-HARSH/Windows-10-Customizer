@echo off
title Good Look Helper
color 0
:menu
cls
echo [101m [30m RUN AT YOUR OWN RISK[0m  [32m 
echo ============================================================
echo Enter [1] if u want (Hide/UnHide) Taskbar                                                      
echo Enter [2] if u want (Light/Dark) Mode                                                             
echo Enter [3] if u want (Light/Dark) TaskBar                                                       
echo Enter [4] if u want to change Transparency lvl of Taskbar   
echo Enter [5] if u want to Change Taskbar Size
echo Enter [6] For Restart Explorer                              
echo Enter [7] For EXIT                                          
echo ============================================================
set /p ans=Enter Value:

if %ans%==1 goto :UH
if %ans%==2 goto :LD
if %ans%==3 goto :LDT
if %ans%==4 goto :TT
if %ans%==5 goto :CTS
if %ans%==6 goto :RS
if %ans%==7 goto :EXIT
if %ans% GTR 7 goto :Wrong

:white 
color f0
cls
echo ============================================================
echo Enter [1] if u want (Hide/UnHide) Taskbar                                                      
echo Enter [2] if u want (Light/Dark) Mode                                                             
echo Enter [3] if u want (Light/Dark) TaskBar                                                       
echo Enter [4] if u want to change Transparency lvl of Taskbar   
echo Enter [5] if u want to Change Taskbar Size
echo Enter [6] For Restart Explorer                              
echo Enter [7] For EXIT                                          
echo ============================================================
set /p ans=Enter Value:

if %ans%==1 goto :UH
if %ans%==2 goto :LD
if %ans%==3 goto :LDT
if %ans%==4 goto :TT
if %ans%==5 goto :CTS
if %ans%==6 goto :RS
if %ans%==7 goto :EXIT
if %ans% GTR 7 goto :Wrong
:black
color 0f
cls
echo ============================================================
echo Enter [1] if u want (Hide/UnHide) Taskbar                                                      
echo Enter [2] if u want (Light/Dark) Mode                                                             
echo Enter [3] if u want (Light/Dark) TaskBar                                                       
echo Enter [4] if u want to change Transparency lvl of Taskbar   
echo Enter [5] if u want to Change Taskbar Size
echo Enter [6] For Restart Explorer                              
echo Enter [7] For EXIT                                          
echo ============================================================
set /p ans=Enter Value:

if %ans%==1 goto :UH
if %ans%==2 goto :LD
if %ans%==3 goto :LDT
if %ans%==4 goto :TT
if %ans%==5 goto :CTS
if %ans%==6 goto :RS
if %ans%==7 goto :EXIT
if %ans% GTR 7 goto :Wrong

:ERROR
color 0
cls
echo [101m [30m You are Kicked From Menu Bcoz U Enter More Then 1 You Should Enter Between (0 - 1) [0m [32m 
echo ============================================================
echo Enter [1] if u want (Hide/UnHide) Taskbar                                                      
echo Enter [2] if u want (Light/Dark) Mode                                                             
echo Enter [3] if u want (Light/Dark) TaskBar                                                       
echo Enter [4] if u want to change Transparency lvl of Taskbar   
echo Enter [5] if u want to Change Taskbar Size
echo Enter [6] For Restart Explorer                              
echo Enter [7] For EXIT                                          
echo ============================================================
set /p ans=Enter Value:

if %ans%==1 goto :UH
if %ans%==2 goto :LD
if %ans%==3 goto :LDT
if %ans%==4 goto :TT
if %ans%==5 goto :CTS
if %ans%==6 goto :RS
if %ans%==7 goto :EXIT
if %ans% GTR 7 goto :Wrong

:Wrong
cls
echo [101m [30m Please Enter Between {1 - 7} [0m [32m 
echo ============================================================
echo Enter [1] if u want (Hide/UnHide) Taskbar                                                      
echo Enter [2] if u want (Light/Dark) Mode                                                             
echo Enter [3] if u want (Light/Dark) TaskBar                                                       
echo Enter [4] if u want to change Transparency lvl of Taskbar   
echo Enter [5] if u want to Change Taskbar Size
echo Enter [6] For Restart Explorer                              
echo Enter [7] For EXIT                                          
echo ============================================================
set /p ans=Enter Value:

if %ans%==1 goto :UH
if %ans%==2 goto :LD
if %ans%==3 goto :LDT
if %ans%==4 goto :TT
if %ans%==5 goto :CTS
if %ans%==6 goto :RS
if %ans%==7 goto :EXIT
if %ans% GTR 7 goto :Wrong


:UH 
cls
echo Enter 0 For Hide Taskbar
echo Enter 1 For Unhide Taskbar
set /p Uhi=Enter The Value {0 - 1}:

if %Uhi% GTR 1 goto :Error

if %Uhi% == 0 (powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=3;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -f -ProcessName explorer}"
cls
goto menu)

if %Uhi% == 1(powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=2;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -f -ProcessName explorer}"
cls
goto menu)



:LD 
cls
echo Enter 0 For Light Mode
echo Enter 1 For Dark Mode
set /p LD=Enter The Value {0 - 1}:

if %LD% GTR 1 goto :error 

if %LD% == 0 (
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 1 /f
cls
goto white)

if %LD% == 1 (
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 0 /f
cls
goto black)


:LDT 
cls
echo Enter 0 For Light Taskbar
echo Enter 1 For Dark Taskbar
set /p LDT=Enter The Value {0 - 1}:

if %LDT% GTR 1 goto :error

if %LDT% == 0 (
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe && start explorer.exe
cls
goto menu)

if %LDT% == 1 (
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
taskkill /f /im explorer.exe && start explorer.exe
cls
goto menu)


:TT
cls
echo Enter Value Between [0-256] for change Transparency lvl of Taskbar
echo Higher Value = Lesser Transparency
echo Lesser Value = Higher Transparency
echo 256 = OFF Transparency
set /P Level=">> 

if %Level% LSS 256 (
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAcrylicOpacity /t REG_DWORD /d %Level% /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v ColorPrevalence /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe && start explorer.exe
cls
goto menu) else (reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 0 /f
cls
goto menu)
 

:RS
taskkill /f /im explorer.exe && start explorer.exe
cls
goto menu



:CTS
cls
echo Enter 0 For Normal TaskBar
echo Enter 1 For Small Taskbar

set /p CT=Enter The Value {0 - 1}:

if %CT% GTR 1 goto :Error

if %CT% == 0( reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskBarSmallIcons /t REG_DWORD /d 0 /f
taskkill /f /im explorer.exe && start explorer.exe
cls
goto menu)

if %CT% == 1( reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskBarSmallIcons /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe && start explorer.exe
cls
goto menu)


:EXIT
