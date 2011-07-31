class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.integer :instrument_id
      t.text :description
      t.string :part_file_file_name
      t.string :part_file_content_type
      t.integer :part_file_file_size
      t.datetime :part_file_updated_at
      t.string :saved_part_file_name

      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
