visiting
visitMClicked: aMClicked
	|count|
	count := (field mineCountAroundBoxAt: currentRow at: currentColumn).
	count = 0
		ifTrue: [ ^ $_ ].
	^ count asString