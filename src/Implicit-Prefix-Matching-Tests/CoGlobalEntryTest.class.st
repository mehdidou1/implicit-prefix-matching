Class {
	#name : 'CoGlobalEntryTest',
	#superclass : 'TestCase',
	#category : 'Implicit-Prefix-Matching-Tests',
	#package : 'Implicit-Prefix-Matching-Tests'
}

{ #category : 'tests' }
CoGlobalEntryTest >> testCompletionMatchTextCaseSensitivity [ 
	
	|entry|
	entry := CoGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: 'sp'.
	self assert: (entry completionMatchText ) equals: 'SpPresenter'
]

{ #category : 'tests' }
CoGlobalEntryTest >> testCompletionMatchTextWhenContentsEmpty [ 
	
	|entry|
	entry := CoGlobalEntry contents: '' node: nil.
	entry implicitPrefix: 'Sp'.
	self assert: (entry completionMatchText ) equals: ''
]

{ #category : 'tests' }
CoGlobalEntryTest >> testCompletionMatchTextWhenContentsShorterThanPrefix [ 
	
	|entry|
	entry := CoGlobalEntry contents: 'Sp' node: nil.
	entry implicitPrefix: 'SpAbstract'.
	self assert: (entry completionMatchText ) equals: 'Sp'
]

{ #category : 'tests' }
CoGlobalEntryTest >> testCompletionMatchTextWhenExactMatch [ 
	"the entry and the implicit prefix are exact the same, we should return the contents"
	|entry|
	entry := CoGlobalEntry contents: 'Sp' node: nil.
	entry implicitPrefix: 'Sp'.
	self assert: (entry completionMatchText ) equals: 'Sp'
]

{ #category : 'tests' }
CoGlobalEntryTest >> testCompletionMatchTextWhenPrefixDoesNotMatchStart [
	
	|entry|
	entry := CoGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: 'Co'.
	self assert: (entry completionMatchText ) equals: 'SpPresenter'
]

{ #category : 'tests' }
CoGlobalEntryTest >> testCompletionMatchTextWhenPrefixIsEmpty [ 
	
	|entry|
	entry := CoGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: ''.
	self assert: (entry completionMatchText ) equals: 'SpPresenter'
]

{ #category : 'tests' }
CoGlobalEntryTest >> testCompletionMatchTextWhenPrefixIsNil [ 
	
	|entry|
	entry := CoGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: nil.
	self assert: (entry completionMatchText ) equals: 'SpPresenter'
]

{ #category : 'tests' }
CoGlobalEntryTest >> testCompletionMatchTextWhenPrefixMatch [ 
	|entry|
	entry := CoGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: 'Sp'.
	self assert: (entry completionMatchText ) equals: 'Presenter'
]
