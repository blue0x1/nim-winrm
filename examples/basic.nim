import ../winrm

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

let output = runCmd(client, "whoami", isCmd = false)
echo output

deleteShell(client)
