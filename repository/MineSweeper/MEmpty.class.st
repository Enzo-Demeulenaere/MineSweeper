"
I am an empty box in the mine field.
"
Class {
	#name : #MEmpty,
	#superclass : #MBox,
	#category : 'MineSweeper-Core'
}

{ #category : #visiting }
MEmpty >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMEmpty: self
]

{ #category : #clicking }
MEmpty >> clickIn: aMField at: x at: y [
	aMField replaceCaseAtRow: x column: y by: MClicked new.
	self propagateClickIn: aMField at: x at: y.
	aMField incrementRound.
	aMField hasEmptyBox
		ifFalse: [ aMField playerWin ]
		ifTrue: [ aMField fieldUpdate ]
]

{ #category : #testing }
MEmpty >> isEmptyBox [
	^ true 
]

{ #category : #printing }
MEmpty >> printOn: aStream [
	aStream << '*'
]

{ #category : #clicking }
MEmpty >> propagateClickIn: aMField at: x at: y [
	(aMField hasMineBoxAroundBoxAt: x at: y)
		ifFalse: [ 
			aMField boxesAroundBoxAt: x at: y doWithIndexes: [ :box :i :j |
				box isEmptyBox ifTrue: [ 
					aMField replaceCaseAtRow: i column: j by: MClicked new.
					self propagateClickIn: aMField at: i at: j ] ] ]
]
