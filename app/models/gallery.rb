class Gallery < ApplicationRecord
  include PgSearch
  multisearchable against: :title

  pg_search_scope(
    :search,
    against: %i(
      title
    ),
    using: {
      tsearch: {
        dictionary: 'english'
      }
    }
  )
end
