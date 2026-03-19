## Vector DB Use Case

### Limitations of Keyword Search

A traditional keyword-based search would NOT suffice for
a law firm searching 500-page contracts. Keyword search
works by finding exact matches between the search term
and document text.

For example, if a lawyer searches "termination clauses"
but the contract uses the phrase "contract dissolution
conditions", the keyword search would return zero results
— causing the lawyer to completely miss critical contract
information.

Legal documents are notorious for using varied formal
language where the same concept can be expressed in
multiple different ways across different contracts.

### Role of a Vector Database

A vector database solves this by working at the level
of meaning. When the lawyer types "What are the
termination clauses?", the system:

1. Converts the question into an embedding using a
   sentence transformer model
2. Compares it against embeddings of every paragraph
   in the contract
3. Returns the paragraphs that are semantically similar
   — regardless of exact wording

This was demonstrated in our embeddings demo where the
query "The bowler took three wickets in one over"
correctly matched "The wicket keeper stumped the batsman
brilliantly" with a similarity score of 0.6322 — despite
having very few words in common.

### Conclusion

For a law firm, a vector database transforms contract
search from rigid keyword matching into intelligent
semantic search — saving lawyers time and reducing
the risk of missing critical information due to
differences in legal terminology.