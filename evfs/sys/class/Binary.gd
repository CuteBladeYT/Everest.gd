extends Node
class_name EvrstBinary

var path: String
var proc: EvrstProcess
var exec: Node
var execgd: GDScript
var powner: EvrstUser

var err_code: int = OK

signal BIN_SHELL_OUTPUT(text: String)
signal EXIT(code: int)

func _init(bin_path: String, argv: Array, _owner: EvrstUser) -> void:
    # Fail when file isn't a valid GDScript
    if not bin_path.ends_with(".gd"):
        return

    # Godot Path
    var gdp: String = EvrstFileSys._getGdPath(bin_path)
    execgd = load(gdp)
    exec = execgd.new()
    

    path = bin_path
    proc = EvrstProcess.new(exec, _owner)
    powner = _owner

    exec.set("_bin", self)
    exec.set("argv", argv)
    exec.call_deferred("init")


func terminate() -> int:
    proc.Kill()
    EXIT.emit(err_code)
    return err_code
