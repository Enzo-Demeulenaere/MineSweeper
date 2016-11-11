debug api
debugTextualRepresentation
	| visitor |
	visitor := MDebugFieldPrinter new.
	self accept: visitor.
	^ visitor streamContents