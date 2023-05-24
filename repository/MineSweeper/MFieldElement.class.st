Class {
	#name : #MFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'MineSweeper-Elements'
}

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
			                 c horizontal matchParent.
			                 c vertical matchParent ];
		                 addChild: aGameElement;
		                 addEventHandlerOn: BlElementExtentChangedEvent
		                 do: [ :evt | space extent: evt target extent ].
	"The space represents the window"

	space addChild: squareElement.

	"Calculate the extent of the game board for the first time, to set it to the window."
	space pulse.
	space extent: squareElement extent.
	space show.
	^ space
]

{ #category : #'test ressources' }
MFieldElement class >> withMatrixForField [ 

	^ self openWithModel: MField matrixForField
]

{ #category : #'test ressources' }
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
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ]
]
