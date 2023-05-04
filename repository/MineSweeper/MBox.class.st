"
I am an abstract box held by the mine field.
"
Class {
	#name : #MBox,
	#superclass : #MVisitableObject,
	#instVars : [
		'announcer'
	],
	#category : #'MineSweeper-Core'
}

{ #category : #'subclass instance creation' }
MBox class >> clicked [
	^ MClicked new
]

{ #category : #'subclass instance creation' }
MBox class >> mine [
	^ MMine new
]

{ #category : #'random subclass instance creation' }
MBox class >> randomCase [
	^ (1 to: 10) atRandom > 9
			ifTrue: [ self mine ]
			ifFalse: [ self unknown ].
]

{ #category : #'subclass instance creation' }
MBox class >> unknown [
	^ MUnknown new
]

{ #category : #accessing }
MBox >> announcer [ 
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #clicking }
MBox >> clickIn: aMField at: x at: y [
	self subclassResponsibility
]

{ #category : #testing }
MBox >> isClickedBox [
	^ false
]

{ #category : #testing }
MBox >> isMineBox [
	^ false
]

{ #category : #testing }
MBox >> isUnknownBox [
	^ false
]
