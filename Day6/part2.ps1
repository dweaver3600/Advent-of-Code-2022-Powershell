$input_contents = Get-Content $PSScriptRoot\input.txt

for ($i = 0; $i -lt $input_contents.length - 14; $i = $i + 1){
	if (($input_contents[$i..$($i+13)] | Sort-Object | Get-Unique).length -eq 14){
		
		# +1 because arrays start at 0
		# +13 due to meet message length of 14
		write-host ($i+1+13)

		Write-Host -NoNewLine 'Press any key to continue...'
		$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
		exit
	}
}



Write-Host -NoNewLine 'Press any key to continue...'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

