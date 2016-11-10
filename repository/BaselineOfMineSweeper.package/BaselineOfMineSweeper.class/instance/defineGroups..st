baseline
defineGroups: spec
	^ spec
			group: 'core' with: #('MineSweeper' 'MineSweeper-tests');
			group: 'seaside' with: #(#core 'MineSweeper-Seaside');
			yourself