instance creation
width: width height: height
	^ self matrix: ((Matrix rows: height columns: width) collect: [ :e | MBox randomCase ])