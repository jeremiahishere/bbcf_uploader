class Piece < ActiveRecord::Base
  has_many :parts
  has_many :piece_programs, :class_name => "PieceProgram"
  has_many :programs, :through => :piece_programs

  validates_presence_of :name

  def composer_and_arranger
    output = ""
    if !self.composer.empty?
      output += self.composer
    end
    if !self.arranger.empty?
      if !output.empty?
        output += ", "
      end
      output += self.arranger
    end
    return output
  end

  def inventory_and_version
    output = ""
    if !self.inventory_number.empty?
      output += self.inventory_number
    end
    if !self.version_number.empty?
      if !output.empty?
        output += ", "
      end
      output += self.version_number
    end
    return output
  end

end
