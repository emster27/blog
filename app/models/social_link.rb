class SocialLink < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :password, :presence => true

  # Scopes

  def to_s
    username
  end

end
