Extension { #name : 'CoCaseSensitiveBeginsWithFilter' }

{ #category : '*Implicit-Prefix-Matching' }
CoCaseSensitiveBeginsWithFilter >> accepts: aCandidate [

	^ aCandidate completionMatchText asString beginsWith: completionString
]
