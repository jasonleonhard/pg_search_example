class AddTsvectorColumnsToArticles < ActiveRecord::Migration[5.0]
  def up
    add_column :articles, :tsv, :tsvector
    add_index :articles, :tsv, using: "gin"

    execute <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON articles FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        tsv, 'pg_catalog.english', title, body
      );
    SQL

    now = Time.current.to_s(:db)
    update("UPDATE articles SET updated_at = '#{now}'")
  end

  def down
    execute <<-SQL
      DROP TRIGGER tsvectorupdate
      ON articles
    SQL

    remove_index :articles, :tsv
    remove_column :articles, :tsv
  end
end
