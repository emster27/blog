class Reader < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :reader_name, :presence => true

  # Scopes

  def to_s
    email
  end

end
