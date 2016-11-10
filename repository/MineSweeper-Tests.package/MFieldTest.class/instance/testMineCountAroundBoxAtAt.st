tests-box api
testMineCountAroundBoxAtAt
	self
		assert: (field mineCountAroundBoxAt: 1 at: 1) equals: 0;
		assert: (field mineCountAroundBoxAt: 1 at: 2) equals: 2;
		assert: (field mineCountAroundBoxAt: 1 at: 3) equals: 1;
		assert: (field mineCountAroundBoxAt: 1 at: 4) equals: 2;
		assert: (field mineCountAroundBoxAt: 1 at: 5) equals: 0;
		assert: (field mineCountAroundBoxAt: 2 at: 1) equals: 2;
		assert: (field mineCountAroundBoxAt: 2 at: 2) equals: 5;
		assert: (field mineCountAroundBoxAt: 2 at: 3) equals: 3;
		assert: (field mineCountAroundBoxAt: 2 at: 4) equals: 3;
		assert: (field mineCountAroundBoxAt: 2 at: 5) equals: 0;
		assert: (field mineCountAroundBoxAt: 3 at: 1) equals: 1;
		assert: (field mineCountAroundBoxAt: 3 at: 2) equals: 3;
		assert: (field mineCountAroundBoxAt: 3 at: 3) equals: 3;
		assert: (field mineCountAroundBoxAt: 3 at: 4) equals: 4;
		assert: (field mineCountAroundBoxAt: 3 at: 5) equals: 2;
		assert: (field mineCountAroundBoxAt: 4 at: 1) equals: 3;
		assert: (field mineCountAroundBoxAt: 4 at: 2) equals: 4;
		assert: (field mineCountAroundBoxAt: 4 at: 3) equals: 3;
		assert: (field mineCountAroundBoxAt: 4 at: 4) equals: 2;
		assert: (field mineCountAroundBoxAt: 4 at: 5) equals: 1;
		assert: (field mineCountAroundBoxAt: 5 at: 1) equals: 0;
		assert: (field mineCountAroundBoxAt: 5 at: 2) equals: 1;
		assert: (field mineCountAroundBoxAt: 5 at: 3) equals: 1;
		assert: (field mineCountAroundBoxAt: 5 at: 4) equals: 2;
		assert: (field mineCountAroundBoxAt: 5 at: 5) equals: 2