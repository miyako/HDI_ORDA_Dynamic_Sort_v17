C_BOOLEAN:C305(btnTrace)

C_OBJECT:C1216($dataClassObj)

C_TEXT:C284($dataClassName)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_Descriptions; 0)
		
		READ ONLY:C145([INFO:6])
		
		QUERY:C277([INFO:6]; [INFO:6]PageNumber:2; "="; 1)
		ORDER BY:C49([INFO:6]; [INFO:6]PageNumber:2; >)
		SELECTION TO ARRAY:C260([INFO:6]Description:4; _Descriptions)
		
		
		If (Is Windows:C1573)
			ST SET ATTRIBUTES:C1093(_Descriptions{1}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 14)
			
		End if 
		
		If (Is macOS:C1572)
			ST SET ATTRIBUTES:C1093(_Descriptions{1}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 18)
		End if 
		
		
		//Begin ORDA logic
		Form:C1466.dataClassList:=New collection:C1472
		
		For each ($dataClassName; ds:C1482)
			$dataClassObj:=New object:C1471
			$dataClassObj.name:=$dataClassName
			Form:C1466.dataClassList.push($dataClassObj)
			
		End for each 
		
		btnTrace:=False:C215
		RW
		
End case 