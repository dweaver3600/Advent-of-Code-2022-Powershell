$input_contents = Get-Content $PSScriptRoot\input.txt

$RUN_ONCE = $False
$line_count = 1
$sack_contents = @(1..3)
$sack_contents.clear()

$script:priority_sum_total_value = 0

function priority_sum($value){
    $script:priority_sum_total_value
    $value

    $value = $value + 1
    $script:priority_sum_total_value = $script:priority_sum_total_value + $value
}

$input_contents -split "`n" | foreach{
    $sack_contents[$line_count % 3 - 1] = $_
    
    if (($line_count % 3) -eq 0) {
        # setup
        [int[]] $contents_arr = @(1..52)
        $contents_arr.Clear()
        $common_char_found = $false

        for ($i = 0; $i -lt $sack_contents.length; $i = $i + 1) {
            
            
            for ($j = 0; $j -lt $sack_contents[$i].length; $j = $j + 1) {

                $char = $sack_contents[$i][$j]
                $char_val = [int]$char

                if ($char -match '(?-i)^[A-Z]$'){
                    $index = $char_val - 65 + 26
                }
                elseif ($char -match '(?-i)^[a-z]$'){
                    $index = $char_val - 97
                }

                if ($i -eq 0 -and $contents_arr[$index] -eq 0) {
                    $contents_arr[$index] = 1
                }
                
                elseif ($i -eq 1 -and $contents_arr[$index] -eq 1) {
                    $contents_arr[$index] = 2
                }
                
                elseif ($i -eq 2 -and $contents_arr[$index] -eq 2) {
                    $common_char_found = $true
                    break
                }
                
            }

            if ($common_char_found -eq $true) {break}
            
        }
        # cleanup
        $sack_contents.clear()
    }
    
    
    $line_count = $line_count + 1
}

write-host "total priority $script:priority_sum_total_value"

#Write-Host -NoNewLine 'Press any key to continue...'
#$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

