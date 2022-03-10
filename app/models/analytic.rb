class Analytic < ApplicationRecord
  # Direct associations

  belongs_to :page

  # Indirect associations

  has_one    :bookmark,
             :through => :page,
             :source => :bookmarks

  # Validations

  validates :page_id, :presence => true

  validates :reader_id, :presence => true

  # Scopes

  def to_s
    page.to_s
  end

end
