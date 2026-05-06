Class {
	#name : 'BaselineOfImplicitPrefixMatching',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfImplicitPrefixMatching',
	#package : 'BaselineOfImplicitPrefixMatching'
}

{ #category : 'baselines' }
BaselineOfImplicitPrefixMatching >> baseline: spec [

	spec for: #'common' do: [
		spec postLoadDoIt: #postLoad . 
		spec 
			package: #'Implicit-Prefix-Matching';
			package: #'Implicit-Prefix-Matching-Tests' with: [
				spec requires: #('Implicit-Prefix-Matching' ) ].
		]
]

{ #category : 'baselines' }
BaselineOfImplicitPrefixMatching >> postLoad [ 


	CoASTHeuristicsResultSetBuilder initialize.
]
