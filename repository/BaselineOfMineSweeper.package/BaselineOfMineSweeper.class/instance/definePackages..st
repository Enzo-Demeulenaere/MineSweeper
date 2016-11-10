baseline
definePackages: spec
	^ spec
		package: 'MineSweeper';
		package: 'MineSweeper-Tests' with: [ spec requires: #('MineSweeper') ];
		package: 'MineSweeper-Seaside' with: [ spec requires: #('MineSweeper' 'Seaside3') ];
		yourself