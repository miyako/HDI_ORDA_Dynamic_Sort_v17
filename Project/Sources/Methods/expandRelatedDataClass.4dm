//%attributes = {"invisible":true}

#DECLARE($selectedAttribute : Object)

var $relatedDataClass; $attribute; $relatedDataClassAttribute : Object
var $relatedDataClassAttributeName : Text

//---------------------------------------------------------------------------------------------------------------------------------------------------------
// Attributes of objects in Form.attributeList
//---------------------------------------------------------------------------------------------------------------------------------------------------------
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
//---------------------------------------------------------------------------------------------------------------------------------------------------------

Case of 
	: (Not:C34($selectedAttribute.expanded))
		
		
		//Display the attributes (of the related entity) with kind "storage"
		//Get the dataClass
		$relatedDataClass:=ds:C1482[$selectedAttribute.relatedDataClass]
		
		For each ($relatedDataClassAttributeName; $relatedDataClass)
			
			$relatedDataClassAttribute:=$relatedDataClass[$relatedDataClassAttributeName]
			
			If ($relatedDataClassAttribute.kind="storage")
				$attribute:=New object:C1471
				$attribute.name:=".    "+$relatedDataClassAttributeName
				$attribute.kind:=$relatedDataClassAttribute.kind
				$attribute.nameForSort:=$selectedAttribute.name+"."+$relatedDataClassAttributeName
				
				// "1" is added to display a related entity before its attributes in the listBox listBoxAttributes
				$attribute.relatedDataClass:=$selectedAttribute.relatedDataClass+"1"
				Form:C1466.attributeList.push($attribute)
			End if 
			
			//Once attributes have been expanded, they remain expanded
			Form:C1466.selectedAttribute.expanded:=True:C214
			
		End for each 
		
End case 