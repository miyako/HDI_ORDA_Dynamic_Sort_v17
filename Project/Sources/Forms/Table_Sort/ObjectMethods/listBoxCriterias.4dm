

If (btnTrace)
	TRACE:C157
End if 

OBJECT SET ENABLED:C1123(*; "RemoveFromSort"; False:C215)
OBJECT SET ENABLED:C1123(*; "CriteriaUp"; False:C215)
OBJECT SET ENABLED:C1123(*; "CriteriaDown"; False:C215)

Case of 
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.selectedCriteria#Null:C1517)
			OBJECT SET ENABLED:C1123(*; "RemoveFromSort"; True:C214)
			OBJECT SET ENABLED:C1123(*; "CriteriaUp"; True:C214)
			OBJECT SET ENABLED:C1123(*; "CriteriaDown"; True:C214)
			
		End if 
		
End case 