class CreatePieceToPrograms < ActiveRecord::Migration
  def self.up
    create_table :piece_programs do |t|
      t.integer :piece_id
      t.integer :program_id
    end
  end

  def self.down
    drop_table :piece_programs
  end
end
