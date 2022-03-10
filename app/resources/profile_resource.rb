class ProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :account_type, :string
  attribute :dob, :string

  # Direct associations

  has_many   :pages,
             foreign_key: :writer_id

  has_many   :social_links

  # Indirect associations

end
