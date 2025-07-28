extends Control

func createTtyInstance(usr: EvrstUser) -> void:
    var shell := EvrstShellInstance.new(usr, usr.PATH_DIR_ROOT)
    var sess := EvrstShellUiSession.new(shell)

    self.add_child(sess.node)