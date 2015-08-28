class ChangeAircraftSchema < ActiveRecord::Migration
  def change
  	remove_column :aircrafts, :type, :string
  	remove_column :aircrafts, :size, :string
  	add_column :aircrafts, :flight_type, :string
  	add_column :aircrafts, :flight_size, :string
  end
end
