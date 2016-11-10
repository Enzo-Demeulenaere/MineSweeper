tests-testing
testHasClickedBoxAroundBoxAtAt
	self deny: (field hasClickedBoxAroundBoxAt: 1 at: 1).
	field clickOnBoxAt: 1 at: 1.
	self assert: (field hasClickedBoxAroundBoxAt: 1 at: 2)