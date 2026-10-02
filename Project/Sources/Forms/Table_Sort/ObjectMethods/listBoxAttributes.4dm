

If (btnTrace)
	TRACE:C157
End if 

OBJECT SET ENABLED:C1123(*; "AddToSort"; False:C215)

Case of 
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.selectedAttribute#Null:C1517)
			If (Form:C1466.selectedAttribute.kind="storage")
				OBJECT SET ENABLED:C1123(*; "AddToSort"; True:C214)
			End if 
		End if 
		
		
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Form:C1466.selectedAttribute#Null:C1517)
			If (Form:C1466.selectedAttribute.kind="relatedEntity")
				
				//Display the attributes (with kind "storage") of the related entity
				expandRelatedDataClass(Form:C1466.selectedAttribute)
				
				//Sort to display the related entity before its storage attributes
				//Gather a related entity with its attributes
				Form:C1466.attributeList:=Form:C1466.attributeList.orderBy("relatedDataClass")
			End if 
		End if 
		
End case 