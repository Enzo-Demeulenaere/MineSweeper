tests-clicking
testClickInAtAt
	| loose |
	loose := false.
	field announcer when: MPlayerLoose do: [ loose := true ].
	(field boxAt: 1 at: 3) clickIn: field at: 1 at: 3.
	self assert: loose