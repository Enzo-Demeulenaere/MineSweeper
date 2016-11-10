tests-testing
testHasEmptyBox
	self assert: field hasEmptyBox.
	field
		clickOnBoxAt: 1 at: 1;
		clickOnBoxAt: 1 at: 5;
		clickOnBoxAt: 5 at: 1;
		clickOnBoxAt: 5 at: 4;
		clickOnBoxAt: 4 at: 1;
		clickOnBoxAt: 2 at: 1.
	self deny: field hasEmptyBox.