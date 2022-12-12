$input_contents = Get-Content $PSScriptRoot\input.txt

for ($i = 0; $i -lt $input_contents.length - 4; $i = $i + 1){
	if (($input_contents[$i..$($i+3)] | Sort-Object | Get-Unique).length -eq 4){
		
		# +1 because arrays start at 0
		# +3 due to meet message length of 4
		write-host ($i+3+1)

		Write-Host -NoNewLine 'Press any key to continue...'
		$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
		exit
	}
}



Write-Host -NoNewLine 'Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

