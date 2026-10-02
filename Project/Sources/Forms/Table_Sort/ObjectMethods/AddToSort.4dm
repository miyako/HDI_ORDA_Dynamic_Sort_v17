
var $obj : Object
var $index : Integer
var $exit : Boolean


If (btnTrace)
	TRACE:C157
End if 

//Move the selected attribute to the criteria list (Form.criteriaList)
$obj:=Form:C1466.selectedAttribute
//Sort order is False by default
$obj.criteriaDesc:=False:C215
$obj.criteriaPict:=Choose:C955(Num:C11($obj.criteriaDesc); Form:C1466.pictAsc; Form:C1466.pictDesc)

Form:C1466.criteriaList.push($obj)

Form:C1466.criteriaList:=Form:C1466.criteriaList

Form:C1466.attributeList.remove(Form:C1466.selectedAttributeIndex-1; 1)


Case of 
	: (Form:C1466.attributeList.length=0)
		//No more attributes to be selected
		LISTBOX SELECT ROW:C912(*; "listBoxAttributes"; 0; lk remove from selection:K53:3)
		
		
		//Search and select the next attribute with kind = "storage" from the current selection position in the collection Form.attributeList
	: (Form:C1466.selectedAttributeIndex<=Form:C1466.attributeList.length)
		
		$index:=Form:C1466.attributeList.findIndex(Form:C1466.selectedAttributeIndex-1; "findStorage"; "storage")
		
		If (Not:C34($index=-1))
			LISTBOX SELECT ROW:C912(*; "listBoxAttributes"; $index+1; lk replace selection:K53:1)
			
		Else 
			//Search and select the next attribute with kind = "storage" from the begining of the collection Form.attributeList
			$index:=Form:C1466.attributeList.findIndex("findStorage"; "storage")
			
			If (Not:C34($index=-1))
				LISTBOX SELECT ROW:C912(*; "listBoxAttributes"; $index+1; lk replace selection:K53:1)
			Else 
				//No more attributes to be selected
				LISTBOX SELECT ROW:C912(*; "listBoxAttributes"; 0; lk remove from selection:K53:3)
			End if 
		End if 
		
		
		//Search and select the next attribute with kind = "storage" starting from the beginning of the collection Form.attributeList
	: (Form:C1466.selectedAttributeIndex>Form:C1466.attributeList.length)
		LISTBOX SELECT ROW:C912(*; "listBoxAttributes"; 1; lk replace selection:K53:1)
		
		If (Form:C1466.selectedAttribute.kind="relatedEntity")
			$exit:=False:C215
			Repeat 
				LISTBOX SELECT ROW:C912(*; "listBoxAttributes"; Form:C1466.selectedAttributeIndex+1; lk replace selection:K53:1)
				
				Case of 
					: (Form:C1466.selectedAttributeIndex>Form:C1466.attributeList.length)
						$exit:=True:C214
						//No more attributes to be selected
						LISTBOX SELECT ROW:C912(*; "listBoxAttributes"; 0; lk remove from selection:K53:3)
						
					: ((Form:C1466.selectedAttribute.kind="storage") & (Form:C1466.selectedAttributeIndex<=Form:C1466.attributeList.length))
						$exit:=True:C214
				End case 
				
			Until ($exit)
		End if 
		
End case 


Form:C1466.attributeList:=Form:C1466.attributeList

//Check if there are still storage attributes to add to the criteria list
$index:=Form:C1466.attributeList.findIndex("findStorage"; "storage")
OBJECT SET ENABLED:C1123(*; "AddToSort"; ((Form:C1466.attributeList.length#0) & (Not:C34($index=-1))))

//Sort button is available if there are objects in the criteria list
OBJECT SET ENABLED:C1123(*; "SortButton"; Form:C1466.criteriaList.length#0)