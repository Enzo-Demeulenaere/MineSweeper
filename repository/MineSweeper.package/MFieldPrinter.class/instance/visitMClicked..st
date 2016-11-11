visiting
visitMClicked: aMClicked
	|count|
	count := (field mineCountAroundBoxAt: currentRow at: currentColumn).
	count = 0
		ifTrue: [ 
			self writeStream << '_' ]
		ifFalse: [ 
			count printOn: self writeStream ]