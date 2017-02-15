class AddTsvectorColumnsToGalleries < ActiveRecord::Migration[5.0]
  def up
    add_column :galleries, :tsv, :tsvector
    add_index :galleries, :tsv, using: "gin"

    execute <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON galleries FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        tsv, 'pg_catalog.english', title
      );
    SQL

    now = Time.current.to_s(:db)
    update("UPDATE galleries SET updated_at = '#{now}'")
  end

  def down
    execute <<-SQL
      DROP TRIGGER tsvectorupdate
      ON galleries
    SQL

    remove_index :galleries, :tsv
    remove_column :galleries, :tsv
  end
end
