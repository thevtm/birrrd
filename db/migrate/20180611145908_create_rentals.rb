class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :user, foreign_key: true
      t.references :bird, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :status
    end
  end
end
