class PageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :hero_image, :string
  attribute :writer_id, :integer

  # Direct associations

  has_many   :analytics

  has_many   :comments

  # Indirect associations

end
