class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :starting_on
      t.date :ending_on
      t.string :status
      t.integer :client_id
      t.integer :guide_id
      t.text :request_message
      t.text :confirmation_message
      t.text :cancellation_message
      t.boolean :client_archive
      t.boolean :guide_archive
      t.integer :total_price
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :bookings, :users, column: :client_id
  end
end
