Class {
	#name : #MFieldElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'MineSweeper-Elements'
}

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
		boxElement := MBoxElement new box: aBox ;
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
