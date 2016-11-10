testing
hasClickedBoxAroundBoxAt: x at: y
	^ self boxesAroundBoxAt: x at: y anySatisfy: #isClickedBox