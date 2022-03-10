class Analytic < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :reader_id, :presence => true

  # Scopes

  def to_s
    page.to_s
  end

end
