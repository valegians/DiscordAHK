Items := []
Shop := "shop name here"

Loop Read, %1%			;specify file name as command line argument
{
	subarray := StrSplit(A_LoopReadLine, "csv")
	Items.Insert(subarray)
}
MsgBox Done reading %1%

Loop
{
	;infinite loop, until F1 is pressed
}

StrSplit(InputVar, Delimiter="", OmitChars="") 
{
	array := []
	Loop Parse, InputVar, %Delimiter%, %OmitChars%
		array.Insert(A_LoopField)
	return array
}

TypeWords:
	Loop % Items.MaxIndex() 
	{
		SendRaw ?delete_item "
		SendInput % Items[A_index][1]
		SendRaw "
		SendInput {SPACE}
		SendRaw  "
		SendInput % shop
		SendRaw "
		SendInput {Enter}
		Sleep 1000
		SendRaw ?add_item "
		SendInput % Items[A_index][1]
		SendRaw "
		SendInput {SPACE}
		SendInput % Items[A_index][2]
		SendInput {SPACE}  
		SendInput % Items[A_index][3] 
		SendInput {SPACE}
		SendRaw  "
		SendInput % shop
		SendRaw "
		SendInput {Enter}
		Sleep 1000
	}
	return

F1:: gosub TypeWords		;start typing
F2::Pause, Toggle
return
F3::ExitApp
