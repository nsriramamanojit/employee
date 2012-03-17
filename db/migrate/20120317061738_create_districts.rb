class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.string  :name, :null=>false
      t.integer :state_id
      t.integer :division_id
      t.string  :description
      t.integer :reference_number       # To Refer District with other Format ex: 10
      t.string  :reference_name         # To Refer District with Reference Name ex: Bihar = BR
      t.boolean :status,:default=>1

      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end

  def self.down
    drop_table :districts
  end
end
