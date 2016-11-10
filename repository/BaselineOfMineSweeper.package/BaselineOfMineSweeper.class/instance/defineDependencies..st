baseline
defineDependencies: spec
	^ spec
		baseline: 'Seaside3' with: [
			spec repository: 'github://SeasideSt/Seaside:master/repository'  ];
		yourself