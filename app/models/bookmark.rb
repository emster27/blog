class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :page

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    page.to_s
  end

end
