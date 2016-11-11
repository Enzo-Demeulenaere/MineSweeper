player api
readableTextualRepresentation
	| visitor |
	visitor := MFieldPrinter new.
	self accept: visitor.
	^ visitor streamContents