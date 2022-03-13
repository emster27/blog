class BookmarkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :page_id, :integer
  attribute :reader_id, :integer

  # Direct associations

  belongs_to :reader

  belongs_to :page

  # Indirect associations
end
