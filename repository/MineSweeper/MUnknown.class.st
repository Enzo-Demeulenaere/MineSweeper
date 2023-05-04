"
I'm a box whose status is unknown. It did have been clicked yet.
"
Class {
	#name : #MUnknown,
	#superclass : #MBox,
	#category : #'MineSweeper-Core'
}

{ #category : #visiting }
MUnknown >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMUnknown: self
]

{ #category : #clicking }
MUnknown >> clickIn: aMField at: x at: y [
	(aMField boxAt: x at: y ) announcer announce: (MBoxClickedAnnouncement new).
	aMField replaceBoxAtRow: x column: y by: MClicked new.
	self propagateClickIn: aMField at: x at: y.
	aMField incrementRound.
	"the end of the game is when the player has clicked on all the unknown boxes.
	An alternate solution would be that he tagged all the possible bombs and they are effectively bombs."
	aMField hasUnknownBox
		ifFalse: [ aMField playerWin ]
		ifTrue: [ aMField fieldUpdate ]
]

{ #category : #testing }
MUnknown >> isUnknownBox [
	^ true 
]

{ #category : #printing }
MUnknown >> printOn: aStream [
	aStream << '*'
]

{ #category : #clicking }
MUnknown >> propagateClickIn: aMField at: x at: y [
	(aMField hasMineBoxAroundBoxAt: x at: y)
		ifFalse: [ 
			aMField boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
				box isUnknownBox ifTrue: [ 
					(aMField boxAt: i at: j ) announcer announce: (MBoxClickedAnnouncement new).
					aMField replaceBoxAtRow: i column: j by: MClicked new.
					self propagateClickIn: aMField at: i at: j ] ] ]
]
