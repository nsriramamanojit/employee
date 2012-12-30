class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.string  :name, :null=>false
      t.string  :description
      t.string  :url
      t.integer :category_id, :null=>false
      t.boolean :status,:default=>1

      #download
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at

      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
