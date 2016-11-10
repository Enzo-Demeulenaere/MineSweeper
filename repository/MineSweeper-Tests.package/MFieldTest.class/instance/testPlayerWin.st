tests-box api
testPlayerWin
	| win |
	win := false.
	field announcer when: MPlayerWin do: [ win := true ].
	field
		clickOnBoxAt: 1 at: 1;
		clickOnBoxAt: 1 at: 5;
		clickOnBoxAt: 5 at: 1;
		clickOnBoxAt: 5 at: 4;
		clickOnBoxAt: 4 at: 1;
		clickOnBoxAt: 2 at: 1.
	self assert: win.