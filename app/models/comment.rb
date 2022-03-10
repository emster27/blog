class Comment < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :reader_name, :presence => true

  # Scopes

  def to_s
    page.to_s
  end

end
