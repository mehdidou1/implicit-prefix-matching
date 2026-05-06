"
I represent an entry that begins with entries.
"
Class {
	#name : 'NECPrefixExpandableGlobalEntry',
	#superclass : 'CoGlobalEntry',
	#instVars : [
		'implicitPrefix'
	],
	#category : 'Implicit-Prefix-Matching',
	#package : 'Implicit-Prefix-Matching'
}

{ #category : 'as yet unclassified' }
NECPrefixExpandableGlobalEntry class >> contents: aString node: aNode implicitPrefix: aPrefix [

	^ self new
		contents: aString node: aNode;
		implicitPrefix: aPrefix;
		yourself
]

{ #category : 'matching' }
NECPrefixExpandableGlobalEntry >> completionMatchText [

	(
			 implicitPrefix isNotNil and: [
				 implicitPrefix notEmpty and: [ self contents size > implicitPrefix size and: [ self contents beginsWith: implicitPrefix ] ] ])
		ifTrue: [ ^ self contents allButFirst: implicitPrefix size ].

	^ super completionMatchText
]

{ #category : 'matching' }
NECPrefixExpandableGlobalEntry >> implicitPrefix [

	^ implicitPrefix
]

{ #category : 'accessing' }
NECPrefixExpandableGlobalEntry >> implicitPrefix: aString [ 

	implicitPrefix := aString
]
