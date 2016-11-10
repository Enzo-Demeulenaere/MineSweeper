random subclass instance creation
randomCase
	^ (1 to: 10) atRandom > 9
			ifTrue: [ self mine ]
			ifFalse: [ self empty ].