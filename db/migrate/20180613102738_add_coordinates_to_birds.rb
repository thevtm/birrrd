class AddCoordinatesToBirds < ActiveRecord::Migration[5.2]
  def change
    add_column :birds, :latitude, :float
    add_column :birds, :longitude, :float
  end
end
