$input_contents = Get-Content $PSScriptRoot\input.txt

[int]$current_elf = 1
[int]$most_calories_elf = $current_elf

[int]$calorie_count = 0
$most_calories_counted = @(1..3)
$most_calories_counted[0] = $calorie_count
$most_calories_counted[1] = $calorie_count
$most_calories_counted[2] = $calorie_count

write-host -nonewline "calculating calories for elf number $current_elf`: "
$input_contents -split "`n"| foreach{
	if ($_ -eq ""){
		if ($calorie_count -gt $most_calories_counted[2]){
			$most_calories_counted[2] = $calorie_count
			$most_calories_counted = $most_calories_counted | sort -desc
			write-host $most_calories_counted
			$most_calories_elf = $current_elf
		}

		#write-host "$calorie_count `($most_calories_counted`)"
		$current_elf = $current_elf + 1
		#write-host -nonewline "calculating calories for elf number $current_elf`: "
		$calorie_count = 0
	}
	
	else{
		$calorie_count = $calorie_count + [int]$_
	}
}

if ($calorie_count -gt $most_calories_counted[2]){
		$most_calories_counted[2] = $calorie_count
		$most_calories_counted = $most_calories_counted | sort -desc
}

write-host $most_calories_counted
$top_three_sum = 0
$most_calories_counted | foreach {$top_three_sum = $top_three_sum + $_}

write-host "The top three calorie totals summed is $top_three_sum"


Write-Host -NoNewLine 'Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

