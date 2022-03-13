class Comment < ApplicationRecord
  # Direct associations

  belongs_to :page

  # Indirect associations

  # Validations

  validates :comment, presence: true

  # Scopes

  def to_s
    reader_name
  end
end
