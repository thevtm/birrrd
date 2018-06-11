class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :location
      t.float :price
    end
  end
end
