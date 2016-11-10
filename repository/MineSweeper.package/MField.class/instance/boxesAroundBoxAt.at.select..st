enumerating
boxesAroundBoxAt: x at: y select: aBlock
	| collected |
	collected := OrderedCollection new.
	self boxesAroundBoxAt: x at: y do: [ :box |
		(aBlock value: box)
			ifTrue: [ collected add: box ] ].
	^ collected