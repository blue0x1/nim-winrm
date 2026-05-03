import ../winrm
import std/os

var client = newClient(
  host   = "192.168.1.10",
  user   = "CORP\\administrator",
  pass   = "Password123",
  ntHash = "",
  spn    = "",
  domain = "",
  auth   = amNtlm,
  ssl    = false,
  port   = 5985
)

warmSmartShell(client)

let data = readFile("./payload.exe")
let remotePath = "C:\\Temp\\payload.exe"
let setup = "Set-Content -Path '" & remotePath & "' -Value ([Convert]::FromBase64String($input)) -Encoding Byte"
uploadFileStream(client, data, setup, data.len)

deleteShell(client)
