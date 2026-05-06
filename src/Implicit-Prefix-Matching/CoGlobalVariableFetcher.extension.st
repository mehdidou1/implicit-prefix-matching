Extension { #name : 'CoGlobalVariableFetcher' }

{ #category : '*Implicit-Prefix-Matching' }
CoGlobalVariableFetcher >> entriesDo: aBlock [

	self systemNavigation
		allGlobalNamesStartingWith: filter completionString
		do: [ :e |
				aBlock value: ((CoGlobalEntry contents: e node: astNode implicitPrefix: '')
						 fetcherName: self class name;
						 yourself) ]
		caseSensitive: NECPreferences caseSensitive
]
