"
I am a MineSweeper root component for Seaside.
"
Class {
	#name : #MMineSweeperComponent,
	#superclass : #WAComponent,
	#instVars : [
		'field'
	],
	#category : 'MineSweeper-Seaside'
}

{ #category : #testing }
MMineSweeperComponent class >> canBeRoot [
	^ true
]

{ #category : #accessing }
MMineSweeperComponent class >> description [
	^ 'The famous mine-sweeper game!'
]

{ #category : #accessing }
MMineSweeperComponent class >> handlerName [
	^ 'minesweeper'
]

{ #category : #'class initialization' }
MMineSweeperComponent class >> initialize [
	WAAdmin register: self asApplicationAt: self handlerName
]

{ #category : #initialization }
MMineSweeperComponent >> initialize [
	super initialize.
	self reset
]

{ #category : #rendering }
MMineSweeperComponent >> renderContentOn: html [
	self renderRoundCount: html.
	self renderGameBoard: html.
	self renderResetBouton: html
]

{ #category : #rendering }
MMineSweeperComponent >> renderGameBoard: html [
	field gameEnded
		ifTrue: [
			field accept: (MGameFinishedOnHtmlExporter new
									htmlRenderer: html;
									yourself).
			field playerWon
				ifTrue: [ html heading level: 3; with: 'You won.' ]
				ifFalse: [ html heading level: 3; with: 'You loose.' ].
			^ self ].
	field accept: (MOnHtmlExporter new
							htmlRenderer: html;
							yourself)
]

{ #category : #rendering }
MMineSweeperComponent >> renderResetBouton: html [
	html anchor
		callback: [ self reset ];
		with: 'Reset'
]

{ #category : #rendering }
MMineSweeperComponent >> renderRoundCount: html [
	html heading
		with: [ html text: ('Round: {1}' format: { field round }) ]
]

{ #category : #resetting }
MMineSweeperComponent >> reset [
	self resetField
]

{ #category : #resetting }
MMineSweeperComponent >> resetField [
	field := MField width: 50 height: 20
]
