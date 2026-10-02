//%attributes = {"invisible":true}
//****************************************//
// Meta attribute
//
// fill: CSS color
// stroke: CSS color
// fontStyle:  "italic" 
// fontWeight: "bold" 
// textDecoration:  "underline"
// unselectable:  True or False 
// disabled:  True or False 
//****************************************//

#DECLARE($attribute : Object)->$result : Object

If (btnTrace)
	TRACE:C157
End if 

Case of 
		
	: ($attribute.kind="relatedEntity")
		$result:=New object:C1471("fontWeight"; "bold")
		
End case 
