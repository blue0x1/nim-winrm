import ../winrm

var client = newClient(
  host   = "dc01.corp.local",
  user   = "",
  pass   = "",
  ntHash = "",
  spn    = "",
  domain = "CORP.LOCAL",
  auth   = amKerberos,
  ssl    = false,
  port   = 5985
)

warmSmartShell(client)

let output = runCmd(client, "Get-ADUser -Filter * | Select-Object Name", isCmd = false)
echo output

deleteShell(client)
