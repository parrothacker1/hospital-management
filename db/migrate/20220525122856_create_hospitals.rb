class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :place
      t.integer :bookings
      t.integer :doctors

      t.timestamps
    end
  end
end
