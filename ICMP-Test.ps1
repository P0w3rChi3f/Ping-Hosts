<#
This is an alternative way to the Test-Connection cmdlet.  I have a static list I was using for testing, but can be chaned to read in a txt file.  The "foreach" block cleans up the origianl "ping" results to only display IP's that respond to the 1st icmp packet and stores them in a variable that can be used later.  The catch block only displays the IP's that did not respond to the 1st ICMP packet.  It can be coded to send those results to a file or variable for further analysis

#>

# $IPList = read-host "Please enter the file path of the host list"

$IPList = 1..255 | ForEach-Object {"10.10.10.$_"}

$ReplyResults = @()
<<<<<<< HEAD
foreach ($node in (get-content $IPList)){
    $icmpresults = ping $node -n 1} 
=======
$i = 0
foreach ($node in ($IPList)){
    $i += 1
    Write-Progress “Scanning Network” -PercentComplete (($i/$IPList.Count)*100)
    $icmpresults = ping $node -n 1 
>>>>>>> 93c1c78365d5c3f459af88fcc9e9e75cc47f3c71
    try {
        $ReplyResults += ((($icmpresults | Select-String "reply" | Where-Object {$_ -notlike "*unreachable*"}).ToString()).Split(" ")[2]).TrimEnd(":")
    }
    catch {
        write-host "$node is not accessable"
    }
} 
$ReplyResults #| out-file .\OnlineIPs.txt

