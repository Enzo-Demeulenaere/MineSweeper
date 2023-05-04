Class {
	#name : #MBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'field',
		'size',
		'clicked'
	],
	#category : #'MineSweeper-Elements'
}

{ #category : #'as yet unclassified' }
MBoxElement >> aeDrawClickedSideOn: aeCanvas [ 
	"Draw card's flipped side on an Alexandrie canvas"

	| aFTFace cairoScaledFont cairoGlyphsArray baseline boxPosX boxPosY |
	aFTFace := AeFontManager globalInstance
		detectFamilyName: 'Source Sans Pro'
		slant: AeFontSlant normal
		weight: AeFontWeight normal
		stretch: AeFontStretch normal
		ifNone: [ AeFontManager globalInstance defaultFace ].
	cairoScaledFont := aeCanvas
		scaledFontForFace: aFTFace
		size: 50.

	boxPosX := (self box position x) //50 +1.
	boxPosY := (self box position y) //50 +1.
	cairoGlyphsArray := cairoScaledFont glyphArrayForString: (self field mineCountAroundBoxAt: boxPosX  at: boxPosY).

	aeCanvas
		textExtentsFor: cairoGlyphsArray
		scaledFont: cairoScaledFont
		do: [ :aTextExtents |
			"Calculate the baseline required to center the 
			symbol, both horizontally and vertically:"
			baseline := ((self extent
				- (aTextExtents width @ aTextExtents height)) / 2.0)
				- (aTextExtents bearingX @ aTextExtents bearingY) ].

	aeCanvas restoreContextAfter: [ 
		aeCanvas pathTranslate: baseline.
		aeCanvas setSourceColor: Color blue.
		aeCanvas drawText: cairoGlyphsArray font: cairoScaledFont ].

]

{ #category : #'as yet unclassified' }
MBoxElement >> aeDrawGeometryOn: aeCanvas [
	"Draw this card on an Alexandrie canvas"

	aeCanvas
		pathFactory: [ :cairoContext |
			cairoContext
				roundedRectangleTo: self size
				radius: 2];
		setBackgroundWith: [
			aeCanvas setSourceColor: self backgroundPaint ];
		drawFigureAndPrepareToClip.
		
	self box isClickedBox 
		ifTrue: [ self aeDrawClickedSideOn: aeCanvas  ]
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
	
	box announcer when: MBoxClickedAnnouncement send: #disappear to: self 
]

{ #category : #public }
MBoxElement >> click [ 
	clicked:= true
]

{ #category : #'as yet unclassified' }
MBoxElement >> disappear [ 
	self visibility: BlVisibility hidden
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
	self size: 48.
	
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
