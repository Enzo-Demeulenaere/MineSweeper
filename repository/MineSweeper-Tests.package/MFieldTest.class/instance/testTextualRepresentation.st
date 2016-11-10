tests-player api
testTextualRepresentation
	self assert: field textualRepresentation equals: '5,5-*****,*****,*****,*****,*****'.
	field clickOnBoxAt: 1 at: 1.
	self assert: field textualRepresentation equals: '5,5-_2***,25***,*****,*****,*****'