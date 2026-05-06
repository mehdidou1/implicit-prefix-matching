Extension { #name : 'CoGlobalEntry' }

{ #category : '*Implicit-Prefix-Matching' }
CoGlobalEntry >> completionMatchText [
    self propertyAt: #implicitPrefix
        ifPresent: [:prefix |
            (prefix isNotEmpty
                and: [ self contents size > prefix size
                and: [ self contents beginsWith: prefix ] ])
                ifTrue: [ ^ self contents allButFirst: prefix size ]
                ifFalse: [ ^ super completionMatchText ] ]
        ifAbsent: [ ^'' ]
]

{ #category : '*Implicit-Prefix-Matching' }
CoGlobalEntry >> implicitPrefix [

	^ self propertyAt: #implicitPrefix ifAbsent: [ Error signal: 'No implicitPrefix' ]
]

{ #category : '*Implicit-Prefix-Matching' }
CoGlobalEntry >> implicitPrefix: aString [ 

	self propertyAt: #implicitPrefix put: aString
]
