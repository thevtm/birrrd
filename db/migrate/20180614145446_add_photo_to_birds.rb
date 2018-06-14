class AddPhotoToBirds < ActiveRecord::Migration[5.2]
  def change
    add_column :birds, :photo, :string
  end
end
