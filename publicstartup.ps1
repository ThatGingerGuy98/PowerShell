switch ($(Get-date -uformat %e)[1]){
    11 {$($date = Get-date -Uformat "Today is %A, %B %eth, %G, and the time is %R.")}
    12 {$($date = Get-date -Uformat "Today is %A, %B %eth, %G, and the time is %R.")}
    13 {$($date = Get-date -Uformat "Today is %A, %B %eth, %G, and the time is %R.")}
    1 {$($date = Get-date -Uformat "Today is %A, %B %est, %G, and the time is %R.")}
    2 {$($date = Get-date -Uformat "Today is %A, %B %end, %G, and the time is %R.")}
    3 {$($date = Get-date -Uformat "Today is %A, %B %erd, %G, and the time is %R.")}
    default {$(Get-date -Uformat "Today is %A, %B %eth, %G, and the time is %R.")}
}

switch ($(Get-date -format "HH")){
    { $_ -lt 12 } { $greeting = "Good Morning User!`r`n" }
    { $_ -ge 18 } { $greeting = "Good Evening User!`r`n" }
    default { $greeting = "Good Afternoon User!`r`n" }
}

$charindex = 0
for ($greeting.length){
    Write-Host -NoNewline $greeting[$charindex]
    $charindex++
    Start-Sleep -M 30
    if ($charindex -gt $greeting.Length){
    Start-Sleep -S 1
    Write-host ""
    $charindex = 0
    break
    }
}
for ($date.length){
    Write-Host -NoNewline $date[$charindex]
    $charindex++
    Start-Sleep -M 30
    if ($charindex -gt $date.Length){
    Start-Sleep -s 1
    Write-host ""
    break
    }
}

[console]::windowwidth=130;[console]::WindowHeight=56

$weather = ((((curl http://wttr.in/32508?2pqFu).Content).tostring()).TrimEnd("  
                                                                                                                                ."))
$chrindex = 0
$chrlinepos = 0
while ($chr = $weather.tochararray()[$chrindex]) {
    if ($chrlinepos -eq ($linelen - 1)) {
        Write-Host $chr
        $lineindex++
        $chrlinepos = 0
    } else {
        $chrlinepos += 1
        Write-Host -NoNewLine $chr
    }
    Start-Sleep -Milliseconds 0.1
    $chrindex++
}
#Reaches out to wttr.in, created by @igor_chubin, and places the output into a temporary file, types it out one character at a time.  

Read-Host  #Waits for user input to close.