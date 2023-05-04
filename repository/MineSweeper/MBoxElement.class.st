Class {
	#name : #MBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'field',
		'size',
		'clicked',
		'text'
	],
	#category : #'MineSweeper-Elements'
}

{ #category : #'as yet unclassified' }
MBoxElement >> aeDrawGeometryOn2: aeCanvas [
	"Draw this card on an Alexandrie canvas"

	"aeCanvas
		pathFactory: [ :cairoContext |
			cairoContext
				roundedRectangleTo: self size
				radius: 2];
		setBackgroundWith: [
			aeCanvas setSourceColor: self backgroundPaint ];
		drawFigureAndPrepareToClip."
]

{ #category : #'as yet unclassified' }
MBoxElement >> backgroundPaint [ 
	^ Color lightGray 
]

{ #category : #accessing }
MBoxElement >> box [ 
	^ box
]

{ #category : #accessing }
MBoxElement >> box: aMBox [	
	box:= aMBox.
	
	box announcer when: MBoxClickedAnnouncement send: #click to: self 
]

{ #category : #public }
MBoxElement >> click [ 
	| boxPosX boxPosY |
	clicked:= true.
	self background: Color transparent.
	
	boxPosX := (self position x) //50 +1.
	boxPosY := (self position y) //50 +1.
	(self box isMineBox)
			ifTrue: [ text text: 'M' asRopedText. ]
			ifFalse: [text text: (self field mineCountAroundBoxAt: boxPosY  at: boxPosX) asString asRopedText ].
	
	
	text text fontSize: 50.
	text text fontName: 'Source Sans Pro'.
]

{ #category : #accessing }
MBoxElement >> field [ 
	^field 
]

{ #category : #accessing }
MBoxElement >> field: aMField [
	field:= aMField 
]

{ #category : #initialization }
MBoxElement >> initialize [ 
	super initialize.
	self background: self backgroundPaint.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 5).
	self size: 48.
	
	text := BlTextElement new.
	self addChild: text.
	text text: '' asRopedText.
	self layout: BlFrameLayout new.
	text constraintsDo: [ :c | 
		c frame vertical alignCenter.
		c frame horizontal alignCenter ].
	
	"self margin: (BlInsets top: 2 left: 2 bottom: 2 right: 2 ). "
]

{ #category : #testing }
MBoxElement >> isClicked [ 
	^ clicked
]

{ #category : #'api - bounds' }
MBoxElement >> size [ 
	^ size
]

{ #category : #'api - bounds' }
MBoxElement >> size: aNumber [
	size:= aNumber@aNumber 
]
