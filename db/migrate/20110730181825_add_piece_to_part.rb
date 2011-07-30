class AddPieceToPart < ActiveRecord::Migration
  def self.up
    add_column :parts, :piece_id, :integer
  end

  def self.down
    remove_column :parts, :piece_id
  end
end
