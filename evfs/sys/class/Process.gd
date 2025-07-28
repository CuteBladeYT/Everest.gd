extends Node
class_name EvrstProcess

var pid: String
var exec: Node
var powner
var permission: int = EvrstPermissionLevel.USER

func _init(_exec: Node, _owner: EvrstUser) -> void:
    pid = EvrstSysApi.ProcessCore.GenPid()
    exec = _exec
    powner = _owner
    permission = _owner.permissionLevel
    EvrstSysApi.ProcessCore.RegisterProcess(self)

func Kill() -> int:
    return EvrstSysApi.ProcessCore.KillProcess(pid)