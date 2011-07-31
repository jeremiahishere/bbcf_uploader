class Part < ActiveRecord::Base
  belongs_to :instrument
  belongs_to :piece

  # note the attached file must be a pdf or it probably won't work
  has_attached_file :part_file,
    :s3_headers => { 'Content-Disposition' => 'attachment' },
    :styles => { :preview => { :geometry => '135',  :format => :png } },
    :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_video_file_name",
    :url => "/system/:attachment/:id/:style/:normalized_video_file_name" 

  # use an interpolation to set the file name
  Paperclip.interpolates :normalized_video_file_name do |attachment, style|
    attachment.instance.normalized_video_file_name
  end

  # set the file name of the uploaded file to something standardized
  def normalized_video_file_name
    piece_name = piece.name.gsub(/[^a-zA-Z0-9_\.]/, '_')
    instrument_name = instrument.name.gsub(/[^a-zA-Z0-9_\.]/, '_')
    return "#{piece_name}-#{instrument_name}-#{self.id}.pdf" 
  end

  validates_presence_of :instrument_id
  validates_presence_of :piece_id
  validates_attachment_content_type :part_file, :content_type => ['application/pdf']

  def self.instrument_in_program(program, instrument)
    where(["instrument_id = ? and piece_id in (?)", instrument.id, program.pieces])
  end
end
