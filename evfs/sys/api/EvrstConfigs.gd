extends Node

const configDir: String = "/cfg/"
const userConfigDir: String = "/usr/data/%s/cfg/"

func ReadDefaultConfig(configFile: String) -> Dictionary:
    # File Content
    var fc: String = EvrstFileSys.readFile(configDir + configFile + ".json")
    var conf: Dictionary = JSON.parse_string(fc)
    return conf

func ReadUserConfig(user: EvrstUser, configFile: String) -> Dictionary:
    # File Content
    var fc: String = EvrstFileSys.readFile(
        userConfigDir % user.uname + 
        configFile + ".json"
    )
    var conf: Dictionary = JSON.parse_string(fc)
    return conf