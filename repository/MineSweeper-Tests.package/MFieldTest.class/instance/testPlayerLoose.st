tests-box api
testPlayerLoose
	| loose |
	loose := false.
	field announcer when: MPlayerLoose do: [ loose := true ].
	field clickOnBoxAt: 1 at: 3.
	
	self
		assert: loose;
		assert: field playerLost.