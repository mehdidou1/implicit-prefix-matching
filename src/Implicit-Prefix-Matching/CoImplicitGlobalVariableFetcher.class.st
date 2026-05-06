"
I am a fetcher that looks for candidates beginning with a prefix inferred from the context. I fetch candidates from the global namespace as a fallback.
"
Class {
	#name : 'CoImplicitGlobalVariableFetcher',
	#superclass : 'CoGlobalVariableFetcher',
	#instVars : [
		'completionClass'
	],
	#category : 'Implicit-Prefix-Matching',
	#package : 'Implicit-Prefix-Matching'
}

{ #category : 'enumerating' }
CoImplicitGlobalVariableFetcher >> completionClass: aClass [
	completionClass := aClass
]

{ #category : 'enumerating' }
CoImplicitGlobalVariableFetcher >> entriesDo: aBlock [ 
    | prefix |
    prefix := self inferPrefix.
	completionClass ifNotNil: [ 
    completionClass package definedClasses do: [ :cls |
        (cls name beginsWith: prefix , filter completionString)
            ifTrue: [
                aBlock value: ((CoGlobalEntry
                    contents: cls name node: astNode implicitPrefix: prefix)
                    fetcherName: self class name;
                    yourself) ] ].
	super entriesDo: aBlock ]
]

{ #category : 'inference' }
CoImplicitGlobalVariableFetcher >> inferPrefix [ 
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

{ #category : 'inference' }
CoImplicitGlobalVariableFetcher >> inferPrefixFromClass: aClassName [ 
	"I extract the prefix from a given name of class 
	If the class name start with more than one upper case character, i extract till the (n-1)th uppercase character eg. HTMLParser -> HTML
	if not, I extract till the (index of the second uppercase character -1) eg. SpAbstractPreseenter -> Sp"
    | size index |

    size := aClassName size.
    size = 0 ifTrue: [ ^ '' ].

   
    (size > 1 and: [ (aClassName at: 2) isUppercase ]) ifTrue: [
        index := 1.
        [ index <= size and: [ (aClassName at: index) isUppercase ] ]
            whileTrue: [ index := index + 1 ].
        
		  index > size ifTrue: [ ^ '' ].
        ^ aClassName copyFrom: 1 to: index - 2
    ].
	2 to: size do: [ :i |
        (aClassName at: i) isUppercase ifTrue: [
            ^ aClassName copyFrom: 1 to: i - 1
        ].
    ].

	^ ''
]
