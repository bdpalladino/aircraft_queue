class CreateFlightQueues < ActiveRecord::Migration
  def change
    create_table :flight_queues do |t|
      t.datetime :enqueued
      t.references :aircraft, index: true

      t.timestamps null: false
    end
    add_foreign_key :flight_queues, :aircrafts
  end
end
