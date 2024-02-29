extends Node
var TimeField = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 500:
		print("Time taken on ",i,":",TimeTest(i,i,i,i),",")
	
	# print(TimeField)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func IncrementField ():
	pass

func InitializeTimeField (SizeX,SizeY,SizeZ,StartValue):
	for ix in SizeX:
		for iy in SizeY:
			for iz in SizeZ:
				TimeField[Vector3(ix,iy,iz)] = StartValue

func TimeTest (x,y,z,v):
	var T1 = Time.get_unix_time_from_system()
	InitializeTimeField(x,y,z,v)
	var T2 = Time.get_unix_time_from_system()
	var TimeElapsed = T2 - T1
	return TimeElapsed
