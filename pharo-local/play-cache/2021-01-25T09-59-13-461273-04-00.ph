| typeInfo block regex tCFactory |block := [ (SStack 				newStackWith: (OrderedCollection new             		add: 12;            		add: -2;            		add: 'hello';            		add: #nameOf;            		add: ((SSTeacher name: 'Johan' with: 15)            			nickname;            			canRegister: ((SConference price: 50) offerPrice: 50);            			idTeacher;            			yearsWorkExperience);            			yourself )) firstLinkStack;            lastLinkStack;            top;            push: 4;            pop ] .regex := 'SmallSuiteGenerator-Scenario'.typeInfo := STypeInfo asTypeInfo: (        SSTypeCollector profile: block onPackagesMatching: regex)."then, we use the type information to generate tests"tCFactory := STestCaseFactoryPharo new    targetClassName: #SStack;	typeInfo: typeInfo;    targetPackageRegex: regex;    outputPackageName: 'Generated';    numberOfGenerations: 5;    numberOfStatements: 10;    populationSize: 11;     seed: 345643;     seedBlock: block;	 selectionStrategy: SGATournamentSelection;    mutationRate: 1;	 generateViews;    createTestCases;    yourself.tCFactory