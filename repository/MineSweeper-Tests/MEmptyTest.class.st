"
A MEmptyTest is a test class for testing the behavior of MEmpty
"
Class {
	#name : #MEmptyTest,
	#superclass : #TestCase,
	#traits : 'MTestResources',
	#classTraits : 'MTestResources classTrait',
	#instVars : [
		'field'
	],
	#category : 'MineSweeper-Tests'
}

{ #category : #running }
MEmptyTest >> setUp [
	field := MField matrix: self matrixForField
]

{ #category : #'tests-clicking' }
MEmptyTest >> testClickInAtAt [
	field clickOnBoxAt: 1 at: 1.
	self
		assert: (field boxAt: 1 at: 1) isClickedBox;
		assert: (field boxAt: 1 at: 2) isClickedBox;
		assert: (field boxAt: 2 at: 1) isClickedBox;
		assert: (field boxAt: 2 at: 2) isClickedBox
]
