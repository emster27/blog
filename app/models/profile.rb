class Profile < ApplicationRecord
  # Direct associations

  has_many   :social_links,
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :password, presence: true

  # Scopes

  def to_s
    email
  end
end
