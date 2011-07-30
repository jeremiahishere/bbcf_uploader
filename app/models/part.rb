class Part < ActiveRecord::Base
  belongs_to :instrument
  belongs_to :piece

  has_attached_file :part_file,
    :s3_headers => { 'Content-Disposition' => 'attachment' },
    :styles => { :preview => { :geometry => '135',  :format => :png } }

  validates_presence_of :instrument_id
  validates_presence_of :piece_id
  validates_attachment_content_type :part_file, :content_type => ['application/pdf']

  def self.instrument_in_program(program, instrument)
    where(["instrument_id = ? and piece_id in (?)", instrument.id, program.pieces])
  end
end
