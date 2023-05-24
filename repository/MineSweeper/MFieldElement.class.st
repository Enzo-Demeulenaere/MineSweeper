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

	| aGameElement space |
	"Create the game model and the Bloc element."
	aGameElement := self new
		                game: MField matrixTest5x5;
		                yourself.

	"The space represents the window"
	space := BlSpace new.
	space addChild: aGameElement.

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: aGameElement extent.

	"Show the window"
	space show.
	^ space
]

{ #category : #'as yet unclassified' }
MFieldElement class >> openWithModel: aModel [

	| aGameElement space squareElement |
	space := BlSpace new.
	"Create the game model and the Bloc element."
	aGameElement := self new
		                game: aModel;
		                yourself.

	squareElement := BlElement new
		                 layout:
			                 ((BlSquaredLayout on:
					                   BlLinearLayout vertical alignCenter)
				                  beTight;
				                  yourself);
		                 constraintsDo: [ :c |
			                 c horizontal fitContent.
			                 c vertical fitContent ];
		                 addChild: aGameElement.
	"The space represents the window"

	space addChild: squareElement.

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: squareElement extent.
	space resizable: false.
	space show.
	^ space
]

{ #category : #'as yet unclassified' }
MFieldElement class >> openWithModel: aModel withMagnifier: aNumber [

	^ self openWithModel: (aModel magnifier: aNumber)
]

{ #category : #execution }
MFieldElement class >> withMatrixForField [

	^ self openWithModel: MField matrixForField
]

{ #category : #execution }
MFieldElement class >> withMatrixForFieldWithMagnifier: aNumber [

	^ self openWithModel: MField matrixForField withMagnifier: aNumber 
]

{ #category : #execution }
MFieldElement class >> withMatrixTest5x5 [

	^ self openWithModel: MField matrixTest5x5
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
		boxElement := (MBoxElement box: aBox) field: aMField.
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
