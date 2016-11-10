tests-enumerating
testBoxesAroundBoxAtAtDoWithIndexes
	| expected |
	expected := #((1 2) (2 1) (2 2) (2 3)).
	field boxesAroundBoxAt: 1 at: 1 doWithIndexes: [ :box :i :j |
		self
			assert: expected first first equals: i;
			assert: expected first second equals: j.
	expected := expected allButFirst ].

	expected := #((2 2) (2 3) (2 4) (3 2) (3 4) (4 2) (4 3) (4 4)).
	field boxesAroundBoxAt: 3 at: 3 doWithIndexes: [ :box :i :j |
		self
			assert: expected first first equals: i;
			assert: expected first second equals: j.
	expected := expected allButFirst ].

	expected := #((4 4) (4 5) (5 4)).
	field boxesAroundBoxAt: 5 at: 5 doWithIndexes: [ :box :i :j |
		self
			assert: expected first first equals: i;
			assert: expected first second equals: j.
	expected := expected allButFirst ].