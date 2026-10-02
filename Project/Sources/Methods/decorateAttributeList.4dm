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

C_OBJECT:C1216($attribute; $0; $1; $result)

If (btnTrace)
	TRACE:C157
End if 

$attribute:=$1

Case of 
		
	: ($attribute.kind="relatedEntity")
		$result:=New object:C1471("fontWeight"; "bold")
		
End case 

$0:=$result



