#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn, All  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetKeyDelay, 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Pixel
CoordMode, Mouse

natsukiPoemWords := []
act2_natsukiPoemWords := []
sayoriPoemWords := []
yuriPoemWords := []
Loop, Read, .\ASS_dokidoki-goodend_resources\act1_natsuki_poemwords.txt
{
	natsukiPoemWords.Push(A_LoopReadLine)
}
Loop, Read, .\ASS_dokidoki-goodend_resources\act2_natsuki_poemwords.txt
{
	act2_natsukiPoemWords.Push(A_LoopReadLine)
}
Loop, Read, .\ASS_dokidoki-goodend_resources\act1_sayori_poemwords.txt
{
	sayoriPoemWords.Push(A_LoopReadLine)
}
Loop, Read, .\ASS_dokidoki-goodend_resources\act1_yuri_poemwords.txt
{
	yuriPoemWords.Push(A_LoopReadLine)
}

composePoem(member) {
	global
	
	jumpWordsPicked := 0
	if (member = "natsuki")
	{
		Loop, 20 {
			if (jumpWordsPicked < 10) {
				for i, poemWord in natsukiPoemWords
				{
					ImageSearch, FoundX, FoundY, 633, 190, 1333, 848, .\ASS_dokidoki-goodend_resources\poem_words\%poemWord%.png
					if (ErrorLevel = 0) {
						Click, %FoundX%, %FoundY%
						MouseMove, 291, 586
						jumpWordsPicked++
						break
					}
				}
			}
			if (ErrorLevel != 0 || jumpWordsPicked >= 10) {
				Click, 692, 285
				MouseMove, 291, 586
			}
		}
	}
	else if (member = "yuri")
	{
		Loop, 20 {
			if (jumpWordsPicked < 10) {
				for i, poemWord in yuriPoemWords
				{
					ImageSearch, FoundX, FoundY, 633, 190, 1333, 848, .\ASS_dokidoki-goodend_resources\poem_words\%poemWord%.png
					if (ErrorLevel = 0) {
						Click, %FoundX%, %FoundY%
						MouseMove, 291, 586
						jumpWordsPicked++
						break
					}
				}
			}
			if (ErrorLevel != 0 || jumpWordsPicked >= 10) {
				Click, 692, 285
				MouseMove, 291, 586
			}
		}
	}
	else if (member = "sayori")
	{
		Loop, 20 {
			if (jumpWordsPicked < 10) {
				for i, poemWord in sayoriPoemWords
				{
					ImageSearch, FoundX, FoundY, 633, 190, 1333, 848, .\ASS_dokidoki-goodend_resources\poem_words\%poemWord%.png
					if (ErrorLevel = 0) {
						Click, %FoundX%, %FoundY%
						MouseMove, 291, 586
						jumpWordsPicked++
						break
					}
				}
			}
			if (ErrorLevel != 0 || jumpWordsPicked >= 10) {
				Click, 692, 285
				MouseMove, 291, 586
			}
		}
	}
	else if (member = "monika")
	{
		MsgBox, You can't write poems for Monika.
		ExitApp
	}
	else if (member = "rush")
	{
		Loop, 20 {
			Sleep, 1
			Click, 692, 285
			MouseMove, 291, 586
		}
	}
	else if (member = "natsuki_act2")
	{
		Loop, 20 {
			if (jumpWordsPicked < 10) {
				for i, poemWord in natsukiPoemWords
				{
					ImageSearch, FoundX, FoundY, 633, 190, 1333, 848, .\ASS_dokidoki-goodend_resources\poem_words\%poemWord%.png
					if (ErrorLevel = 0) {
						Click, %FoundX%, %FoundY%
						MouseMove, 291, 586
						jumpWordsPicked++
						break
					}
				}
			}
			if (ErrorLevel != 0 || jumpWordsPicked >= 10) {
				Click, 692, 285
				MouseMove, 291, 586
			}
		}
	}
	else
	{
		MsgBox % "Error, ''" . %member% . "'' is not a valid target for poems"
		ExitApp
	}
	MouseMove, 74, 930
}

saveGame(slot)
{
	Sleep, 50
	Send, {Escape}
	Sleep, 300
	if (slot = 1)
	{
		Click, 751, 432
	}
	else if (slot = 2)
	{
		Click, 1172, 432
	}
	else if (slot = 3)
	{
		Click, 1551, 432
	}
	else if (slot = 4)
	{
		Click, 751, 725
	}
	else if (slot = 5)
	{
		Click, 1172, 725
	}
	else if (slot = 6)
	{
		Click, 1551, 725
	}
	else
	{
		MsgBox, Slot '%slot%' not valid
		ExitApp
	}
	Sleep, 50
	Send, {Escape}
	Sleep, 300
	MouseMove, 74, 930
}

loadGame(slot) {
	Sleep, 50
	Send, {Escape}
	Sleep, 300
	Click, 202, 652
	Sleep, 50
	if (slot = 1)
	{
		Click, 751, 432
	}
	else if (slot = 2)
	{
		Click, 1172, 432
	}
	else if (slot = 3)
	{
		Click, 1551, 432
	}
	else if (slot = 4)
	{
		Click, 751, 725
	}
	else if (slot = 5)
	{
		Click, 1172, 725
	}
	else if (slot = 6)
	{
		Click, 1551, 725
	}
	else
	{
		MsgBox, Slot '%slot%' not valid
		ExitApp
	}
	Sleep, 50
	Send, {Right}{Enter}
	Sleep, 300
	MouseMove, 74, 930
}

]::
	
	;I'll let you guess what this does
	Run, .\DDLC.exe
	
	;Wait for DDLC window to exist before switching to and maximizing it
	Loop {
		if WinExist("ahk_exe DDLC.exe") {
			WinActivate, ahk_exe DDLC.exe
			WinMaximize
			MouseMove, 74, 930
			break
		}
		Sleep, 25
	}
	
	;Agree to terms
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, .\ASS_dokidoki-goodend_resources\terms_agree.png
		if (ErrorLevel = 0) {
			Send, {Up}{Enter}
			break
		}
		Send, {Enter}
		Sleep, 15
	}
	
	;New Game Act 1
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, .\ASS_dokidoki-goodend_resources\new-game_act1.png
		if (ErrorLevel = 0) {
			Send, {Down 3}{Enter}
			Send, {Left 2}{Right}{Up 2}{Right}{Enter}{Up}{Enter}
			Send, {Escape}{Down}{Enter}
			break
		}
	}
	
	;Naming Protagonist
	Send, ASSBot
	Send, {Down}
	Send, {Enter}
	Sleep, 1000
	
	
	;START OF ACT 1
	
	;Start Timer
	Send, {Numpad1}
	
	;Skip through first day
	Send, {Ctrl down}
	Loop {
		;Check for poem tutorial
		PixelSearch, xColour, yColour, 1360, 495, 1360, 495, 0xF4E6FF, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			Send, {Down}{Enter}
			break
		}
	}
	
	;Wait until the poem composition screen is reached
	Loop {
		PixelSearch, xColour, yColour, 214, 420, 214, 420, 0xC7C7C7, 0, Fast
		if (ErrorLevel = 0) {
			break
		}
	}

	;ACT 1, POEM 1, CG 1 (Sayori)
	;Compose poem for Sayori
	composePoem("sayori")
	
	;Skip through day until the 'poem showing' screen comes up.
	Send, {Ctrl down}
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_first.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
			break
		}
	}
	Loop, 3 {
		Loop {
			ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_next.png
			if (ErrorLevel = 0) {
				Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
				Sleep, 200
				break
			}
		}
	}
	
	;Skip through day until fight happens
	;Will pick Yuri (this choice doesn't affect anything in the game other than dialogue)
	Loop {
			ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\fight.png
			if (ErrorLevel = 0) {
				Send, {Ctrl up}{Up 3}{Enter}{Ctrl down}
				break
			}
		}
	
	
	;Wait until the poem composition screen is reached
	Loop {
		PixelSearch, xColour, yColour, 214, 420, 214, 420, 0xC7C7C7, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	
	
	
	saveGame(1)
	;ACT 1, POEM 2, CG 2 (Sayori)
	;Compose poem for Sayori
	composePoem("sayori")
	
	;Skip through day until Sayori CG.
	Send, {Ctrl down}
	Loop {
		PixelSearch, xColour, yColour, 1321, 796, 1321, 796, 0xE49B5C, 2, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			loadGame(1)
			break
		}
	}
	
	;Dismiss skip button tutorial
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, .\ASS_dokidoki-goodend_resources\skiptutorial.png
		if (ErrorLevel = 0) {
			Send, {Right}{Enter}
			break
		}
	}
	
	;Wait until the poem composition screen is reached
	Loop {
		PixelSearch, xColour, yColour, 214, 420, 214, 420, 0xC7C7C7, 0, Fast
		if (ErrorLevel = 0) {
			break
		}
	}
	
	
	;ACT 1, POEM 2, CG 1 (Natsuki)
	;Compose poem for Natsuki
	composePoem("natsuki")
	
	;Skip through day until the 'poem showing' screen comes up.
	Send, {Ctrl down}
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_first.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
			break
		}
	}
	Loop, 3 {
		Loop {
			ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_next.png
			if (ErrorLevel = 0) {
				Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
				Sleep, 200
				break
			}
		}
	}
	
	;Skip through day until Sayori asks us who we would walk home with
	;Will pick Sayori (this choice doesn't affect anything in the game other than dialogue)
	Loop {
		ImageSearch, FoundX, FoundY, 649, 401, 1266, 526, .\ASS_dokidoki-goodend_resources\walkhomewithsayori.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
			break
		}
	}
	
	;Skip through day until the poem composition screen is reached
	Loop {
		PixelSearch, xColour, yColour, 214, 420, 214, 420, 0xC7C7C7, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	
	
	;ACT 1, POEM 3, CG 2 (Natsuki)
	;Compose poem for Natsuki
	composePoem("natsuki")
	
	;Skip through day until Natsuki CG
	Send, {Ctrl down}
	Loop {
		PixelSearch, xColour, yColour, 1169, 253, 1169, 253, 0x846B69, 2, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			loadGame(1)
			break
		}
	}
	
	;Wait until the poem composition screen is reached
	Loop {
		PixelSearch, xColour, yColour, 214, 420, 214, 420, 0xC7C7C7, 0, Fast
		if (ErrorLevel = 0) {
			break
		}
	}

	
	;ACT 1, POEM 2, CG 1 (Yuri)
	;Compose poem for Yuri
	composePoem("yuri")
	
	;Skip through day until the 'poem showing' screen comes up.
	Send, {Ctrl down}
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_first.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
			break
		}
	}
	Loop, 3 {
		Loop {
			ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_next.png
			if (ErrorLevel = 0) {
				Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
				Sleep, 200
				break
			}
		}
	}
	
	;Skip through day until Sayori asks us who we would walk home with
	;Will pick Sayori (this choice doesn't affect anything in the game other than dialogue)
	Loop {
		ImageSearch, FoundX, FoundY, 649, 401, 1266, 526, .\ASS_dokidoki-goodend_resources\walkhomewithsayori.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
			break
		}
	}
	
	;Skip through day until the poem composition screen is reached
	Loop {
		PixelSearch, xColour, yColour, 214, 420, 214, 420, 0xC7C7C7, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	
	
	;ACT 1, POEM 3, CG 2 (Yuri)
	;Compose poem for Yuri
	composePoem("yuri")
	
	;Skip through day until Yuri CG
	Send, {Ctrl down}
	Loop {
		PixelSearch, xColour, yColour, 1728, 868, 1728, 868, 0x5E404A, 2, Fast
		if (ErrorLevel = 0) {
			break
		}
	}
	
	
	;Skip through day until the 'poem showing' screen comes up.
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_first.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
			break
		}
	}
	Loop, 3 {
		Loop {
			ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_next.png
			if (ErrorLevel = 0) {
				Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
				Sleep, 200
				break
			}
		}
	}
	
	
	
	;Skip through day until we get the option of who to help with the festival
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\imgoingwith.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			saveGame(2)
			Sleep, 200
			break
		}
	}
	
	
	;ACT 1, CG 3 (Natsuki)
	Send, {Up 5}{Enter}
	
	;Skip through days until we get last Natsuki CG
	Send, {Ctrl down}
	Loop {
		PixelSearch, xColour, yColour, 350, 715, 350, 715, 0xDEEFFA, 2, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			loadGame(2)
			break
		}
	}
	
	
	;ACT 1, CG 3 (Yuri)
	Send, {Up 4}{Enter}
	
	;Skip through days until we get last Yuri CG
	Send, {Ctrl down}
	Loop {
		PixelSearch, xColour, yColour, 1142, 802, 1142, 802, 0x91A1B8, 2, Fast
		if (ErrorLevel = 0) {
			break
		}
	}
	
	
	;ACT 1, CG 3 (Sayori)
	
	;Skip through days until we get option to either cuck or confess to Sayori
	;Will pick confess, since that's the only way to get Sayori's last CG
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\sayori_confession.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 3}{Enter}{Ctrl down}
			break
		}
	}
	
	
	;ACT 1, FINAL STRETCH
	
	;Skip through rest of act until start of act 2
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, .\ASS_dokidoki-goodend_resources\new-game_act2.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	
	
	
	;START OF ACT 2
	;New Game Act 2
	Send, {Down}{Enter}
	
	;Skip through until special poem box
	Send, {Ctrl down}
	Loop {
		PixelSearch, xColour, yColour, 929, 571, 929, 571, 0xF4E6FF, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Right 2}{Enter}{Ctrl down}
			break
		}
	}
	
	;Wait until the poem composition screen is reached
	Loop {
		PixelSearch, xColour, yColour, 214, 420, 214, 420, 0xC7C7C7, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	
	;ACT 2, POEM 1
	;There tends to be a scene later on with Yuri that disrupts the flow of the entire script, however it can be avoided by composing at least one poem for Natsuki
	;I don't even care if I lose time trying to avoid the scene, I'm just getting tired of restarting the whole thing everytime RNG isn't in my favour
	;Compose poem for Natsuki
	composePoem("natsuki")
	
	;Skip through day until the 'poem showing' screen comes up.
	Send, {Ctrl down}
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_first.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
			break
		}
	}
	Loop, 2 {
		Loop {
			ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_next.png
			if (ErrorLevel = 0) {
				Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
				Sleep, 200
				break
			}
		}
	}
	
	;Skip through day until we get the option of who to back up in a glitched fight.
	;Will pick whoever gets highlighted as this option doesn't actually affect anything in the game
	Loop {
		PixelSearch, xColour, yColour, 905, 448, 905, 448, 0xF4E6FF, 2, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, .\ASS_dokidoki-goodend_resources\fight_glitched_monika.png
		if (ErrorLevel = 0) {
			Send, {Enter}
			break
		}
		Send, {Down 2}{Enter}
		Sleep, 15
	}
	Send, {Ctrl down}
	
	;Skip through day until the poem composition screen is reached
	Loop {
		PixelSearch, xColour, yColour, 214, 420, 214, 420, 0xC7C7C7, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	
	
	;ACT 2, POEM 2
	;Rush through poem composition
	composePoem("rush")
	
	;Skip through day until the 'poem showing' screen comes up.
	Send, {Ctrl down}
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_first.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
			break
		}
	}
	
	;Wait for "Please help me." box
	Loop {
		PixelSearch, xColour, yColour, 949, 516, 949, 516, 0xF4E6FF, 10, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Right}{Enter}{Ctrl down}
			break
		}
	}
	
	Loop, 2 {
		Loop {
			ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_next.png
			if (ErrorLevel = 0) {
				Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
				Sleep, 200
				break
			}
		}
	}
	
	;Skip through until special poem box
	Loop {
		PixelSearch, xColour, yColour, 929, 571, 929, 571, 0xF4E6FF, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Right 2}{Enter}{Ctrl down}
			break
		}
	}
	
	;Skip through day until the poem composition screen is reached
	Loop {
		PixelSearch, xColour, yColour, 214, 420, 214, 420, 0xC7C7C7, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	
	
	;ACT 2, POEM 3
	;There tends to be a scene here with Yuri that disrupts the flow of the script, however it can be avoided by composing at least one poem for Natsuki, which we did earlier
	;Rush through poem composition
	composePoem("rush")
	
	;Skip through day until the 'poem showing' screen comes up.
	Send, {Ctrl down}
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_first.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
			break
		}
	}
	Loop, 2 {
		Loop {
			ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\poem_next.png
			if (ErrorLevel = 0) {
				Send, {Ctrl up}{Up 2}{Enter}{Ctrl down}
				Sleep, 200
				break
			}
		}
	}
	
	;Skip through day until "Just Monika." shows up
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\just-monika.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			Send, {Up 2}{Enter}
			Sleep, 100
			Send, {Right}{Enter}
			Send, {Ctrl down}
			break
		}
	}
	
	;Wait for blank special poem box to show up
	Loop {
		PixelSearch, xColour, yColour, 929, 571, 929, 571, 0xF4E6FF, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			Send, {Right 2}{Enter}
			Sleep, 500
			break
		}
	}
	
	;Skip through day until we get the option to pick who to help with the poetry performance.
	;Will pick Monika, since she forces you to pick her even if you pick one of the other members
	Send, {Ctrl down}
	Loop {
		PixelSearch, xColour, yColour, 960, 502, 960, 502, 0xF4E6FF, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Down 3}{Enter}{Ctrl down}
			break
		}
	}
	
	;Skip through day until we get the option to either deny or confess to Yuri
	;Will pick confess since this choice affects LITERALLY nothing, not even any of the dialogue changes
	Loop {
		PixelSearch, xColour, yColour, 678, 358, 678, 358, 0xF4E6FF, 0, Fast
		if (ErrorLevel = 0) {
			Send, {Ctrl up}{Down}{Enter}{Ctrl down}
			break
		}
	}
	
	;Skip through dialogue until Yuri death scene appears
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, .\ASS_dokidoki-goodend_resources\yuri_death.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	Sleep, 500
	
	saveGame(1)
	
	;Skip through Yuri death scene via loading the save we just made
	Loop {
		PixelSearch, xColour, yColour, 542, 786, 542, 786, 0x9955BB, 0, Fast
		if (ErrorLevel = 0) {
			loadGame(1)
		} else if (ErrorLevel = 1) {
			PixelSearch, xColour, yColour, 1839, 829, 1839, 829, 0x2C3254, 10, Fast
			if (ErrorLevel = 0) {
				break
			}
		}
	}
	
	;Click through day until the start of act 3 (skip doesn't work here)
	Loop {
		ImageSearch, FoundX, FoundY, 303, 683, 1561, 1021, .\ASS_dokidoki-goodend_resources\monika_start-of-act-3.png
		if (ErrorLevel = 0) {
			break
		}
		Send, {Enter}
		Sleep, 1
		Send, {Click}
		Sleep, 15
	}
	
	
	
	;START OF ACT 3
	
	;Click through dialogue until Monika CG (skip doesn't work here either)
	Loop {
		PixelSearch, xColour, yColour, 986, 370, 986, 370, 0x2B4ACB, 10, Fast
		if (ErrorLevel = 0) {
			break
		}
		Send, {Enter}
		Sleep, 30
	}
	
	;Immediately go to windows explorer and delete her character file
	Run, %A_WinDir%\explorer.exe
	Loop {
		if WinExist("ahk_exe explorer.exe") {
			WinActivate, ahk_exe explorer.exe
			break
		}
		Sleep, 25
	}
	Sleep, 250
	Send, !d
	Send, %A_ScriptDir%\characters{Enter}
	Sleep, 500
	Loop, 2 {
		Send, {Down}
		Send, {Delete}
		Send, {F5}
		Sleep, 250
	}
	WinClose, A
	WinActivate, ahk_exe DDLC.exe
	Sleep, 100
	
	;Click through the "I still love you, no matter what" dialogue with Monika while waiting for act 4 main menu
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, .\ASS_dokidoki-goodend_resources\new-game_act1.png
		if (ErrorLevel = 0) {
			break
		}
		Send, {Enter}
		Sleep, 30
	}
	
	
	
	;START OF ACT 4
	;Welcome to the final act, it is here that the game reveals that the status of club president makes you aware that you're in a video game
	
	;New Game Act 4
	Send, {Down}{Enter}
	
	;Skip through act until skip button gets disabled
	Send, {Ctrl down}
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\sayori-ehehe_act4.png
		if (ErrorLevel = 0) {
			Send, {Ctrl up}
			break
		}
	}
	
	;Click through act until start of credits
	Loop {
		ImageSearch, FoundX, FoundY, 404, 823, 1240, 1003, .\ASS_dokidoki-goodend_resources\sayori-we-all-love-you_act4.png
		if (ErrorLevel = 0) {
			Send, {Enter 2}
			break
		}
		Send, {Enter}
		Sleep, 50
	}
	
	;Stop Timer
	Send, {Numpad1}
	
	ExitApp
	
	;GOOD JOB, YOU SPENT 5 DAYS WORKING ON THIS SCRIPT, ONLY TO GET ABSOLUTE JACK-SHIT IN THE END. HOPE YOU'RE PROUD OF YOURSELF, DUCK.
	;
	
return

;Emergency exit in case the script goes wild and starts doing things that I don't want it to do
[::
	ExitApp
return
