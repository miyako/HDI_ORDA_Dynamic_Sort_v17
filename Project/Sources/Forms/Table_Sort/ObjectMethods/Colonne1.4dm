
If (btnTrace)
	TRACE:C157
End if 

If (Form event code:C388=On Clicked:K2:4)
	
	If (Form:C1466.selectedCriteria#Null:C1517)
		
		//Change the sort order
		Form:C1466.selectedCriteria.criteriaDesc:=Not:C34(Form:C1466.selectedCriteria.criteriaDesc)
		Form:C1466.selectedCriteria.criteriaPict:=Choose:C955(Num:C11(Form:C1466.selectedCriteria.criteriaDesc); Form:C1466.pictAsc; Form:C1466.pictDesc)
		
		Form:C1466.criteriaList:=Form:C1466.criteriaList
		
	End if 
	
End if 