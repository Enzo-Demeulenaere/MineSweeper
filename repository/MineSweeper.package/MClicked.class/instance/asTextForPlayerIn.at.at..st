converting
asTextForPlayerIn: aMField at: row at: column
	|count|
	count := (aMField mineCountAroundBoxAt: row at: column).
	^ count = 0
		ifTrue: [ '_' ]
		ifFalse: [ count asString ]