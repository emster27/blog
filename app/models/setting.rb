class Setting < ApplicationRecord
  # Direct associations

  belongs_to :profile

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    owner_info
  end
end
