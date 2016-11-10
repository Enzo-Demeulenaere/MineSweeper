enumerating
boxesAroundBoxAt: x at: y do: aBlock
	self boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
		aBlock value: box ]