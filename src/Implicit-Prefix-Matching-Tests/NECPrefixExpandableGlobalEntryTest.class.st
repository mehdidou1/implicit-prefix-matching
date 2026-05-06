Class {
	#name : 'NECPrefixExpandableGlobalEntryTest',
	#superclass : 'TestCase',
	#category : 'Implicit-Prefix-Matching-Tests',
	#package : 'Implicit-Prefix-Matching-Tests'
}

{ #category : 'running' }
NECPrefixExpandableGlobalEntryTest >> setUp [
	super setUp.
]

{ #category : 'tests' }
NECPrefixExpandableGlobalEntryTest >> testCompletionMatchTextCaseSensitivity [
	
	|entry|
	entry := NECPrefixExpandableGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: 'sp'.
	self assert: (entry completionMatchText ) equals: 'SpPresenter'
]

{ #category : 'tests' }
NECPrefixExpandableGlobalEntryTest >> testCompletionMatchTextWhenContentsEmpty [
	
	|entry|
	entry := NECPrefixExpandableGlobalEntry contents: '' node: nil.
	entry implicitPrefix: 'Sp'.
	self assert: (entry completionMatchText ) equals: ''
]

{ #category : 'tests' }
NECPrefixExpandableGlobalEntryTest >> testCompletionMatchTextWhenContentsShorterThanPrefix [
	
	|entry|
	entry := NECPrefixExpandableGlobalEntry contents: 'Sp' node: nil.
	entry implicitPrefix: 'SpAbstract'.
	self assert: (entry completionMatchText ) equals: 'Sp'
]

{ #category : 'tests' }
NECPrefixExpandableGlobalEntryTest >> testCompletionMatchTextWhenExactMatch [
	"the entry and the implicit prefix are exact the same, we should return the contents"
	|entry|
	entry := NECPrefixExpandableGlobalEntry contents: 'Sp' node: nil.
	entry implicitPrefix: 'Sp'.
	self assert: (entry completionMatchText ) equals: 'Sp'
]

{ #category : 'tests' }
NECPrefixExpandableGlobalEntryTest >> testCompletionMatchTextWhenPrefixDoesNotMatchStart [
	
	|entry|
	entry := NECPrefixExpandableGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: 'Co'.
	self assert: (entry completionMatchText ) equals: 'SpPresenter'
]

{ #category : 'tests' }
NECPrefixExpandableGlobalEntryTest >> testCompletionMatchTextWhenPrefixIsEmpty [
	
	|entry|
	entry := NECPrefixExpandableGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: ''.
	self assert: (entry completionMatchText ) equals: 'SpPresenter'
]

{ #category : 'tests' }
NECPrefixExpandableGlobalEntryTest >> testCompletionMatchTextWhenPrefixIsNil [
	
	|entry|
	entry := NECPrefixExpandableGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: nil.
	self assert: (entry completionMatchText ) equals: 'SpPresenter'
]

{ #category : 'tests' }
NECPrefixExpandableGlobalEntryTest >> testCompletionMatchTextWhenPrefixMatch [
	|entry|
	entry := NECPrefixExpandableGlobalEntry contents: 'SpPresenter' node: nil.
	entry implicitPrefix: 'Sp'.
	self assert: (entry completionMatchText ) equals: 'Presenter'
]
