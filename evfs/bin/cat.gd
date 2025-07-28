extends Node

var _bin: EvrstBinary
var argv: Array = []

func init() -> void:
    var fc: String = EvrstFileSys.readFile(argv[0])
    _bin.BIN_SHELL_OUTPUT.emit(fc)
