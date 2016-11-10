baseline
defineGroups: spec
	^ spec
			group: 'core' with: #('MineSweeper' 'MineSweeper-Tests');
			group: 'seaside' with: #(#core 'MineSweeper-Seaside');
			yourself