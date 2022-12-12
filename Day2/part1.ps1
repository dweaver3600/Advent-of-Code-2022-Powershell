$input_contents = Get-Content $PSScriptRoot\input.txt

[int]$script:current_score = 0

[int]$ROCK_POINTS = 1
[int]$PAPER_POINTS = 2
[int]$SCISSORS_POINTS = 3

[int]$LOSE_POINTS = 0
[int]$DRAW_POINTS = 3
[int]$WIN_POINTS = 6

#A = ROCK
#B = PAPER
#C = SCISSORS

#X = ROCK
#Y = PAPER
#Z = SCISSORS

function add_points ($throw_points, $round_points){
    #write-host "current score`: $current score. Points earned $round_points `+ $throw_points"
	$script:current_score = $current_score + $throw_points + $round_points
}

$input_contents -split "`n" | foreach {
	$left = $_[0]
	$right = $_[2]

	if ($left -eq "A") { # ROCK
		if ($right -eq "X"){ # ROCK
			add_points $ROCK_POINTS $DRAW_POINTS
		}
		elseif ($right -eq "Y") { # PAPER
			add_points $PAPER_POINTS $WIN_POINTS
		}
		elseif ($right -eq "Z") { #SCISSORS
			add_points $SCISSORS_POINTS $LOSE_POINTS
		}
	}

	elseif ($left -eq "B") { # PAPER
		if ($right -eq "X") { # ROCK
			add_points $ROCK_POINTS $LOSE_POINTS
		}
		elseif ($right -eq "Y") { # PAPER
			add_points $PAPER_POINTS $DRAW_POINTS
		}
		elseif ($right -eq "Z") { #SCISSORS
			add_points $SCISSORS_POINTS $WIN_POINTS
		}
	}

	elseif ($left -eq "C") {# SCISSORS
		if ($right -eq "X") { # ROCK
			add_points $ROCK_POINTS $WIN_POINTS
		}
		elseif ($right -eq "Y") { # PAPER
			add_points $PAPER_POINTS $LOSE_POINTS
		}
		elseif ($right -eq "Z") { #SCISSORS
			add_points $SCISSORS_POINTS $DRAW_POINTS
		}
	}
}

write-host "points scored $current_score"

#Write-Host -NoNewLine 'Press any key to continue...'
#$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

