Class {
	#name : 'CoGlobalVariableFetcherTest',
	#superclass : 'TestCase',
	#instVars : [
		'fetcher',
		'expectedElements'
	],
	#category : 'Implicit-Prefix-Matching-Tests',
	#package : 'Implicit-Prefix-Matching-Tests'
}

{ #category : 'running' }
CoGlobalVariableFetcherTest >> setUp [
	super setUp .

	fetcher := CoGlobalVariableFetcher new.
	fetcher systemNavigation: self systemNavigation.

	expectedElements := {
		CoGlobalEntry contents: 'A' node: nil.
		CoGlobalEntry contents: 'B' node: nil.
		CoGlobalEntry contents: 'C' node: nil. }
]

{ #category : 'running' }
CoGlobalVariableFetcherTest >> testInferPrefixFromClassWhenEmptyString [
	self assert: (fetcher inferPrefixFromClass: '') equals: ''
]

{ #category : 'running' }
CoGlobalVariableFetcherTest >> testInferPrefixFromClassWhenNoSecondUpperCaseCharacter [
	self assert: (fetcher inferPrefixFromClass: 'Hello') equals: ''
]

{ #category : 'running' }
CoGlobalVariableFetcherTest >> testInferPrefixFromClassWhenOnlyUpperCaseCharactersReturnsEmptyString [
	self assert: (fetcher inferPrefixFromClass: 'FOO') equals: ''
]

{ #category : 'running' }
CoGlobalVariableFetcherTest >> testInferPrefixFromClassWhenSingleUpperCaseFollowedByLowerCase [
	self assert: (fetcher inferPrefixFromClass: 'SpAbstractWidgetPresenter') equals: 'Sp'
]

{ #category : 'running' }
CoGlobalVariableFetcherTest >> testInferPrefixFromClassWithMultipleUpperCaseCharacters [
	self assert: (fetcher inferPrefixFromClass: 'OSNullBackendWindow') equals: 'OS'
]

{ #category : 'running' }
CoGlobalVariableFetcherTest >> testInferPrefixWhenCompletionClassIsNil [
	fetcher completionClass: nil. 
	self assert: (fetcher inferPrefix ) equals: ''
]

{ #category : 'running' }
CoGlobalVariableFetcherTest >> testInferPrefixWhithDominantPrefix [ 
	fetcher completionClass: SpPresenter .
	self assert: (fetcher inferPrefix ) equals: 'Sp'
]
