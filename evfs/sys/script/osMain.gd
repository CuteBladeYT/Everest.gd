extends Node

var sysUsr: EvrstUser

func _ready() -> void:
    sysUsr = EvrstUser.new("sys", "SYSTEM", "", true)

    $"tty".createTtyInstance(sysUsr)