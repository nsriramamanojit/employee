class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|

      t.integer :user_id
      t.date    :date
      t.text    :report

      t.integer :created_by
      t.integer :modified_by


      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
