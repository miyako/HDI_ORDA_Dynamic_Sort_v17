
C_BOOLEAN:C305(btnTrace)

C_OBJECT:C1216($dataClass; $dataClassAttribute; $relatedDataClass; $relatedDataClassAttribute; $attribute)

C_LONGINT:C283($lastColumn; $defaultFieldType; $numberOfColumns)

C_TEXT:C284($dataClassName; $attributeName; $relatedDataClassAttributeName; $colName; $colTitle; $colFormula; $path; $attributeName)

C_PICTURE:C286($pict)

C_POINTER:C301($ptr)


If (btnTrace)
	TRACE:C157
End if 

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		$dataClassName:=Form:C1466.dataClassName
		
		//Delete current listBox
		$numberOfColumns:=LISTBOX Get number of columns:C831(*; "listBoxItems")
		LISTBOX DELETE COLUMN:C830(*; "listBoxItems"; 1; $numberOfColumns)
		
		
		//Draw list box dynamically according to the dataClass's attributes - Using ORDA
		// $dataClass is the dataClass with name $dataClassName
		$dataClass:=ds:C1482[$dataClassName]
		$lastColumn:=1
		$defaultFieldType:=Is text:K8:3
		
		For each ($attributeName; $dataClass)
			
			//$attributeName is the attribute name in the dataClass $dataClass
			//$dataClassAttribute is the dataClass attribute - It is an Object
			$dataClassAttribute:=$dataClass[$attributeName]
			
			Case of 
					//Display the attributes with kind storage as is
				: ($dataClassAttribute.kind="storage")
					LISTBOX INSERT COLUMN FORMULA:C970(*; "listBoxItems"; $lastColumn; $attributeName; "This."+$attributeName; $defaultFieldType; "Header"+String:C10($lastColumn); $ptr)
					OBJECT SET TITLE:C194(*; "Header"+String:C10($lastColumn); $attributeName)
					$lastColumn:=$lastColumn+1
					
					
					//For attributes with kind relatedEntity, we display each attribute of the relatedDataClass with kind storage  --> for example: state.name or school.email
				: ($dataClassAttribute.kind="relatedEntity")
					
					//$relatedDataClass is the related dataClass - It is an Object
					$relatedDataClass:=ds:C1482[$dataClassAttribute.relatedDataClass]
					
					For each ($relatedDataClassAttributeName; $relatedDataClass)
						
						//$relatedDataClassAttributeName is the related dataClass attribute name
						//$relatedDataClassAttribute is the related dataClass attribute - It is an Object
						$relatedDataClassAttribute:=$relatedDataClass[$relatedDataClassAttributeName]
						
						If ($relatedDataClassAttribute.kind="storage")
							$colName:=$dataClassAttribute.relatedDataClass+"_"+$relatedDataClassAttributeName
							$colTitle:=$attributeName+"."+$relatedDataClassAttributeName  // for example: state.name or school.email
							$colFormula:="This."+$colTitle
							
							LISTBOX INSERT COLUMN FORMULA:C970(*; "listBoxItems"; $lastColumn; $colName; $colFormula; $defaultFieldType; "Header"+String:C10($lastColumn); $ptr)
							OBJECT SET TITLE:C194(*; "Header"+String:C10($lastColumn); $colTitle)
							$lastColumn:=$lastColumn+1
						End if 
					End for each 
					
			End case 
			
		End for each 
		
		
		Form:C1466.attributeList:=New collection:C1472
		Form:C1466.criteriaList:=New collection:C1472
		
		//Get all the dataClass's records to fill the listBox
		Form:C1466.items:=$dataClass.all()
		
		
		//Build the attribute list box
		For each ($attributeName; $dataClass)
			
			//$attributeName is the attribute name in the dataClass $dataClass
			$dataClassAttribute:=$dataClass[$attributeName]
			
			If ($dataClassAttribute.kind="storage")
				$attribute:=New object:C1471
				$attribute.name:=$attributeName
				$attribute.kind:=$dataClassAttribute.kind
				$attribute.nameForSort:=$attributeName
				Form:C1466.attributeList.push($attribute)
			End if 
			
			//For a related entity, we diplay only the name of the related entity ($attributeName)
			If ($dataClassAttribute.kind="relatedEntity")
				$attribute:=New object:C1471
				$attribute.name:=$attributeName
				$attribute.kind:=$dataClassAttribute.kind
				$attribute.relatedDataClass:=$dataClassAttribute.relatedDataClass
				$attribute.expanded:=False:C215
				Form:C1466.attributeList.push($attribute)
			End if 
			
		End for each 
		
		//--------------------------------------------
		// Attributes of objects in Form.attributeList
		//---------------------------------------------
		// name: to be displayed in the list box listBoxAttributes - It is an attribute name or the name of the related entity
		//
		// kind: value is "storage" or "relatedEntity" - Used to expand attributes for a relatedEntity and to display in bold the name of the relatedEntity
		//
		// nameForSort: criteria value displayed in the listBox listBoxCriterias - Used to sort the entity selection - Example: email, name, state.name, school.name
		//
		// relatedDataClass: used to sort the collection Form.attributeList to gather a relatedEntity with its expanded attibutes - Example: School, State
		// 
		// expanded: only if kind is "relatedEntity" - Used to expand the attributes of a relatedEntity
		//
		//---------------------------------------------
		
		//For related entity
		//Sort to display the storage attributes after their relatedDataClass
		Form:C1466.attributeList:=Form:C1466.attributeList.orderBy("relatedDataClass")
		
		//Sort icons
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"Pictures"+Folder separator:K24:12
		READ PICTURE FILE:C678($path+"ArrowUp.png"; $pict)
		Form:C1466.pictAsc:=$pict
		READ PICTURE FILE:C678($path+"ArrowDown.png"; $pict)
		Form:C1466.pictDesc:=$pict
		
		disableSortButtons
		
		
End case 