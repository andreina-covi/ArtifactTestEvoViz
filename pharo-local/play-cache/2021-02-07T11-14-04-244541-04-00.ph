| block typeInfo tCFactory |block := [ B2ClipVertexTest new         testFp;        testInEdge1;        testInEdge2;        testInitialize;        testOutEdge1;        testV;        testOutEdge2 ].typeInfo := STypeInfo asTypeInfo: (SSTypeCollector profile: block onPackagesMatching: 'Box2DLite*').tCFactory := STestCaseFactoryPharo new 	targetClassName: #B2ClipVertex;	typeInfo: typeInfo;	targetPackageRegex: 'Box2DLite*';	outputPackageName: 'Generated';	numberOfGenerations: 5;	numberOfStatements: 5;	populationSize: 10;	seed: 6745;	mutationRate: 2/3;	seedBlock: block;	selectionStrategy: SGATournamentSelection;	generateViews;	createTestCases;	yourself.	tCFactory inspect