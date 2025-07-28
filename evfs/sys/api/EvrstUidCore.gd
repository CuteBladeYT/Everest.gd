extends Node

# enum SCOPE {
#     EvrstProcess = 0,
#     EvrstUser = 1,
# }

# SCOPE SIZE EXPLANATION:
# - Usage: "int-int"
# Splits into two sections: [0] & [1]
# - [0] is the size of a single chunk
# - [1] is the amount of chunks
# 
# example:
# "4-6" = "XXXX-XXXX-XXXX-XXXX-XXXX-XXXX"
# var _SCOPE_SIZE: Dictionary[SCOPE, String] = {
#     SCOPE.EvrstProcess: "4-1",
#     SCOPE.EvrstUser:    "6-2",
# }

# func GenerateUid(scope: SCOPE) -> EvrstUid:
#     # SCOPE SIZE
#     var ss: Array[String] = _SCOPE_SIZE[scope].split("-")

#     # Chunk Amount
#     var ca: int = int(ss[1])

#     # Chunk Size
#     var cs: int = int(ss[0])

#     # Dash Count
#     # subtract 1 to prevent tails, leaves 0 dashes (-) when there is only one chunk
#     # var dc: int = ca - 1

#     var id: Array[String] = []

#     for i in ca:
#         var chunk: String = ""
#         chunk += str(randi_range(0, 9))
