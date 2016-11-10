tests-clicking
testClickInAtAt
	| bool |
	bool := false.
	field clickOnBoxAt: 1 at: 1.
	field announcer when: MFieldUpdate , MPlayerLoose , MPlayerWin do: [ 
		bool := true ].
	(field boxAt: 1 at: 1) clickIn: field at: 1 at: 1.
	self deny: bool