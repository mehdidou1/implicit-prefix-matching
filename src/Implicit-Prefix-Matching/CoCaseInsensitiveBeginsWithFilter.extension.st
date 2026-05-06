Extension { #name : 'CoCaseInsensitiveBeginsWithFilter' }

{ #category : '*Implicit-Prefix-Matching' }
CoCaseInsensitiveBeginsWithFilter >> accepts: aCandidate [

	^ aCandidate completionMatchText asLowercase beginsWith: completionString asLowercase
]
