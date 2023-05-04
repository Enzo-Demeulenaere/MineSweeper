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
	Transcript show: anEvent currentTarget box class ; cr.
	posX:= (anEvent position x) //50 +1.
	posY:= (anEvent position y) //50 +1.
	Transcript show: posX; cr.
	Transcript show: posY; cr.
	anEvent currentTarget box clickIn: self field at: posY at: posX.
	anEvent currentTarget click 

	
]

{ #category : #accessing }
MBoxEventListener >> field [ 
	^ field
]

{ #category : #accessing }
MBoxEventListener >> field: aMField [
	field:= aMField 
]
