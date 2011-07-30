class Instrument < ActiveRecord::Base
  has_many :parts

  validates_presence_of :name
  validates_numericality_of :score_order

  scope :in_score_order, order(:score_order)
end
