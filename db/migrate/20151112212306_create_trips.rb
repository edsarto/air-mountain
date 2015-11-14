class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :price_per_hour
      t.string :city
      t.text :policy
      t.integer :guide_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
