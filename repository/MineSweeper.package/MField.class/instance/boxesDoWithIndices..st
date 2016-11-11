enumerating
boxesDoWithIndices: aBlock
	1 to: self height do: [ :i |
		1 to: self width do: [ :j |
			aBlock value: (self boxAt: i at: j) value: i value: j ] ]