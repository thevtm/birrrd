class RemoveStatusFromRentals < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :status, :datatype
  end
end
