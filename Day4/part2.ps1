$input_contents = Get-Content $PSScriptRoot\input.txt

$contain_count = 0

$input_contents -split "`n" | %{
	$parts = $_ -split ","

	[int[]]$left = $parts[0] -split "-"
	[int[]]$right = $parts[1] -split "-"

	if((($right[0] -ge $left[0] -and $right[0] -le $left[1]) -or ($right[1] -ge $left[0] -and $right[1] -le $left[1])) -or (($left[0] -ge $right[0] -and $left[0] -le $right[1]) -or ($left[1] -ge $right[0] -and $left[1] -le $right[1]))){
		$contain_count = $contain_count + 1
	}
}

write-host "$contain_count full overlaps"

Write-Host -NoNewLine 'Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

