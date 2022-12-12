$input_contents = Get-Content $PSScriptRoot\input.txt

$RUN_ONCE = $False

$script:priority_sum_total_value = 0

function priority_sum($value){
    $value = $value + 1
    $script:priority_sum_total_value = $script:priority_sum_total_value + $value
}

$input_contents -split "`n" | foreach{
    $str_half = ($_.length)/2
    $past_half = $str_half + 1
    
    [int[]] $contents_arr = @(1..52)
    $contents_arr.Clear()

	$front_half = $_.substring(0,$str_half)
	$back_half = $_.substring($_.length -$str_half)
	
    for ($i = 0; $i -lt $front_half.length; $i = $i + 1){

        $char = $front_half[$i]
        $char_val = [int]$char

        if ($char -match '(?-i)^[A-Z]$'){
            $index = $char_val - 65 + 26
        }
        if ($char -match '(?-i)^[a-z]$'){
            $index = $char_val - 97
        }

        $contents_arr[$index] = 1
    }

    for ($i = 0; $i -lt $back_half.length; $i = $i + 1){
        
        $char = $back_half[$i]
        $char_val = [int]$char

        if ($char -match '(?-i)^[A-Z]$'){
            $index = $char_val - 65 + 26
        }
        if ($char -match '(?-i)^[a-z]$'){
            $index = $char_val - 97
        }

        if ($contents_arr[$index] -eq 1){
            $front_half
            $back_half
            $char
            priority_sum $index
            break
        }
    }

	if ($RUN_ONCE){
        $script:priority_sum_total_value

        #Write-Host -NoNewLine 'Press any key to continue...'
        #$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

        exit
	}
}

write-host "total priority $script:priority_sum_total_value"

#Write-Host -NoNewLine 'Press any key to continue...'
#$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

