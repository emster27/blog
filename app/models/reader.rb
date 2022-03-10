class Reader < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :reader_name, :presence => true

  # Scopes

  def to_s
    email
  end

end
