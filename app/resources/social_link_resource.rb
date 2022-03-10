class SocialLinkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :username, :string
  attribute :medium, :string
  attribute :password, :string
  attribute :profile_id, :integer

  # Direct associations

  belongs_to :profile

  # Indirect associations

end
