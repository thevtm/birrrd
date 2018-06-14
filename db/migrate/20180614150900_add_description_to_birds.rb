class AddDescriptionToBirds < ActiveRecord::Migration[5.2]
  def change
    add_column :birds, :description, :text
  end
end
