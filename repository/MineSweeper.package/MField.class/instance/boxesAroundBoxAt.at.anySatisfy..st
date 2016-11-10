enumerating
boxesAroundBoxAt: x at: y anySatisfy: aBlock
	self boxesAroundBoxAt: x at: y do: [ :box |
		(aBlock value: box)
			ifTrue: [ ^ true ] ].
	^ false