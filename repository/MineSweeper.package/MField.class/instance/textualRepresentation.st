player api
textualRepresentation
	^ String streamContents: [ :stream |
			stream
				<< self width asString;
				<< $,;
				<< self height asString;
				<< $-.
			1 to: self width do: [ :i |
				1 to: self height do: [ :j |
					|box|
					box := self boxAt: i at: j. 
					stream << (box asTextForPlayerIn: self at: i at: j) ].
				i = self width ifFalse: [ stream << $, ] ] ]