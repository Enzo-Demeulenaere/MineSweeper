enumerating
boxesSelect: aBlock
	| selected |
	selected := OrderedCollection new.
	matrix do: [ :box |
		(aBlock value: box)
			ifTrue: [ selected add: box ] ].
	^ selected