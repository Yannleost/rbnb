class AddAdressAndCoordinatesToFlat < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :address, :string
    add_column :flats, :latitude, :float
    add_column :flats, :longitude, :float
  end
end
