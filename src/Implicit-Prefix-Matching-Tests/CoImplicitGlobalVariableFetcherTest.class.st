Class {
	#name : 'CoImplicitGlobalVariableFetcherTest',
	#superclass : 'TestCase',
	#instVars : [
		'fetcher'
	],
	#category : 'Implicit-Prefix-Matching-Tests',
	#package : 'Implicit-Prefix-Matching-Tests'
}

{ #category : 'running' }
CoImplicitGlobalVariableFetcherTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	fetcher := CoImplicitGlobalVariableFetcher new.
]

{ #category : 'tests' }
CoImplicitGlobalVariableFetcherTest >> testInferPrefixFromClassWhenEmptyString [ 
	self assert: (fetcher inferPrefixFromClass: '') equals: ''
]

{ #category : 'tests' }
CoImplicitGlobalVariableFetcherTest >> testInferPrefixFromClassWhenNoSecondUpperCaseCharacter [ 
	self assert: (fetcher inferPrefixFromClass: 'Hello') equals: ''
]

{ #category : 'tests' }
CoImplicitGlobalVariableFetcherTest >> testInferPrefixFromClassWhenOnlyUpperCaseCharactersReturnsEmptyString [ 
	self assert: (fetcher inferPrefixFromClass: 'FOO') equals: ''
]

{ #category : 'tests' }
CoImplicitGlobalVariableFetcherTest >> testInferPrefixFromClassWhenSingleUpperCaseFollowedByLowerCase [ 
	self assert: (fetcher inferPrefixFromClass: 'SpAbstractWidgetPresenter') equals: 'Sp'
]

{ #category : 'tests' }
CoImplicitGlobalVariableFetcherTest >> testInferPrefixFromClassWithMultipleUpperCaseCharacters [ 
	self assert: (fetcher inferPrefixFromClass: 'OSNullBackendWindow') equals: 'OS'
]

{ #category : 'tests' }
CoImplicitGlobalVariableFetcherTest >> testInferPrefixWhenCompletionClassIsNil [ 
	fetcher completionClass: nil. 
	self assert: (fetcher inferPrefix ) equals: ''
]

{ #category : 'tests' }
CoImplicitGlobalVariableFetcherTest >> testInferPrefixWhithDominantPrefix [ 
	fetcher completionClass: SpPresenter .
	self assert: (fetcher inferPrefix ) equals: 'Sp'
]
