initialization
initialize
	super initialize.
	round := 0.
	announcer := Announcer new.
	gameEnded := false.
	playerWon := false