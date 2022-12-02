$input_contents = Get-Content $PSScriptRoot\input.txt

[int]$current_elf = 1
[int]$most_calories_elf = $current_elf

[int]$calorie_count = 0
[int]$most_calories_counted = #calories_counted

write-host -nonewline "calculating calories for elf number $current_elf`: "
$input_contents -split "`n"| foreach{
	if ($_ -eq ""){
		if ($calorie_count -gt $most_calories_counted){
			$most_calories_counted = $calorie_count
			$most_calories_elf = $current_elf
		}

		write-host "$calorie_count `($most_calories_counted`)"
		$current_elf = $current_elf + 1
		write-host -nonewline "calculating calories for elf number $current_elf`: "
		$calorie_count = 0
	}
	
	else{
		$calorie_count = $calorie_count + [int]$_
	}
}

if ($calorie_count -gt $most_calories_counted){
	$most_calories_counted = $calorie_count
	$most_calories_elf = $current_elf
}
write-host "$calorie_count `($most_calories_counted`)"


write-host "Elf numebr $most_calories_elf ate the most calories `($most_calories_counted`)"

Write-Host -NoNewLine 'Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

