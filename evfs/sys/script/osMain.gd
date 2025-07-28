extends Node

var sysUsr: EvrstUser

func _ready() -> void:
    EvrstSysApi.TreeMain = get_tree()

    sysUsr = EvrstUser.new("sys", "SYSTEM", "", true)

    $"tty".createTtyInstance(sysUsr)