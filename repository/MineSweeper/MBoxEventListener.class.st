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
	|posX posY|
	
	posX:= (anEvent position x) //50 +1.
	posY:= (anEvent position y) //50 +1.
	
	anEvent currentTarget box clickIn: self field at: posY at: posX.
	anEvent currentTarget click.
	
	
]

{ #category : #accessing }
MBoxEventListener >> field [ 
	^ field
]

{ #category : #accessing }
MBoxEventListener >> field: aMField [
	field:= aMField 
]
