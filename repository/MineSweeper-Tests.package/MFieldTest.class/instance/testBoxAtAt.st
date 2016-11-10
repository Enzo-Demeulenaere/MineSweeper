tests-accessing
testBoxAtAt
	self
		assert: (field boxAt: 1 at: 1) isEmptyBox;
		assert: (field boxAt: 1 at: 2) isEmptyBox;
		assert: (field boxAt: 1 at: 3) isMineBox;
		assert: (field boxAt: 1 at: 4) isEmptyBox;
		assert: (field boxAt: 1 at: 5) isEmptyBox;
		assert: (field boxAt: 2 at: 1) isEmptyBox;
		assert: (field boxAt: 2 at: 2) isEmptyBox;
		assert: (field boxAt: 2 at: 3) isMineBox;
		assert: (field boxAt: 2 at: 4) isEmptyBox;
		assert: (field boxAt: 2 at: 5) isEmptyBox;
		assert: (field boxAt: 3 at: 1) isMineBox;
		assert: (field boxAt: 3 at: 2) isMineBox;
		assert: (field boxAt: 3 at: 3) isMineBox;
		assert: (field boxAt: 3 at: 4) isEmptyBox;
		assert: (field boxAt: 3 at: 5) isEmptyBox;
		assert: (field boxAt: 4 at: 1) isEmptyBox;
		assert: (field boxAt: 4 at: 2) isEmptyBox;
		assert: (field boxAt: 4 at: 3) isEmptyBox;
		assert: (field boxAt: 4 at: 4) isMineBox;
		assert: (field boxAt: 4 at: 5) isMineBox;
		assert: (field boxAt: 5 at: 1) isMineBox;
		assert: (field boxAt: 5 at: 2) isEmptyBox;
		assert: (field boxAt: 5 at: 3) isEmptyBox;
		assert: (field boxAt: 5 at: 4) isEmptyBox;
		assert: (field boxAt: 5 at: 5) isEmptyBox