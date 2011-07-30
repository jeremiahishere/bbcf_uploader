class Piece < ActiveRecord::Base
  has_many :parts
  has_many :piece_programs, :class_name => "PieceProgram"
  has_many :programs, :through => :piece_programs

  validates_presence_of :name

end
