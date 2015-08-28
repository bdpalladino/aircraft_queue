class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :flight_num
      t.string :type
      t.string :size

      t.timestamps null: false
    end
  end
end
