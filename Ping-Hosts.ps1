<#
Script assumes the hostfile contains a list of IP addressess.  It reads in the file then pings (test-connection) each one.  The list can contain host names or IP address, as long as they are in a single column.
#>

#$IPs = read-host "Please enter the file path of the host list"
1..255 | foreach {test-connection -count 1 10.10.10.$_}
