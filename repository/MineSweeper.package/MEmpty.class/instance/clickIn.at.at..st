clicking
clickIn: aMField at: x at: y
	aMField replaceCaseAtRow: x column: y by: MClicked new.
	self propagateClickIn: aMField at: x at: y.
	aMField incrementRound.
	aMField hasEmptyBox
		ifFalse: [ aMField playerWin ]
		ifTrue: [ aMField fieldUpdate ]