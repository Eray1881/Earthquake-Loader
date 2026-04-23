@echo off
title Anti Cheat Bypass - Made By Eray
color 0b
chcp 65001 >nul
cd /d "%~dp0"
:: Yönetici kontrolü
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] LÜTFEN YÖNETİCİ OLARAK ÇALIŞTIRIN!
    pause
    exit
)

Color B
:menu
cls
echo.
echo  ███████╗ █████╗ ██████╗ ████████╗██╗  ██╗ ██████╗ ██╗    ██╗ █████╗ ██╗  ██╗███████╗
echo  ██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██║  ██║██╔═══██╗██║    ██║██╔══██╗██║ ██╔╝██╔════╝
echo  █████╗  ███████║██████╔╝   ██║   ███████║██║   ██║██║    ██║███████║█████╔╝ █████╗  
echo  ██╔══╝  ██╔══██║██╔══██╗   ██║   ██╔══██║██║▄▄ ██║██║    ██║██╔══██║██╔═██╗ ██╔══╝  
echo  ███████╗██║  ██║██║  ██║   ██║   ██║  ██║╚██████╔╝╚██████╔╝ ██║  ██║██║  ██╗███████╗
echo  ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚══▀▀═╝  ╚═════╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
echo. 
echo  ╔═══════════════════════════════════════════════════════════════════╗
echo  ║           Earthquake Anti Cheat Bypass - Made By Eray             ║
echo  ╠═══════════════════════════════════════════════════════════════════╣
echo  ║   [1] Anti Cheat Bypass                                           ║
echo  ║   [2] FiveM Önbellek Ve Log Temizle                               ║
echo  ║   [3] Proje Bilgileri                                             ║
echo  ║   [4] Bypass Nasıl Yapılır?                                       ║
echo  ║   [0] Çıkış                                                       ║
echo  ╚═══════════════════════════════════════════════════════════════════╝
echo.
set /p secim=" Seçiminizi yapın: " 

if "%secim%"=="1" goto finalclean
if "%secim%"=="2" goto fivem
if "%secim%"=="3" goto proje
if "%secim%"=="4" goto nasil
if "%secim%"=="0" exit
goto menu

:finalclean
cls
echo [!] Anti Cheat Bypass Başlatıldı Hiçbir İz Bırakılmıyor.
echo.


echo [-] USB Tak-Çıkar ve Sürücü logları temizleniyor...
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Device Association Framework\Store" /f >nul 2>&1


echo [-] Son kullanılanlar ve dosya erişim geçmişi siliniyor...
del /s /f /q "%AppData%\Microsoft\Windows\Recent\*.*" >nul 2>&1
del /s /f /q "%AppData%\Microsoft\Windows\Recent\AutomaticDestinations\*.*" >nul 2>&1
del /s /f /q "%AppData%\Microsoft\Windows\Recent\CustomDestinations\*.*" >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1


echo [-] Ocean Kritik Kayıtları kazınıyor...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\ShellNoRoam\MUICache" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\UserSettings" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps" /f >nul 2>&1


echo [-] EXE Çalıştırma kanıtları ve Hata raporları siliniyor...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppBadgeUpdated" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView" /f >nul 2>&1
del /s /f /q "%ProgramData%\Microsoft\Windows\WER\ReportArchive\*.*" >nul 2>&1
del /s /f /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*.*" >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications" /f >nul 2>&1


echo [-] Defender Tehdit Logları tamamen siliniyor...
powershell -Command "Remove-Item 'C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service\*' -Recurse -Force -ErrorAction SilentlyContinue" >nul 2>&1


echo [-] Çalıştır geçmişi temizleniyor...
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1


echo [-] Klasör hafızası (ShellBags) temizleniyor...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f >nul 2>&1


echo [-] AppReadWriteCounter verileri temizleniyor...
if exist "%LocalAppData%\Microsoft\Windows\ActivityHistory\*" del /q /f "%LocalAppData%\Microsoft\Windows\ActivityHistory\*" >nul 2>&1


echo [-] Sistem logları, DNS ve USN Journal sıfırlanıyor...
ipconfig /flushdns >nul 2>&1
fsutil usn deletejournal /d C: >nul 2>&1
del /s /f /q %windir%\Prefetch\*.* >nul 2>&1
del /s /f /q %temp%\*.* >nul 2>&1
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (wevtutil.exe cl "%%G") >nul 2>&1


echo [-] Program Uyumluluk Yardımcısı (PcaSvc) temizleniyor...
net stop PcaSvc >nul 2>&1
del /s /f /q %windir%\PcaAppLaunchDic.txt >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f >nul 2>&1
net start PcaSvc >nul 2>&1


taskkill /F /IM opera.exe /T >nul 2>&1
taskkill /F /IM opera_gx.exe /T >nul 2>&1


set "OPERA_PATH=%appdata%\Opera Software\Opera Stable"
set "OPERA_LOCAL=%localappdata%\Opera Software\Opera Stable"

if exist "%OPERA_PATH%" (
    del /q /f "%OPERA_PATH%\History" >nul 2>&1
    del /q /f "%OPERA_PATH%\Top Sites" >nul 2>&1
    rd /s /q "%OPERA_LOCAL%\Cache" >nul 2>&1
)


set "GX_PATH=%appdata%\Opera Software\Opera GX Stable"
set "GX_LOCAL=%localappdata%\Opera Software\Opera GX Stable"

if exist "%GX_PATH%" (
    del /q /f "%GX_PATH%\History" >nul 2>&1
    del /q /f "%GX_PATH%\Top Sites" >nul 2>&1
    rd /s /q "%GX_LOCAL%\Cache" >nul 2>&1
    echo [+] Opera GX Geçmişi Silindi 
)

echo [!] Google Chrome izleri temizleniyor...


taskkill /F /IM chrome.exe /T >nul 2>&1


set "CHROME_PATH=%localappdata%\Google\Chrome\User Data\Default"
set "CHROME_CACHE=%localappdata%\Google\Chrome\User Data\Default\Cache"

if exist "%CHROME_PATH%" (

    del /q /f "%CHROME_PATH%\History" >nul 2>&1
    del /q /f "%CHROME_PATH%\History-journal" >nul 2>&1
    del /q /f "%CHROME_PATH%\Top Sites" >nul 2>&1
    del /q /f "%CHROME_PATH%\Visited Links" >nul 2>&1
    del /q /f "%CHROME_PATH%\Web Data" >nul 2>&1
    

    rd /s /q "%CHROME_CACHE%" >nul 2>&1
    

    echo [+] Chrome Gecmisi Temizlendi 
)
echo.
echo [-] WMI Event ve Windows Olay Logları (wevtutil) temizleniyor...
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (wevtutil.exe cl "%%G") >nul 2>&1

echo [-] ShimCache, BAM, UserAssist ve MuiCache kazınıyor...
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\UserSettings" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\ShellNoRoam\MUICache" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f >nul 2>&1
echo.

if exist "settings" del /f /q "settings" >nul 2>&1
echo.

:: Eskisini silip yerine bunu yapıştır:
:: Yanlış olan o parantezli satırı tamamen sil ve sadece temizleme komutlarını bırak:
echo [-] Derin izler temizleniyor...
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\UserSettings" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f >nul 2>&1
echo.

echo [-] AppSwitched  FeatureUsage Kazınıyor...
:: 1. Uygulama Odaklanma Geçmişi (Hangi pencere kaç saniye açık kaldı?)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppBadgeUpdated" /f >nul 2>&1

echo [-] Tray Geçmişi Temizleniyor...
:: 2. Windows Arama Çubuğu Geçmişi (Hileyi arattıysan burada çıkar)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\SearchHistory\Microsoft.Windows.Explorer" /f >nul 2>&1

echo [-] Açık Uygulama Logları Temizleniyor...
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "IconStreams" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "PastIconsStream" /f >nul 2>&1

echo [-] Uyumluluk Asistanı Logları Temizleniyor...
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f >nul 2>&1

echo [-] Bam Hizmeti Logları Temizlendi...
:: 5. BAM (Background Activity Moderator) - Windows'un en büyük "Ele Veren" kayıtları
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\UserSettings" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings" /f >nul 2>&1

echo [-] Windows Eror Servisi Hizmeti Temizleniyor...
del /s /f /q "%ProgramData%\Microsoft\Windows\WER\ReportArchive\*.*" >nul 2>&1
del /s /f /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*.*" >nul 2>&1

echo [-] Opera arama geçmişi ve sinsi izler temizleniyor...

taskkill /F /IM opera.exe /T >nul 2>&1
taskkill /F /IM opera_gx.exe /T >nul 2>&1

:: Opera Stable İçin
set "OPERA_DIR=%appdata%\Opera Software\Opera Stable"
if exist "%OPERA_DIR%" (
    del /q /f "%OPERA_DIR%\History" >nul 2>&1
    del /q /f "%OPERA_DIR%\History-journal" >nul 2>&1
    del /q /f "%OPERA_DIR%\Visited Links" >nul 2>&1
    del /q /f "%OPERA_DIR%\Web Data" >nul 2>&1
    del /q /f "%OPERA_DIR%\Top Sites" >nul 2>&1
    rd /s /q "%localappdata%\Opera Software\Opera Stable\Cache" >nul 2>&1
)

:: Opera GX İçin
set "GX_DIR=%appdata%\Opera Software\Opera GX Stable"
if exist "%GX_DIR%" (
    del /q /f "%GX_DIR%\History" >nul 2>&1
    del /q /f "%GX_DIR%\History-journal" >nul 2>&1
    del /q /f "%GX_DIR%\Visited Links" >nul 2>&1
    del /q /f "%GX_DIR%\Web Data" >nul 2>&1
    del /q /f "%GX_DIR%\Top Sites" >nul 2>&1
    rd /s /q "%localappdata%\Opera Software\Opera GX Stable\Cache" >nul 2>&1
)

echo [-] Defender Koruma Geçmişi ve Karantina Kazınıyor...
:: Defender'ın kendi geçmişini tuttuğu klasörü tamamen uçuruyoruz
set "DEFENDER_PATH=C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service"
if exist "%DEFENDER_PATH%" (
    del /s /f /q "%DEFENDER_PATH%\*" >nul 2>&1
    for /d %%x in ("%DEFENDER_PATH%\*") do rmdir /s /q "%%x" >nul 2>&1
)

:: Karantinadaki dosyaların veritabanını temizle
del /s /f /q "C:\ProgramData\Microsoft\Windows Defender\Quarantine\*" >nul 2>&1

:: PowerShell ile Koruma Geçmişini sıfırlama komutu (En garantisi budur)
powershell -Command "Set-MpPreference -ScanPurgeItemsAfterDelay 1" >nul 2>&1
powershell -Command "Clear-MpPreference -QuarantinePurgeItemsAfterDelay 1" >nul 2>&1

:: Defender Olay Günlüklerini (Event Logs) temizle (Admin buradan da bakabilir)
wevtutil cl "Microsoft-Windows-Windows Defender/Operational" >nul 2>&1
wevtutil cl "Microsoft-Windows-Windows Defender/WHC" >nul 2>&1

echo [------------------------------------------------------]
echo [OK] USB Logları Temizlendi.
echo [OK] Prefetch ve Sistem Logları Sıfırlandı.
echo [OK] Opera GX Geçmişi Temizlendi.
echo [OK] Google Chrome Gecmisi Temizlendi
echo [OK] Son Açılan Uygulama Geçmişi Temizlendi
echo [OK] Çıkarılan USB Geçmişi Temizlendi
echo [OK] WMI ve Sistem Olay Logları Temizlendi
echo [OK] BAM ve ShimCache Kayıtları Silindi
echo [OK] Silinen Uygulama Logları Temizlendi
echo [OK] Windows Error Klasörü Temizlendi 
echo [OK] Arka Planda Açık Uygulama Logları Temizlendi
echo [OK] AppSwitched & FeatureUsage Logları Temizlendi
echo [OK] Opera Arama Geçmişi Temizlendi
echo [------------------------------------------------------]
echo.
echo [!] TÜM İZLER BAŞARIYLA SİLİNDİ! AntiCheat BYPASS TAMAMLANDI.

echo [-] RAM üzerindeki kalıntılar için Explorer yenileniyor... (Ekran Gidip Gelebilir)
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe
echo [?] Ana menüye dönmek için bir tuşa basın...
pause >nul
goto menu

:fivem
cls
echo [!] FiveM temizliği yapılıyor...
taskkill /f /im FiveM.exe >nul 2>&1
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\cache" >nul 2>&1
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\logs" >nul 2>&1
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\crashes" >nul 2>&1
echo.
timeout /t 1 >nul
echo FiveM Cache Silindi
timeout /t 1 >nul
echo Fivem Logları Silindi
echo [OK] FiveM Önbellek, Loglar ve Crash dosyaları silindi!
pause
goto menu

:proje
cls
echo Earthquake Ocean Bypass v14.0
echo Yapımcı: Eray Discord : ua_eray
echo Bu Araç Sadece Ocean İçin Değil Napse,Storm Gibi Araçlar İçinde Geçerlidir
pause
goto menu

:nasil
cls
echo ============================================================================
echo                          BYPASS NASIL YAPILIR?
echo ============================================================================
echo.
echo.
echo Bypass İşlemi Yapmak İçin Öncelikle Hilenizi Usbye Atın Usbye attıktan sonra kullanırken 
echo Bir Durum Olursa (Kontrole Çağrılma gibi) Hemen Hileyi Kapatın Usbyi Çıkarın Ve Ocean Bypass Yapın
echo                                  -Made By Eray-
echo Veya Earthquake Loader Kullanın :)
pause
goto menu
