class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.references :user, index: true
      t.references :doctor, index: true
      t.string     :name
      t.string     :phone
      t.timestamps
      t.timestamps
    end
  end
end
