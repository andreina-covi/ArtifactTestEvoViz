| block typeInfo tCFactory |block:= [ | points json result |        points := Array with: 1@2 with: 3@4 with: 5@6.        json := String streamContents: [ :out |                (NeoJSONWriter on: out)                        prettyPrint: true;                        mapInstVarsFor: Point;                        nextPut: points ].             result := (NeoJSONReader on: json readStream)                mapInstVarsFor: Point;                for: #ListOfPoints customDo: [ :mapping |                        mapping listOfElementSchema: Point ];                nextAs: #ListOfPoints.        result = points.                      result := (NeoJSONReader on: json readStream)                mapInstVarsFor: Point;                nextListAs: Point.        result = points.              result := (NeoJSONReader on: json readStream)                mapInstVarsFor: Point;                for: #OrderedCollectionOfPoints customDo: [ :mapping |                        mapping listOfType: OrderedCollection andElementSchema: Point ];                nextAs: #OrderedCollectionOfPoints.        result = points asOrderedCollection. ].typeInfo := STypeInfo asTypeInfo: (        SSTypeCollector profile: block onPackagesMatching: 'Neo-JSON*').        tCFactory := STestCaseFactoryPharo new	 targetClassName: #NeoJSONObjectMapping;    typeInfo: typeInfo;    targetPackageRegex: 'Neo-JSON*';    outputPackageName: 'Generated';    numberOfGenerations: 5;    numberOfStatements: 5;    populationSize: 15;	 mutationRate: 2/3;    seed: 76533;    seedBlock: block;    selectionStrategy: SGARankSelection;	 generateViews;    createTestCases;    yourself.tCFactory inspect