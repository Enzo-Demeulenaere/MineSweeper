"
I am an abstract visitor for a MField object.
"
Class {
	#name : #MFieldVisitor,
	#superclass : #Object,
	#category : 'MineSweeper-Visitors'
}

{ #category : #visiting }
MFieldVisitor >> visitMClicked: aMClicked [
	^ self subclassResponsibility
]

{ #category : #visiting }
MFieldVisitor >> visitMEmpty: aMEmpty [
	^ self subclassResponsibility
]

{ #category : #visiting }
MFieldVisitor >> visitMField: aMField [
	^ self subclassResponsibility
]

{ #category : #visiting }
MFieldVisitor >> visitMMine: aMMine [
	^ self subclassResponsibility
]
