extends Node
class_name EvrstShellInstance

var cwd: String = "/"
var command_history: Array[String] = []
var host: EvrstUser

func _init(_host: EvrstUser, path: String = "/") -> void:
    cwd = path
    host = _host


signal RETURN_OUTPUT(line: String)
signal TASK_FINISHED()

func executeCommand(cmd: String):
    var argv: Array = parseCommand(cmd)

    var exec: String = argv[0]
    argv.pop_front()
    var _cwd: String = cwd
    if not _cwd.ends_with("/"):
        _cwd = "%s/" % cwd

    var bin: EvrstBinary
    var binPath: String
    var _binFound: bool = false

    var exec_ext: String = exec + ".gd"

    if exec.begins_with("./"):
        var x: String = exec_ext.substr(2)
        if EvrstFileSys.readDir(cwd).has(x):
            binPath = _cwd + x
            _binFound = true
    elif exec.begins_with("/"):
        binPath = exec_ext
        _binFound = true
    else:
        if EvrstFileSys.readDir("/bin/").has(exec_ext):
            binPath = "/bin/" + exec_ext
            _binFound = true
    
    if not _binFound:
        RETURN_OUTPUT.emit("Binary not found!")
        TASK_FINISHED.emit()
        return
    
    bin = EvrstBinary.new(binPath, argv, host)
    
    bin.BIN_SHELL_OUTPUT.connect(
        RETURN_OUTPUT.emit
    )
    bin.EXIT.connect(
        TASK_FINISHED.emit
    )

            

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
