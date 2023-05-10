Class {
	#name : #MBoxEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'field'
	],
	#category : #'MineSweeper-Elements'
}

{ #category : #'mouse handlers' }
MBoxEventListener >> clickEvent: anEvent [
	|posX posY targetBox|
	posX:= (anEvent position x) //50 +1.
	posY:= (anEvent position y) //50 +1.
	targetBox := anEvent currentTarget box.
	Transcript show: 'fais moi signe si tu proc'; cr; open
	"anEvent secondaryButtonPressed 
		ifTrue: [ 
			targetBox announceFlag]
		ifFalse: [ 
			targetBox 
				clickIn: self field 
				at: posY 
				at: posX. ]"


	
	
]

{ #category : #accessing }
MBoxEventListener >> field [ 
	^ field
]

{ #category : #accessing }
MBoxEventListener >> field: aMField [
	field:= aMField 
]
