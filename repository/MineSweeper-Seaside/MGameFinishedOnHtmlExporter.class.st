"
I render the MField on an html renderer when the game is finished.
"
Class {
	#name : #MGameFinishedOnHtmlExporter,
	#superclass : #MOnHtmlExporter,
	#category : 'MineSweeper-Seaside'
}

{ #category : #visiting }
MGameFinishedOnHtmlExporter >> visitMMine: aMMMine [
	^ $o
]
