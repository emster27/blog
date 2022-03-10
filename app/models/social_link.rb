class SocialLink < ApplicationRecord
  # Direct associations

  belongs_to :profile

  # Indirect associations

  # Validations

  validates :password, :presence => true

  # Scopes

  def to_s
    username
  end

end
