extends VBoxContainer
class_name EvrstShellUiSession

var shell: EvrstShellInstance
var node: VBoxContainer

var output: RichTextLabel = null
var inputPath: Label = null
var inputUser: Label = null
var inputCmd: LineEdit = null

func _init(shellInstance: EvrstShellInstance) -> void:
    var scn: PackedScene = load("res://evfs/sys/shell/ui/shell.tscn")
    var ses := scn.instantiate()
    ses.set_script(self)

    output = ses.get_node("output")
    inputPath = ses.get_node("input/path")
    inputUser = ses.get_node("input/user")
    inputCmd = ses.get_node("input/cmd")
    
    shell = shellInstance

    inputPath.text = shell.cwd
    inputUser.text = shell.host.uname

    inputCmd.text_submitted.connect(commandInput)

    shell.RETURN_OUTPUT.connect(writeToOutput)

    node = ses


func writeToOutput(line: String):
    output.text = "%s\n%s" % [output.text, line]

func commandInput(cmd: String):
    inputCmd.text = ""
    writeToOutput(
        "[color=41aa3c]%s[/color]> %s" % [shell.host.uname, cmd]
    )
    shell.executeCommand(cmd)

    inputCmd.grab_focus.call_deferred()
