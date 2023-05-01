"
I render the MField on an html renderer while the player is still playing (i.e. have not loose or win yet).
"
Class {
	#name : #MOnHtmlExporter,
	#superclass : #MFieldVisitor,
	#instVars : [
		'htmlRenderer',
		'field',
		'currentRow',
		'currentColumn'
	],
	#category : 'MineSweeper-Seaside'
}

{ #category : #accessing }
MOnHtmlExporter >> htmlRenderer [
	^ htmlRenderer
]

{ #category : #accessing }
MOnHtmlExporter >> htmlRenderer: anObject [
	htmlRenderer := anObject
]

{ #category : #visiting }
MOnHtmlExporter >> visitMClicked: aMClicked [
	|count|
	count := (field mineCountAroundBoxAt: currentRow at: currentColumn).
	count = 0
		ifTrue: [ ^ $_ ].
	^ count asString
]

{ #category : #visiting }
MOnHtmlExporter >> visitMEmpty: aMEmpty [
	^ $*
]

{ #category : #visiting }
MOnHtmlExporter >> visitMField: aMField [
	field := aMField.
	self htmlRenderer table with: [ 
		1 to: aMField height do: [ :row |
			currentRow := row.
			self htmlRenderer tableRow with: [ 
				1 to: aMField width do: [ :column |
					currentColumn := column.
					self htmlRenderer tableData with: [ 
						self htmlRenderer anchor 
							callback: [ 	aMField clickOnBoxAt: row at: column ];
							with: ((aMField boxAt: row at: column) accept: self) ] ] ] ] ]
]

{ #category : #visiting }
MOnHtmlExporter >> visitMMine: aMMMine [
	^ $*
]
