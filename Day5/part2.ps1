$input_contents = Get-Content $PSScriptRoot\input.txt

#            [Q]     [G]     [M]    
#            [B] [S] [V]     [P] [R]
#    [T]     [C] [F] [L]     [V] [N]
#[Q] [P]     [H] [N] [S]     [W] [C]
#[F] [G] [B] [J] [B] [N]     [Z] [L]
#[L] [Q] [Q] [Z] [M] [Q] [F] [G] [D]
#[S] [Z] [M] [G] [H] [C] [C] [H] [Z]
#[R] [N] [S] [T] [P] [P] [W] [Q] [G]
# 1   2   3   4   5   6   7   8   9 

[string[]]$script:stack_arr1 = ("R","S","L","F","Q")
[string[]]$script:stack_arr2 = ("N", "Z", "Q", "G", "P", "T")
[string[]]$script:stack_arr3 = ("S", "M", "Q", "B")
[string[]]$script:stack_arr4 = ("T", "G", "Z", "J", "H", "C", "B", "Q")
[string[]]$script:stack_arr5 = ("P", "H", "M", "B", "N", "F", "S")
[string[]]$script:stack_arr6 = ("P", "C", "Q", "N", "S", "L", "V", "G")
[string[]]$script:stack_arr7 = ("W", "C", "F")
[string[]]$script:stack_arr8 = ("Q", "H", "G", "Z", "W", "V", "P", "M")
[string[]]$script:stack_arr9 = ("G", "Z", "D", "L", "C", "N", "R")

$LOOP_COUNT = 10

function show_stacks(){
    write-host "Showing Stacks"
	write-host $script:stack_arr1
	write-host $script:stack_arr2
	write-host $script:stack_arr3
	write-host $script:stack_arr4
	write-host $script:stack_arr5
	write-host $script:stack_arr6
	write-host $script:stack_arr7
	write-host $script:stack_arr8
	write-host $script:stack_arr9
}

function top_item_all(){
    write-host "Top of Stacks"
	write-host -nonewline $script:stack_arr1[$script:stack_arr1.length-1]
	write-host -nonewline $script:stack_arr2[$script:stack_arr2.length-1]
	write-host -nonewline $script:stack_arr3[$script:stack_arr3.length-1]
	write-host -nonewline $script:stack_arr4[$script:stack_arr4.length-1]
	write-host -nonewline $script:stack_arr5[$script:stack_arr5.length-1]
	write-host -nonewline $script:stack_arr6[$script:stack_arr6.length-1]
	write-host -nonewline $script:stack_arr7[$script:stack_arr7.length-1]
	write-host -nonewline $script:stack_arr8[$script:stack_arr8.length-1]
	write-host -nonewline $script:stack_arr9[$script:stack_arr9.length-1]
}

function stack_picker($stack_number){
	if ($stack_number -eq 1) {return [ref]$script:stack_arr1}
	elseif ($stack_number -eq 2) {return [ref]$script:stack_arr2}
	elseif ($stack_number -eq 3) {return [ref]$script:stack_arr3}
	elseif ($stack_number -eq 4) {return [ref]$script:stack_arr4}
	elseif ($stack_number -eq 5) {return [ref]$script:stack_arr5}
	elseif ($stack_number -eq 6) {return [ref]$script:stack_arr6}
	elseif ($stack_number -eq 7) {return [ref]$script:stack_arr7}
	elseif ($stack_number -eq 8) {return [ref]$script:stack_arr8}
	elseif ($stack_number -eq 9) {return [ref]$script:stack_arr9}
}

function move_item([int]$move_count, [ref]$source_stack, [ref]$dest_stack){
    write-host $dest_stack.Value
    # move box to dest
    $dest_stack.Value += $source_stack.Value[-$move_count..-1]
    write-host $dest_stack.Value
        
    write-host $source_stack.Value
    # remove box from src
    if (($source_stack.Value).length -gt 0){
        $source_stack.Value = $source_stack.Value[0..$(($source_stack.Value).length-1-$move_count)]
    }
    write-host $source_stack.Value
}

$input_contents -split "`n" | %{
    $dump = $_ -match "move (?<move_group>\d+) from (?<source_group>\d+) to (?<dest_group>\d+)"
    move_item $Matches.move_group $(stack_picker $Matches.source_group) $(stack_picker $Matches.dest_group)
}

top_item_all





#Write-Host -NoNewLine 'Press any key to continue...'
#$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

