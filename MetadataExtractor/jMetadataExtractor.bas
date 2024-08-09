B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.8
@EndOfDesignText@
Sub Class_Globals
    Private jo As JavaObject
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(path As String)
	Dim fileJO As JavaObject
	fileJO.InitializeNewInstance("java.io.File",Array(path))
	jo = jo.InitializeStatic("com.drew.imaging.ImageMetadataReader").RunMethod("readMetadata",Array(fileJO))
End Sub

Public Sub getDirectories As List
	Dim dirs As List
	dirs.Initialize
	Dim iterable As List = jo.RunMethod("getDirectories",Null)
	For Each dir As JavaObject In iterable
		dirs.Add(dir)
	Next
	Return dirs
End Sub

Public Sub readMetadata
	Log(jo)
End Sub