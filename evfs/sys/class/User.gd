extends Node
class_name EvrstUser

var displayName: String
var uname: String
var uid: String
var permissionLevel: int
var passwordHash: String

var PATH_DIR_ROOT: String       = ""
var PATH_DIR_DOWNLOADS: String  = ""
var PATH_DIR_DOCUMENTS: String  = ""
var PATH_DIR_IMAGES: String     = ""
var PATH_DIR_VIDEOS: String     = ""
var PATH_DIR_MUSIC: String      = ""
var PATH_DIR_CONFIG: String     = ""
var PATH_DIR_APPDATA: String    = ""

func _init(usrName: String, usrDisplayName: String, passwd: String, systemUsr: bool = false) -> void:
    uname = usrName.to_lower()
    displayName = usrDisplayName
    passwordHash = passwd.sha256_text()
    uid = EvrstUidGen.as_string()
    permissionLevel = EvrstPermissionLevel.USER
    PATH_DIR_ROOT = "/usr/data/%s/" % uname

    if systemUsr:
        permissionLevel = EvrstPermissionLevel.SYSTEM
        PATH_DIR_ROOT = "/"