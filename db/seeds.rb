Gallery.create title: 'Star Wars'
Article.create title: 'Luke', body: 'Not the greatest'

# EXAMPLES THAT WORK AND THAT DO NOT
# rails c

# YES
# search = PgSearch.multisearch 'star Wers'
# search.map { |s| s.searchable.title }.inspect

# YES
# search = PgSearch.multisearch 'not the greatist'
# search.map { |s| s.searchable.body }.inspect

# YES
# search = PgSearch.multisearch 'not'
# search.map { |s| s.searchable.body }.inspect

# YES
# search = PgSearch.multisearch 'the'
# search.map { |s| s.searchable.body }.inspect

# YES
# search = PgSearch.multisearch 'greatist'
# search.map { |s| s.searchable.body }.inspect

# YES
# search = PgSearch.multisearch 'no th gre'
# search.map { |s| s.searchable.body }.inspect

# YES
# search = PgSearch.multisearch 'no th gre'
# search.map { |s| s.searchable.body }.inspect

# YES
# search = PgSearch.multisearch 'no th ret'
# search.map { |s| s.searchable.body }.inspect

# YES
# search = PgSearch.multisearch 'n th ret'
# search.map { |s| s.searchable.body }.inspect

# YES
# search = PgSearch.multisearch 'luk'
# search.map { |s| s.searchable.title }.inspect

# NO
# search = PgSearch.multisearch 'th ret'
# search.map { |s| s.searchable.body }.inspect

# NO
# search = PgSearch.multisearch 'no'
# search.map { |s| s.searchable.body }.inspect

# NO
# search = PgSearch.multisearch 'Lu'
# search.map { |s| s.searchable.title }.inspect
