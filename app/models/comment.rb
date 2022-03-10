class Comment < ApplicationRecord
  # Direct associations

  belongs_to :reader

  belongs_to :page

  # Indirect associations

  # Validations

  validates :reader_name, presence: true

  # Scopes

  def to_s
    page.to_s
  end
end
