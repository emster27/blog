class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :reader

  belongs_to :page

  # Indirect associations

  has_one    :analytic,
             :through => :page,
             :source => :analytics

  # Validations

  # Scopes

  def to_s
    page.to_s
  end

end
