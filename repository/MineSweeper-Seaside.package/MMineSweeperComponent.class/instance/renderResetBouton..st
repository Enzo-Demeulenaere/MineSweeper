rendering
renderResetBouton: html
	html anchor
		callback: [ self reset ];
		with: 'Reset'