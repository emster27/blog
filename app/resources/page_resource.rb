class PageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :hero_image, :string
  attribute :writer_id, :integer
  attribute :page_name, :string

  # Direct associations

  belongs_to :profile,
             foreign_key: :writer_id

  has_many   :comments

  has_many   :bookmarks

  # Indirect associations
end
