class Part < ActiveRecord::Base
  belongs_to :instrument
  belongs_to :piece

  # note the attached file must be a pdf or it probably won't work
  has_attached_file :part_file,
    :s3_headers => { 'Content-Disposition' => 'attachment' },
    :styles => { :preview => { :geometry => '135',  :format => :png } },
    :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_part_file_file_name",
    :url => "/system/:attachment/:id/:style/:normalized_part_file_file_name" 


  # the next few methods are the system to update the file name before saving
  # and maintain it when instrument or piece names change
  #
  # A Paperclip interpolater updates the file name and renames the file
  # The interpolator called the normalized file name method
  # The normailzed file name returns the saved name if it exists, or generates a new name
  # When the object saves, the saved name is set if it has not been set yet, to the interpolated name
  # Also checkout the has_attached_file for the path and url of the file
  
  # use an interpolation to set the file name
  Paperclip.interpolates :normalized_part_file_file_name do |attachment, style|
    attachment.instance.normalized_part_file_file_name
  end

  # set the file name of the uploaded file to something standardized
  def normalized_part_file_file_name
    if self.saved_part_file_name
      return self.saved_part_file_name
    else
      piece_name = self.piece.name.gsub(/[^a-zA-Z0-9_\.]/, '_')
      instrument_name = self.instrument.name.gsub(/[^a-zA-Z0-9_\.]/, '_')
      output = "#{piece_name}-#{instrument_name}#{File.extname(self.part_file_file_name)}" 
      return output
    end
  end

  before_save :update_saved_part_file_name

  def update_saved_part_file_name
    self.saved_part_file_name = normalized_part_file_file_name
  end


  validates_presence_of :instrument_id
  validates_presence_of :piece_id

  # this has been removed to a ff/osx bug. See the readme
  # validates_attachment_content_type :part_file, :content_type => ['application/pdf']

  def self.instrument_in_program(program, instrument)
    where(["instrument_id = ? and piece_id in (?)", instrument.id, program.pieces])
  end


end
