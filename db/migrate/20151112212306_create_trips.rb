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
    add_foreign_key :trips, :users, column: :guide_id
  end
end
