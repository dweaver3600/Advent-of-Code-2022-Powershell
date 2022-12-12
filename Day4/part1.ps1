$input_contents = Get-Content $PSScriptRoot\input.txt

$contain_count = 0

$input_contents -split "`n" | %{
	$parts = $_ -split ","

	[int[]]$left = $parts[0] -split "-"
	[int[]]$right = $parts[1] -split "-"

	if ($left[0] -eq $right[0]){
		$lower_min = "SAME"
	} elseif ($left[0] -lt $right[0]){
		$lower_min = "LEFT"
	} else {
		$lower_min = "RIGHT"
	}

	if ($left[1] -eq $right[1]){
		$higher_max = "SAME"
	} elseif ($left[1] -gt $right[1]){
		$higher_max = "LEFT"
	} else {
		$higher_max = "RIGHT"
	}
	
	if (($lower_min -eq "SAME") -or ($higher_max -eq "SAME")) {
		$contain_count = $contain_count + 1
	} elseif ($lower_min -eq $higher_max) {
		$contain_count = $contain_count + 1
	}
}

write-host "$contain_count full overlaps"

Write-Host -NoNewLine 'Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

