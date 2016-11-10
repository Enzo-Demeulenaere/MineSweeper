enumerating
boxesAroundBoxAt: x at: y doWithIndexes: aBlock
	^ (x - 1 to: x + 1) collect: [ :i |
			(y - 1 to: y + 1) collect: [ :j |
				((i = x and: [ j = y ])
					or: [ i < 1
					or: [ j < 1
					or: [ i > self width
					or: [ j > self height ] ] ] 
				])
					ifFalse: [ 
						aBlock
							value: (self boxAt: i at: j)
							value: i
							value: j ] ] ]