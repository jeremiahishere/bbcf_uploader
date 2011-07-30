class Program < ActiveRecord::Base
  has_many :piece_programs, :class_name => "PieceProgram"
  has_many :pieces, :through => :piece_programs

  scope :current, where(["date >= ?", Date.today])

  def current?
    return self.date >= Date.today
  end
end
