extends Node

var mnt: String = "res://evfs"
var root: String = "/"

# func resolvePath(path: String) -> String:
#     print("Resolving path:\n%s" % path)
#     # Split path into individual parts
#     var arr: Array[String]
#     arr.assign(path.split("/"))
#     arr.reverse()
    
#     # Loop
#     while arr.has(".."):
#         if arr.has(".."):
#             var i: int = arr.find("..")
#             for x in range(i+2):
#                 arr.pop_front()
#         else:
#             break
#         await get_tree().process_frame
    
#     arr.reverse()
#     var rpath: String = "/".join(arr)
    
#     return rpath

func resolvePath(_root: String, input_path: String) -> String:
	var parts = []
	var path = input_path
	
	# Jeśli ścieżka nie zaczyna się od "/", to traktujemy ją jako względną do root
	if not path.begins_with("/"):
		path = _root.rstrip("/") + "/" + path
	
	# Podziel na segmenty
	var segments = path.split("/")
	
	for segment in segments:
		match segment:
			"", ".":
				continue # ignorujemy puste i "." bo są bez znaczenia
			"..":
				if parts.size() > 0:
					parts.pop_back()
				else:
					# Jeśli jesteśmy w root i ktoś próbuje cofnąć wyżej, to ignorujemy
					continue
			_:
				parts.append(segment)
	
	return "/" + "/".join(parts)
