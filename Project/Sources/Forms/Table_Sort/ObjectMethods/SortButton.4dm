var $orderCollection : Collection
var $orderedEntitySel : Object


If (btnTrace)
	TRACE:C157
End if 

If (Form:C1466.criteriaList.length>0)
	
	$orderCollection:=Form:C1466.criteriaList.extract("nameForSort"; "propertyPath"; "criteriaDesc"; "descending")
	
	//Sort the entity selection Form.items
	$orderedEntitySel:=Form:C1466.items.orderBy($orderCollection)
	
	Form:C1466.items:=$orderedEntitySel
	
End if 

