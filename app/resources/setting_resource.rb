class SettingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :owner_info, :string
  attribute :billing, :string
  attribute :billing_card, :integer
  attribute :domains, :string
  attribute :profile_id, :integer

  # Direct associations

  belongs_to :profile

  # Indirect associations
end
