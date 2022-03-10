class Page < ApplicationRecord
  # Direct associations

  has_many   :analytics,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
