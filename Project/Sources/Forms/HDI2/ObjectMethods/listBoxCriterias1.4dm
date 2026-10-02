
C_LONGINT:C283($win)

C_OBJECT:C1216($formData)

If (btnTrace)
	TRACE:C157
End if 


Case of 
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.selectedDataClass#Null:C1517)
			
			$formData:=New object:C1471
			$formData.dataClassName:=Form:C1466.selectedDataClass.name
			
			$win:=Open form window:C675("Table_Sort"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
			DIALOG:C40("Table_Sort"; $formData)
			CLOSE WINDOW:C154
			
		End if 
		
End case 