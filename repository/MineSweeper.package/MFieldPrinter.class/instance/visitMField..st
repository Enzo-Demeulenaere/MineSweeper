visiting
visitMField: aMField
	field := aMField.
	aMField boxesDoWithIndices: [ :box :row :column |
		currentRow := row.
		currentColumn := column.
		box accept: self.
		currentColumn = aMField width 
			ifFalse: [ self writeStream << Character space ]
			ifTrue: [ self writeStream << Smalltalk os lineEnding ] ]