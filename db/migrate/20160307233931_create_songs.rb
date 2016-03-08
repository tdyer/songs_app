class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      # default will have an id column
      # which will serve as the Primary Key
      # PK - is a unique value that identifies a row
      # in a table.
      t.string :title
      t.string :artist_name
      t.integer :duration
      t.decimal :price

      # default will create these 2 columns
      # updated_at and created_at
      t.timestamps null: false
    end
  end
end
