clicking
propagateClickIn: aMField at: x at: y
	(aMField hasMineBoxAroundBoxAt: x at: y)
		ifFalse: [ 
			aMField boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
				box isEmptyBox ifTrue: [ 
					aMField replaceCaseAtRow: i column: j by: MClicked new.
					self propagateClickIn: aMField at: i at: j ] ] ]