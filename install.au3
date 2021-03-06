#RequireAdmin
#include <lib\Array.au3>
#include <lib\MsgBoxConstants.au3>
#include <lib\WinAPIShPath.au3>

Func _WinWaitActivate($title,$text,$timeout=0)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
EndFunc

global $exe    = $CmdLine[1]
global $licenc = $CmdLine[2]

Sleep(200)
Run($exe)
_WinWaitActivate("[CLASS:#32770]","")
Send("{ENTER}")
_WinWaitActivate("[CLASS:MsiDialogCloseClass]","")
Sleep(2000)
_WinWaitActivate("[CLASS:MsiDialogCloseClass]","")
Send("{ENTER}")
_WinWaitActivate("[CLASS:MsiDialogCloseClass]","Wählen Sie einen Setuptyp aus.")
Send("{TAB}")
Send("{TAB}")
Send("{SPACE}")
_WinWaitActivate("[CLASS:MsiDialogCloseClass]","Siemens NX 10.0 wird installiert in")
Send("{ENTER}")
_WinWaitActivate("[CLASS:MsiDialogCloseClass]","Geben Sie den Servernamen oder eine Lizenzdatei ein")
Send("{TAB}")
Send("{TAB}")
Send("{TAB}")
Sleep(1000)
Send($licenc)
Sleep(1000)
Send("{TAB}")
Send("{TAB}")
Send("{SPACE}")
Sleep(10000)
If WinExists("UGS-Lizenzdatei") Then
   Send("{ENTER}")
EndIf
; Language menu
_WinWaitActivate("[CLASS:MsiDialogCloseClass]","Koreanisch")
Send("{TAB}")
Send("{TAB}")
Send("{TAB}")
Send("{DOWN}")
Send("{DOWN}")
Send("{DOWN}")
Send("{DOWN}")
Send("{TAB}")
Send("{ENTER}")
_WinWaitActivate("[CLASS:MsiDialogCloseClass]",'Klicken Sie auf "Installieren", um mit der Installation zu beginnen.')
Send("{ENTER}")
_WinWaitActivate("[CLASS:MsiDialogCloseClass]",'Protokolldatei von Windows Installer anzeigen')
Send("{ENTER}")