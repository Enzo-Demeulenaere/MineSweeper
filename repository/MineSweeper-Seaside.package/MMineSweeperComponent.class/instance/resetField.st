resetting
resetField
	field := MField width: 50 height: 20.
	field announcer
		when: MPlayerLoose do: [ 
			gameEnded := true.
			playerWon := false ];
		when: MPlayerWin do: [ 
			gameEnded := true.
			playerWon := true ].
	field mineCount logCr