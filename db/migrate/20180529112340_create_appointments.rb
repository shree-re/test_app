class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :user, index: true
      t.references :doctor, index: true
      t.references :patient, index: true
      t.string :disease
      t.timestamps
    end
  end
end
