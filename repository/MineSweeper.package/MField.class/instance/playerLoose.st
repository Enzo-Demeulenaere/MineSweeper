box api
playerLoose
	playerWon := false.
	gameEnded := true.
	self announcer announce: (MPlayerLoose field: self)