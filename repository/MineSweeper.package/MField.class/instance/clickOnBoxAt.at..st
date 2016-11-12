player api
clickOnBoxAt: x at: y
	gameEnded ifTrue: [ ^ self ].
	(self boxAt: x at: y) clickIn: self at: x at: y