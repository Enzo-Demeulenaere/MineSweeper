Class {
	#name : #MFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'MineSweeper-Elements'
}

{ #category : #execution }
MFieldElement class >> play [ 
	|aGameElement space|
	"Create the game model and the Bloc element."
aGameElement := self new game: MField MatrixTest5x5 ; yourself.

"The space represents the window"
space := BlSpace new.
space addChild: aGameElement. 

"Calculate the extent of the game board for the first time, to set it to the window."
space pulse.
space extent: aGameElement extent.

"Show the window"

space show. 
]

{ #category : #accessing }
MFieldElement >> game [ 
	^ game
]

{ #category : #accessing }
MFieldElement >> game: aMField [
	|aBoxEventListener|

	aBoxEventListener := self newMBoxEventListener field: aMField.
	game:= aMField.
	self layout columnCount: game width.
	game matrix do: [ :aBox | 
		|boxElement|
		boxElement := (MBoxElement new box: aBox) field: aMField ;
			addEventHandler: aBoxEventListener.
		self addChild: boxElement ]
	 
]

{ #category : #initialization }
MFieldElement >> initialize [ 
	super initialize.
	self background: (BlBackground paint: Color white darker).
	self layout: (BlGridLayout horizontal).
	self
    constraintsDo: [ :aLayoutConstraints |
      aLayoutConstraints horizontal fitContent.
      aLayoutConstraints vertical fitContent ]
]

{ #category : #'instance creation' }
MFieldElement >> newMBoxEventListener [ 
	^ MBoxEventListener new
]
