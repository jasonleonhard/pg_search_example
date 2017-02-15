PgSearch.multisearch_options = {
  using: {
    tsearch:    { tsvector_column: "tsv" },
    trigram:    { threshold:  0.1 },
    dmetaphone: {}
  }
}
