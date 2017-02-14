class Article < ApplicationRecord
  include PgSearch
  multisearchable against: [:title, :body]

  pg_search_scope(
    :search,
    against: %i(
      title
      body
    ),
    using: {
      tsearch: {
        dictionary: 'english'
      }
    }
  )
end
