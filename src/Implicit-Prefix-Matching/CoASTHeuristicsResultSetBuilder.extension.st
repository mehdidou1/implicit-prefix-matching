Extension { #name : 'CoASTHeuristicsResultSetBuilder' }

{ #category : '*Implicit-Prefix-Matching' }
CoASTHeuristicsResultSetBuilder class >> initializeVariablesHeuristic [

	VariablesHeuristic := OrderedCollection <- {
		                      CoLocalScopeVariablesHeuristic new.
		                      CoWorkspaceVariablesHeuristic new.
		                      CoInstanceAccessibleVariablesHeuristic new.
		                      (CoGlobalVariablesHeuristic new globalVariableFetcherClass: CoDependencyGlobalVariableFetcher).
									(CoGlobalVariablesHeuristic new globalVariableFetcherClass: CoImplicitGlobalVariableFetcher).
		                      CoGlobalVariablesHeuristic new } 
]
