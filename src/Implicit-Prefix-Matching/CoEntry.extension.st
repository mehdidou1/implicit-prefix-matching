Extension { #name : 'CoEntry' }

{ #category : '*Implicit-Prefix-Matching' }
CoEntry >> completionMatchText [

	self halt.
	^ self contents
]
