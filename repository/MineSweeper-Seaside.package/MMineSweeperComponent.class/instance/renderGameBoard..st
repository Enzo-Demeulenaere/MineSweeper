rendering
renderGameBoard: html
	gameEnded
		ifTrue: [ 
			playerWon
				ifTrue: [ html heading level: 3; with: 'You won.' ]
				ifFalse: [ html heading level: 3; with: 'You loose.' ].
			^ self ].
	field accept: (MOnHtmlExporter new
							htmlRenderer: html;
							yourself)