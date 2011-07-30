class PieceProgram < ActiveRecord::Base
  belongs_to :piece
  belongs_to :program
end
