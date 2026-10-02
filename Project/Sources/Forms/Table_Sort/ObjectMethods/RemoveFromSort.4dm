
var $obj : Object


If (btnTrace)
	TRACE:C157
End if 


//Move criteria to attribute list
$obj:=Form:C1466.selectedCriteria

Form:C1466.attributeList.push($obj)
LISTBOX SELECT ROW:C912(*; "listBoxAttributes"; 0; lk remove from selection:K53:3)

//Display a related entity before its storage attributes
//Gather a related entity with its attributes
Form:C1466.attributeList:=Form:C1466.attributeList.orderBy("relatedDataClass")

Form:C1466.criteriaList.remove(Form:C1466.selectedCriteriaIndex-1; 1)

//Select the next attribute in the criteria list
Case of 
	: (Form:C1466.criteriaList.length=0)
		LISTBOX SELECT ROW:C912(*; "listBoxCriterias"; 0; lk remove from selection:K53:3)
		
	: (Form:C1466.selectedCriteriaIndex<=Form:C1466.criteriaList.length)
		LISTBOX SELECT ROW:C912(*; "listBoxCriterias"; Form:C1466.selectedCriteriaIndex; lk replace selection:K53:1)
		
	: (Form:C1466.selectedCriteriaIndex>Form:C1466.criteriaList.length)
		LISTBOX SELECT ROW:C912(*; "listBoxCriterias"; 1; lk replace selection:K53:1)
End case 

Form:C1466.criteriaList:=Form:C1466.criteriaList


//Disable Sort buttons if the criteria list is empty
If (Form:C1466.criteriaList.length=0)
	OBJECT SET ENABLED:C1123(*; "RemoveFromSort"; False:C215)
	OBJECT SET ENABLED:C1123(*; "CriteriaUp"; False:C215)
	OBJECT SET ENABLED:C1123(*; "CriteriaDown"; False:C215)
	OBJECT SET ENABLED:C1123(*; "SortButton"; False:C215)
End if 
