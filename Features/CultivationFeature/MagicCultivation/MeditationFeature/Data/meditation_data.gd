extends Node
class_name Meditation_Data

var meditation_idle : int = 100



var Tranquility : Dictionary = {
	"Name" : "Tranquility",
	"Level" : 0,
	"Description" : "To achieve inner tranquility when cultivation",
	"Idle" : meditation_idle, 
}


var Second : Dictionary = {
	"Name" : "Second",
	"Level" : 0,
	"Description" : "To achieve inner tranquility when cultivation",
	"Idle" : meditation_idle,
}


var Dict_Meditation_Data : Dictionary = {
	0 : Tranquility,
	1 : Second,
}
