extends Node
class_name EvrstShellInstance

var cwd: String = "/"
var command_history: Array[String] = []
var host: EvrstUser

func _init(_host: EvrstUser, path: String = "/") -> void:
    cwd = path
    host = _host


signal RETURN_OUTPUT(line: String)

func executeCommand(cmd: String):
    var argv: Array = parseCommand(cmd)

    var exec: String = argv[0]
    argv.pop_front()

func parseCommand(line: String) -> Array:
    var in_quotes = false
    var current = ""
    var args = []

    for i in line.length():
        var char = line[i]
        
        if char == '"':
            in_quotes = not in_quotes
            continue
        
        if char == " " and not in_quotes:
            if current != "":
                args.append(_auto_cast(current))
                current = ""
        else:
            current += char

    if current != "":
        args.append(_auto_cast(current))

    return args

# Arg Type Check
func _auto_cast(value: String) -> Variant:
    # Boolean
    if value == "true":
        return true
    elif value == "false":
        return false

    # Int
    if value.is_valid_int():
        return int(value)

    # Float
    if value.is_valid_float():
        return float(value)

    # Default String
    return value
