Class {
	#name : #MFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'MineSweeper-Elements'
}

{ #category : #'as yet unclassified' }
MFieldElement class >> launchLarge [
	^ self withMatrixTest5x5WithMagnifier: 2
]

{ #category : #'as yet unclassified' }
MFieldElement class >> launchRegular [
	^ self withMatrixTest5x5 
]

{ #category : #'as yet unclassified' }
MFieldElement class >> launchSmall [
	^ self withMatrixTest5x5WithMagnifier: 0.5
]

{ #category : #'as yet unclassified' }
MFieldElement class >> launchVeryLarge [
	^ self withMatrixTest5x5WithMagnifier: 4
]

{ #category : #'as yet unclassified' }
MFieldElement class >> openWithModel: aModel [

	^ self openWithModel: aModel withMagnifier: 1
]

{ #category : #'as yet unclassified' }
MFieldElement class >> openWithModel: aModel withMagnifier: aNumber [

	| aGameElement space squareElement |
	space := BlSpace new.
	"Create the game model and the Bloc element."
	aGameElement := self new
		                game: (aModel magnifier: aNumber);
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

{ #category : #execution }
MFieldElement class >> withMatrixTest5x5WithMagnifier: aNumber [

	^ self openWithModel: MField matrixTest5x5 withMagnifier: aNumber 
]

{ #category : #accessing }
MFieldElement >> game [ 
	^ game
]

{ #category : #accessing }
MFieldElement >> game: aMField [

	game := aMField.
	self padding: (BlInsets all: 5 * game magnifier).
	self layout columnCount: game width.
	game matrix do: [ :aBox |
		| boxElement |
		boxElement := (MBoxElement box: aBox) field: aMField.
		self addChild: boxElement ]
]

{ #category : #initialization }
MFieldElement >> initialize [

	super initialize.
	self background: (BlBackground paint: Color white darker).
	self layout: (BlGridLayout horizontal cellSpacing: 5).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]
