tests-box api
testReplaceCaseAtRowColumnBy
	| actual new |
	actual := field boxAt: 2 at: 2.
	new := MBox clicked.
	field replaceCaseAtRow: 2 column: 2 by: new.
	self
		assert: (field boxAt: 2 at: 2) ~= actual;
		assert: (field boxAt: 2 at: 2) equals: new