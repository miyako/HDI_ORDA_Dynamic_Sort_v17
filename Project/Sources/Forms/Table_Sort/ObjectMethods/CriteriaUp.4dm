
If (btnTrace)
	TRACE:C157
End if 

If (Form:C1466.selectedCriteriaIndex>=2)
	
	Form:C1466.criteriaList.insert(Form:C1466.selectedCriteriaIndex-2; Form:C1466.selectedCriteria)
	Form:C1466.criteriaList.remove(Form:C1466.selectedCriteriaIndex; 1)
	
	LISTBOX SELECT ROW:C912(*; "listBoxCriterias"; Form:C1466.selectedCriteriaIndex-1; lk replace selection:K53:1)
	
	Form:C1466.criteriaList:=Form:C1466.criteriaList
	
End if 


