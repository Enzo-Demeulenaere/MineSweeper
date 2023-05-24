Class {
	#name : #MBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'field',
		'size',
		'text'
	],
	#category : #'MineSweeper-Elements'
}

{ #category : #'class initialization' }
MBoxElement class >> initialize [

	(FileLocator imageDirectory / 'flag.png') exists ifTrue: [ ^ self ].

	ZnClient new
		url:
			'https://github.com/Enzo-Demeulenaere/MineSweeper/blob/master/repository/flag.png?raw=true';
		downloadTo: FileLocator imageDirectory
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

	box := aMBox.

	box announcer
		when: MBoxClickAndReplaceAnnouncement
		send: #click: 
		to: self.
	box announcer when: MBoxFlaggedAnnouncement send: #flag to: self.
	box announcer
		when: MBoxExplosionAnnouncement
		send: #explosion
		to: self
]

{ #category : #public }
MBoxElement >> click: anAnnouncement [

	self box isFlagged ifTrue: [
		self field gameEnded
			ifFalse: [ ^ self ]
			ifTrue: [ self background: Color transparent ] ].

	self background: Color transparent.
	self box isMineBox
		ifTrue: [
			(self childNamed: 'text') text: 'M' asRopedText.]
		ifFalse: [
			| boxPosX boxPosY |
			self box announcer unsubscribe: self.
			self box: anAnnouncement box.

			boxPosX := self box position x.
			boxPosY := self box position y.
			(self childNamed: 'text') text:
				(self field mineCountAroundBoxAt: boxPosX at: boxPosY) asString
					asRopedText ]
]

{ #category : #'as yet unclassified' }
MBoxElement >> explosion [

	| explosionCenter |
	explosionCenter := self width / 2 @ (self height / 2).

	0 to: 359 by: 12 do: [ :angle |
		| anElement relativeFinalPosition |
		relativeFinalPosition := 0 @ 400
			                         rotateBy: angle degreesToRadians
			                         about: 0 @ 0.
		anElement := self explosionStar.
		self addChild: anElement.
		anElement
			position: explosionCenter;
			addAnimation: (BlTransformAnimation new
					 duration: 1 second;
					 transformDo: [ :t |
						 t translateBy: relativeFinalPosition.
						 t rotateBy: 180 ];
					 onFinishedDo: [ "Transcript show: anElement position ; cr; open."
						 anElement removeFromParent ];
					 yourself) yourself ]
]

{ #category : #'as yet unclassified' }
MBoxElement >> explosionStar [

	| outerSize innerSize numberOfPoints angleStep vertices |
	outerSize := 20.
	innerSize := 8.
	numberOfPoints := (4 to: 7) atRandom.
	angleStep := 360.0 / numberOfPoints.

	vertices := OrderedCollection new.
	0 to: 360 by: angleStep do: [ :angle |
		vertices
			add: (0 @ innerSize
					 rotateBy: (angle - (angleStep * 0.5)) degreesToRadians
					 about: 0 asPoint);
			add:
				(0 @ outerSize rotateBy: angle degreesToRadians about: 0 asPoint);
			add: (0 @ innerSize
					 rotateBy: (angle + (angleStep * 0.5)) degreesToRadians
					 about: 0 asPoint) ].

	^ BlElement new
		  geometry: (BlPolygonGeometry vertices: vertices);
		  background: Color random;
		  constraintsDo: [ :c | c ignoreByLayout ];
		  yourself
]

{ #category : #accessing }
MBoxElement >> field [ 
	^field 
]

{ #category : #accessing }
MBoxElement >> field: aMField [
	field:= aMField 
]

{ #category : #accessing }
MBoxElement >> flag [

	| pngElement aForm |
	pngElement := BlElement new.
	aForm := PNGReadWriter formFromFileNamed: 'flag.png'.
	pngElement background: (BlMatchExtentImageBackground image: aForm).

	pngElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].


	self box isFlagged
		ifFalse: [ self addChild: pngElement as: 'png' ]
		ifTrue: [ self removeChildNamed: 'png' ]
]

{ #category : #initialization }
MBoxElement >> initialize [

	| posX posY |
	super initialize.


	self background: self backgroundPaint.
	self
		geometry: (BlRoundedRectangleGeometry cornerRadius: 5);
		clipChildren: false;
		layout: BlFrameLayout new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	self initializeText.

	self addEventHandlerOn: BlMouseUpEvent do: [ :anEvent |
		posX := anEvent currentTarget box position x.
		posY := anEvent currentTarget box position y.
		anEvent secondaryButtonPressed
			ifTrue: [ box announceFlag ]
			ifFalse: [
				self box isFlagged ifFalse: [
					box clickIn: field at: posX at: posY ] ] ].

	self addEventHandlerOn: BlElementExtentChangedEvent do: [
		| fontSize |
		fontSize := self width.
		fontSize traceCr.
		(self childNamed: 'text') text fontSize: fontSize ]
]

{ #category : #initialization }
MBoxElement >> initializeText [

	| textElement |
	textElement := BlTextElement new.
	textElement text: 'A' asRopedText.
	textElement text fontName: 'Source Sans Pro'.
	textElement text fontSize: 50.
	textElement text
		when: BlTextStringsInserted send: #textChanged to: textElement;
		when: BlTextsDeleted send: #textChanged to: textElement;
		when: BlTextAttributeAdded send: #textChanged to: textElement;
		when: BlTextAttributesRemoved send: #textChanged to: textElement.
	textElement constraintsDo: [ :c |
		c frame vertical alignCenter.
		c frame horizontal alignCenter ].
	self addChild: textElement as: 'text'
]
