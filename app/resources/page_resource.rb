class PageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :hero_image, :string
  attribute :page_name, :string
  attribute :page_content, :string
  attribute :comment, :string

  # Direct associations

  has_many   :comments

  has_many   :bookmarks

  # Indirect associations
end
