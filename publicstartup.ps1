$homeTZ = 'Eastern Standard Time'
$away = $false
if ($away){
    switch ($(Get-date -uformat %e)){
        { $_ -ge 11 -and $_ -le 13 } {$(($date = Get-date -Uformat "Today is %A, %B %eth, %G, and the time is %R.").tostring()) | out-null; $($homeTime = "Back home it is" + [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([datetime]::UtcNow, $homeTZ).ToString(' dddd, MMMM d\t\h, yyyy, "and the time is" HH:mm.')) | out-null}
        1 {$(($date = Get-date -Uformat "Today is %A, %B %est, %G, and the time is %R.").tostring()) | out-null; $($homeTime = "Back home it is" + [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([datetime]::UtcNow, $homeTZ).ToString(' dddd, MMMM d\s\t, yyyy, "and the time is" HH:mm.')) | out-null}
        2 {$(($date = Get-date -Uformat "Today is %A, %B %end, %G, and the time is %R.").tostring()) | out-null; $($homeTime = "Back home it is" + [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([datetime]::UtcNow, $homeTZ).ToString(' dddd, MMMM d\n\d, yyyy, "and the time is" HH:mm.')) | out-null}
        3 {$(($date = Get-date -Uformat "Today is %A, %B %erd, %G, and the time is %R.").tostring()) | out-null; $($homeTime = "Back home it is" + [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([datetime]::UtcNow, $homeTZ).ToString(' dddd, MMMM d\r\d, yyyy, "and the time is" HH:mm.')) | out-null}
        default {$(($date = Get-date -Uformat "Today is %A, %B %eth, %G, and the time is %R.`r`n").tostring()) | out-null; $($homeTime = "Back home it is" + [System.TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([datetime]::UtcNow, $homeTZ).ToString(' dddd, MMMM d\t\h, yyyy, "and the time is" HH:mm.')) | out-null}
    }
}
else {
    switch ($(Get-date -uformat %e)){
        { $_ -ge 11 -and $_ -le 13 } {$(($date = Get-date -Uformat "Today is %A, %B %eth, %G, and the time is %R.").tostring()) | out-null}
        1 {$(($date = Get-date -Uformat "Today is %A, %B %est, %G, and the time is %R.").tostring()) | out-null}
        2 {$(($date = Get-date -Uformat "Today is %A, %B %end, %G, and the time is %R.").tostring()) | out-null}
        3 {$(($date = Get-date -Uformat "Today is %A, %B %erd, %G, and the time is %R.").tostring()) | out-null}
        default {$(($date = Get-date -Uformat "Today is %A, %B %eth, %G, and the time is %R.`r`n").tostring()) | out-null}
    }
}

switch ($(Get-date -format "HH")){
    { $_ -lt 12 } { $greeting = "Good Morning User!`r`n" }
    { $_ -ge 18 } { $greeting = "Good Evening User!`r`n" }
    default { $greeting = "Good Afternoon User!`r`n" }
}

$statement = $greeting + $date + $homeTime
$charindex = 0
for ($statement.length){
    Write-Host -NoNewline $statement[$charindex]
    $charindex++
    Start-Sleep -M 30
    if ($charindex -eq $greeting.Length){
    Start-Sleep -S 1
    }
    if ($charindex -ge $statement.Length){
    Start-Sleep -S 1
    Write-host ""
    $charindex = 0
    break
    }
}

[console]::windowwidth=130;[console]::WindowHeight=56

$weather = ((((curl http://wttr.in/?2pqFu).Content).tostring()).TrimEnd("  
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

Write-Host -NoNewline "`nPress any key to close."
Read-Host