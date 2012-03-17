class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string  :name, :null=>false
      t.string  :description
      t.integer :reference_number       # To Refer State with other Format ex: 10
      t.string  :reference_name         # To Refer State with Reference Name ex: Bihar = BR
      t.boolean :status,:default=>1

      t.integer :created_by
      t.integer :modified_by


      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
