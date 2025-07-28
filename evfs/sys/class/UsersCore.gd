extends Node
class_name EvrstUsersCore

func addUser(usrName: String, usrDisplayName: String) -> EvrstUser:
    var usr := EvrstUser.new(usrName, usrDisplayName, "")
    return usr