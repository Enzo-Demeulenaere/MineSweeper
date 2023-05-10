"
I am a box with a mine in the mine field.
If I am clicked by the player, he dies.
"
Class {
	#name : #MMine,
	#superclass : #MBox,
	#category : #'MineSweeper-Core'
}

{ #category : #visiting }
MMine >> accept: aMFieldVisitor [
	^ aMFieldVisitor visitMMine: self
]

{ #category : #clicking }
MMine >> clickIn: aMField at: x at: y [
	announcer announce: MBoxExplosionAnnouncement new.
	aMField gameEnded  
		ifFalse: [ aMField playerLoose]
]

{ #category : #testing }
MMine >> isMineBox [
	^ true
]

{ #category : #printing }
MMine >> printOn: aStream [
	aStream << 'o'
]
