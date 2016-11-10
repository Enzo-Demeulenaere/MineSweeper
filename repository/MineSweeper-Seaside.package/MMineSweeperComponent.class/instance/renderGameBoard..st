rendering
renderGameBoard: html
	gameEnded
		ifTrue: [ 
			playerWon
				ifTrue: [ html heading level: 3; with: 'You won.' ]
				ifFalse: [ html heading level: 3; with: 'You loose.' ].
			^ self ].
	html table with: [ 
		1 to: field width do: [ :i |
			html tableRow with: [ 
				1 to: field height do: [ :j |
					html tableData with: [ 
						html anchor 
							callback: [ 	field clickOnBoxAt: i at: j ];
							with: ((field boxAt: i at:j) asTextForPlayerIn: field at: i at: j)
						 ]
					 ]
				 ]
			 ]
		 ]