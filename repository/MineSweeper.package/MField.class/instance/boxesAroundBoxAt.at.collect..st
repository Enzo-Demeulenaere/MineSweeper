enumerating
boxesAroundBoxAt: x at: y collect: aBlock
	| collected |
	collected := OrderedCollection new.
	self boxesAroundBoxAt: x at: y do: [ :box |
		collected add: (aBlock value: box) ].
	^ collected