Extension { #name : 'CoGlobalVariableFetcher' }

{ #category : '*Implicit-Prefix-Matching' }
CoGlobalVariableFetcher >> completionClass: aClass [
	completionClass := aClass
]

{ #category : '*Implicit-Prefix-Matching' }
CoGlobalVariableFetcher >> entriesDo: aBlock [ 
    | prefix |
    prefix := self inferPrefix.
    completionClass ifNil: [ ^ self ].
    completionClass package definedClasses do: [ :cls |
        (cls name beginsWith: prefix , filter completionString)
            ifTrue: [
                aBlock value: ((NECPrefixExpandableGlobalEntry
                    contents: cls name node: astNode implicitPrefix: prefix)
                    fetcherName: self class name;
                    yourself) ] ].
    self systemNavigation
        allGlobalNamesStartingWith: filter completionString
        do: [ :e |
            aBlock value: ((CoGlobalEntry contents: e node: astNode)
                fetcherName: self class name;
                yourself) ]
        caseSensitive: NECPreferences caseSensitive

]

{ #category : '*Implicit-Prefix-Matching' }
CoGlobalVariableFetcher >> inferPrefix [ 
    | prefixes baseName packages |

	completionClass ifNil: [ ^'' ].

    prefixes := Dictionary new.

    baseName := completionClass package name copyUpTo: $-.

    packages := PackageOrganizer default packages select: [ :pkg |
        pkg name beginsWith: baseName , '-'
    ].

    packages do: [ :pkg |
        pkg definedClasses do: [ :cls |
            | prefix |

            prefix := self inferPrefixFromClass: cls name.

            prefix isEmpty ifFalse: [
                prefixes
                    at: prefix
                    put: ((prefixes at: prefix ifAbsent: [ 0 ]) + 1)
            ].
        ].
    ].


	prefixes isEmpty ifTrue: [ ^'' ].
    ^ (prefixes associations sorted: [ :a :b | a value > b value ]) first key

]

{ #category : '*Implicit-Prefix-Matching' }
CoGlobalVariableFetcher >> inferPrefixFromClass: aClassName [ 
    | seenLowercase |
    seenLowercase := false.

    1 to: aClassName size do: [ :index |
        | char |
        char := aClassName at: index.

        char isLowercase ifTrue: [
            seenLowercase := true
        ].

        (char isUppercase and: [ seenLowercase and: [ index > 1 ] ]) ifTrue: [
            ^ aClassName copyFrom: 1 to: index - 1
        ].
    ].

    ^ ''
]
