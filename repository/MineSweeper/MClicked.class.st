"
I am an empty box in the mine field that has already been clicked.
"
Class {
	#name : #MClicked,
	#superclass : #MBox,
	#category : #'MineSweeper-Core'
}

{ #category : #visiting }
MClicked >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMClicked: self
]

{ #category : #clicking }
MClicked >> clickIn: aMField at: x at: y [
	"Nothing to be done, player should click somewhere else..."
]

{ #category : #testing }
MClicked >> isClickedBox [
	^ true
]

{ #category : #printing }
MClicked >> printOn: aStream [
	aStream << '_'
]
