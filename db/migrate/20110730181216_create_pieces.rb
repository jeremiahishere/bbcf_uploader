class CreatePieces < ActiveRecord::Migration
  def self.up
    create_table :pieces do |t|
      t.string :name
      t.string :composer
      t.string :arranger
      t.string :inventory_number
      t.string :version_number
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :pieces
  end
end
