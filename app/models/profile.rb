class Profile < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :password, :presence => true

  # Scopes

  def to_s
    email
  end

end
