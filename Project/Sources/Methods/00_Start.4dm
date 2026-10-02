//%attributes = {}
#DECLARE($params : Object)

var $splashWindowTitle : Text
$splashWindowTitle:=""

If (Count parameters:C259=0)
	
	var $dataClass; $project; $path : Text
	For each ($dataClass; ds:C1482)
		If (ds:C1482[$dataClass].getCount()=0)
			$path:=File:C1566("/RESOURCES/"+$dataClass+".4ie").platformPath
			If (Test path name:C476($path)=Is a document:K24:1)
				$project:=File:C1566("/RESOURCES/"+$dataClass+".4si").getText()
				IMPORT DATA:C665($path; $project)
			End if 
		End if 
	End for each 
	
	ARRAY LONGINT($windows; 0)
	WINDOW LIST($windows)
	
	var $i; $window; $x; $y; $right; $bottom : Integer
	For ($i; 1; Size of array($windows))
		$window:=$windows{$i}
		If (Window process($window)=1) && (Get window title($window)=$splashWindowTitle)
			GET WINDOW RECT($x; $y; $right; $bottom; $window)
			CALL FORM($window; Formula(SET WINDOW RECT($x; $y; $right; $bottom; $window)))
			return 
		End if 
	End for 
	
	CALL WORKER(1; Current method name:C684; {})
	
Else 
	
	SET MENU BAR(1)
	
	var $options : Object
	$options:=New object:C1471
	$options.title:=Localized string("HDI_Title")
	$options.blog:="blog.4d.com"
	$options.info:=Localized string("HDI_Info")  //ex : "4D View Pro feature"
	$options.minimumVersion:="1700"
	//$options.license:=4D Write license  // IF ANY NEEDED
	
	// THE BACKGROUND PICTURE IS IN THE RESOURCES : Resources/Images/HDIabout.png
	// the picture size is 724 * 364
	
	$window:=Open form window:C675("HDI"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	SET WINDOW TITLE($splashWindowTitle; $window)
	DIALOG:C40("HDI"; $options; *)
	
End if 
