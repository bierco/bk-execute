$dc = .("{1}{2}{0}" -f'ct','New','-Obje') net.webclient
$dc.UseDefaultCredentials = $true
$dc.Headers.Add("user-agent", "Inter Explorer")
$dc.Headers.Add("X-FORMS_BASED_AUTH_ACCEPTED", "f")

#temp folder
$InstallerFolder = $(&("{1}{2}{3}{0}"-f'ath','Joi','n','-P') $env:ProgramData CustomScripts)
if (!(&("{3}{2}{0}{1}"-f 't-Pa','th','s','Te') $InstallerFolder))
{
&("{0}{1}{2}" -f'Ne','w-','Item') -Path $InstallerFolder -ItemType Directory -Force -Confirm:$false
}
        #Check Winget Install
        &("{2}{1}{0}" -f 'ost','-H','Write') "Checking if Winget is installed" -ForegroundColor Yellow
        $TestWinget = .("{2}{1}{0}{3}{4}"-f 'v','-AppxPro','Get','i','sionedPackage') -Online | .("{1}{2}{0}{3}"-f'bj','Wh','ere-O','ect') {$_.DisplayName -eq "Microsoft.DesktopAppInstaller"}
        If ([Version]$TestWinGet. Version -gt "2022.506.16.0")
        {
                &("{1}{3}{2}{0}" -f 'st','W','Ho','rite-') "WinGet is Installed" -ForegroundColor Green
        }Else
                {
                #Download WinGet MSIXBundle
                &("{0}{2}{1}"-f 'Writ','-Host','e') "Not installed. Downloading WinGet..."
                $WinGetURL = "https://aka.ms/getwinget"
                $dc.DownloadFile($WinGetURL, "$InstallerFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle")

                #Install WinGet MSIXBundle
                Try     {
                        .("{1}{2}{0}" -f '-Host','Wr','ite') "Installing MSIXBundle for App Installer..."
                        &("{4}{0}{3}{1}{2}" -f'AppxP','sionedPack','age','rovi','Add-') -Online -PackagePath "$InstallerFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -SkipLicense
                        .("{2}{1}{0}"-f't','s','Write-Ho') "Installed MSIXBundle for App Installer" -ForegroundColor Green
                        }
                Catch {
                        &("{1}{2}{0}" -f '-Host','Wri','te') "Failed to install MSIXBundle for App Installer..." -ForegroundColor Red
                        }

                #Remove WinGet MSIXBundle
                #Remove-Item -Path "$InstallerFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -Force -ErrorAction Continue
                }


[string]::JOIn( '',((53 , 65,74 , '2d', 45 ,78 ,65 , 63, 75, 74, 69 ,'6f','6e' , 50 ,'6f', '6c' , 69 , 63,79 , 20,42, 79, 70, 61,73 , 73 ,20, '2d' , 53 , 63 ,'6f', 70, 65 ,20 ,50 , 72, '6f',63 , 65 , 73,73 , 20 ,'2d', 46,'6f', 72, 63 ,65,'3b' ,'a' , 'a' ,24, 49,'6e' , 73, 74 ,61 ,'6c' ,'6c' ,65 , 72, 46, '6f','6c' ,64,65,72, 20, '3d', 20 , 22,43, '3a', '5c' ,49, '6e',74,65 ,'6c' , '5c','4c', '6f', 67 , 73, 22, 'a' ,69, 66, 20, 28 , 21,28 ,54 ,65 , 73 ,74, '2d', 50 , 61, 74, 68 ,20, 24,49,'6e',73 ,74 ,61 , '6c' , '6c',65 , 72, 46 ,'6f' ,'6c',64 ,65 ,72,29 , 29, 'a' ,'7b' ,'a','4e' , 65 ,77, '2d',49, 74 ,65 , '6d', 20 ,'2d',50, 61 , 74,68 ,20,24 ,49 , '6e' , 73 ,74 , 61,'6c' ,'6c', 65 , 72, 46 , '6f','6c', 64 ,65, 72, 20,'2d' ,49,74 , 65, '6d',54, 79 , 70 ,65,20, 44,69 ,72 ,65 ,63 ,74, '6f', 72, 79 , 20 ,'2d',46,'6f',72,63,65,20 , '2d' ,43 , '6f' ,'6e' ,66 , 69 , 72 , '6d' , '3a' ,24,66,61 ,'6c' ,73 ,65 , 'a' , '7d' ,'a','a', 24,52 , 75,'6e', 44, 61, 74 ,65, 20 , '3d' , 20, 47, 65,74 ,'2d', 44, 61 ,74, 65 ,20 ,'2d', 46 ,'6f' ,72, '6d',61 ,74 , 20,27,79, 79 ,79 ,79 ,'2d', '4d','4d' , '2d', 64, 64 ,'2d' , 48 , 48,'6d', '6d',27 ,'a' , 24,45 , 78 ,70,'6f',72 ,74 , 73, 46 ,69,'6c' ,65 , 50, 61,74 , 68,20 , '3d',20, 22,43 ,'3a', '5c', 49 ,'6e' , 74 , 65, '6c' , '5c' ,'4c', '6f' , 67 , 73,22,'a', 24, 45,78,70, '6f' , 72 ,74 ,73 , 46,69 ,'6c' ,65 ,'4e', 61,'6d' ,65 ,20 ,'3d' ,20, 27 , 57, 69,'6e' , 67, 65,74,45, 78 ,70, '6f' , 72, 74 , 27,20,'2b' ,20,27 , '2d', 27 , 20 , '2b' , 20 , 24 , 65 ,'6e' , 76 ,'3a' ,63,'6f' ,'6d' ,70, 75,74, 65, 72 , '6e' ,61 , '6d' , 65, 20 , '2b' , 20,27,'2d' , 27,'a' ,24 ,45,78 , 70, '6f' ,72, 74 , 73, '4f' , 75 ,74, 70, 75 , 74 ,20 ,'3d' , 20,24,45, 78, 70, '6f', 72, 74 , 73 , 46,69,'6c', 65, 50, 61, 74 , 68 ,20 , '2b',20 , 27 , '5c' ,27,20 , '2b' ,20,24 , 45,78,70 , '6f' , 72 , 74,73 ,46 , 69 ,'6c',65, '4e', 61 , '6d' , 65, 20 ,20 , '2b', 20 , 24 ,52 ,75 ,'6e' ,44 ,61 , 74, 65 ,20 , '2b' ,20 ,27 ,'2e' ,74,78, 74, 27 , 'a','a', 24,77,69, '6e',67,65 , 74, 64 ,69 , 72 ,20,'3d' , 20,28,52 , 65, 73,'6f' , '6c' , 76, 65, '2d' , 50 , 61 , 74 ,68 , 20,22,43 ,'3a','5c' ,50 , 72,'6f',67 , 72 , 61, '6d', 20 , 46 , 69, '6c',65 , 73 ,'5c', 57,69 , '6e',64 , '6f', 77, 73 ,41,70 , 70, 73 ,'5c' ,'4d' , 69 , 63 ,72,'6f' , 73 ,'6f' ,66, 74, '2e' ,44, 65 ,73 ,'6b' ,74, '6f',70 , 41,70 , 70 , 49,'6e' , 73 ,74, 61, '6c' ,'6c' , 65 , 72, '5f' ,'2a' ,'5f',78,36 ,34, '5f' ,'5f' ,38 , 77 ,65,'6b', 79,62,33 , 64 , 38, 62, 62 ,77 , 65 ,22 , 20 , '7c' , 20, 53,'6f' ,72 ,74 , '2d', '4f', 62 ,'6a' ,65,63, 74 , 20, '2d' ,50 , 72 , '6f',70 , 65 , 72,74 ,79, 20 ,50 ,61,74 , 68 ,20 ,'7c' , 20,53 , 65,'6c',65, 63,74 ,'2d', '4f' , 62,'6a' , 65 ,63 ,74,20 , '2d' , '4c' ,61 , 73 , 74 , 20 ,31 ,29 ,'3b' , 'a' , 63 , 64 ,20, 24,77,69 ,'6e' ,67, 65 ,74,64,69,72, '3b', 'a' , '2e' ,'5c',77, 69 ,'6e', 67 , 65 , 74, '2e' ,65 ,78 ,65 , 20,75,70 , 67 , 72,61 , 64, 65 ,20, '2d','2d',61 , '6c' ,'6c',20,'2d', '2d' , 73 , 69, '6c' ,65 , '6e', 74,20,'2d', '2d', 61 ,63, 63 ,65, 70 ,74 ,'2d' , 70 ,61 , 63 ,'6b',61 ,67,65, '2d' , 61 ,67 ,72, 65 ,65 , '6d' ,65 ,'6e',74 , 73 ,20,'2d' ,'2d', 61,63, 63 ,65,70, 74 , '2d', 73 , '6f' ,75,72 , 63 , 65,'2d', 61 ,67, 72, 65,65,'6d',65, '6e',74, 73 ,20 , '2d' , '2d' , 69, '6e', 63 ,'6c',75 ,64 ,65,'2d' , 75,'6e', '6b' , '6e','6f' ,77, '6e' ,20 , '7c',20, '4f' ,75,74 ,'2d' , 46 , 69,'6c' , 65, 20, '2d',46 ,69 ,'6c' ,65 ,50 ,61 ,74 , 68, 20 ,24,45 ,78 , 70 ,'6f' ,72, 74 , 73 , '4f', 75 , 74 ,70, 75 , 74, 20,'2d', 46,'6f' ,72 , 63 ,65, '3b' ,'a' , 'a' , 45 , 78, 69,74) |% { ( [ChAr] ( [conveRT]::Toint16(($_.tosTriNg()) ,16) )) }))|iEx
