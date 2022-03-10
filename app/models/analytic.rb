class Analytic < ApplicationRecord
  # Direct associations

  belongs_to :page

  # Indirect associations

  # Validations

  validates :page_id, :presence => true

  validates :reader_id, :presence => true

  # Scopes

  def to_s
    page.to_s
  end

end
