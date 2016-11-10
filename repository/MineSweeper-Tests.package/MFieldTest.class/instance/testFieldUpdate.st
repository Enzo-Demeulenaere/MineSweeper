tests-box api
testFieldUpdate
	| update |
	update := false.
	field announcer when: MFieldUpdate do: [ update := true ].
	field clickOnBoxAt: 1 at: 1.
	
	self assert: update.