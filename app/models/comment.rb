class Comment < ApplicationRecord
  # Direct associations

  belongs_to :page

  # Indirect associations

  # Validations

  validates :comment, presence: true

  validates :page_id, presence: true

  # Scopes

  def to_s
    comment
  end
end
