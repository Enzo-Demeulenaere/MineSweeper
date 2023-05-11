Class {
	#name : #MFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'MineSweeper-Elements'
}

{ #category : #'test ressources' }
MFieldElement class >> matrixForField [  
	|aGameElement space|
	"Create the game model and the Bloc element."
	aGameElement := self new game: MField matrixForField ; yourself.
	
	"The space represents the window"
	space := BlSpace new.
	space addChild: aGameElement. 

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: aGameElement extent.

	"Show the window"

	space show. 
]

{ #category : #execution }
MFieldElement class >> matrixTest5x5 [  
	|aGameElement space|
	"Create the game model and the Bloc element."
	aGameElement := self new game: MField matrixTest5x5 ; yourself.
	
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

	game := aMField.
	self layout columnCount: game width.
	game matrix do: [ :aBox |
		| boxElement |
		boxElement := (MBoxElement new box: aBox) field: aMField.
		self addChild: boxElement ]
]

{ #category : #initialization }
MFieldElement >> initialize [

	super initialize.
	self padding: (BlInsets all: 20).
	self background: (BlBackground paint: Color white darker).
	self layout: (BlGridLayout horizontal cellSpacing: 5).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]
