@tool 
extends EditorPlugin

const AUTOLOAD_NAME = 'EvrstUidGen' # EDITED BY UNITEDCATDOM

func _enable_plugin() -> void:
  add_autoload_singleton(AUTOLOAD_NAME, 'res://addons/uuid/uuid.gd')

func _disable_plugin() -> void:
  remove_autoload_singleton(AUTOLOAD_NAME)
