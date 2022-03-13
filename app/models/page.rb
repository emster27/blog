class Page < ApplicationRecord
  mount_base64_uploader :hero_image, HeroImageUploader

  # Direct associations

  belongs_to :profile,
             foreign_key: "writer_id"

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
