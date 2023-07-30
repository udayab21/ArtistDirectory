class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.date :date_of_birth
      t.string :location
      t.string :work
      t.string :email
      t.references :artist_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
