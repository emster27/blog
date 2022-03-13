class Page < ApplicationRecord
  mount_base64_uploader :hero_image, HeroImageUploader

  # Direct associations

  has_many   :comments,
             dependent: :destroy

  has_many   :bookmarks,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
