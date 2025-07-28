extends Node
class_name EvrstProcessCore

# Process List
var pl: Dictionary[String, EvrstProcess] = {}

func GenPid() -> String:
    return EvrstUidGen.as_string()


func RegisterProcess(proc: EvrstProcess) -> int:
    var err: int = OK
    if not pl.has(proc.pid):
        pl[proc.pid] = proc
    else:
        err = ERR_ALREADY_EXISTS
    
    return err

func KillProcess(pid: String) -> int:
    var err: int = OK
    if pl.has(pid):
        pl.erase(pid)
    else:
        err = ERR_DOES_NOT_EXIST
    
    return err
