class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :comment, :string
  attribute :page_name, :string
  attribute :reader, :string
  attribute :page_id, :integer

  # Direct associations

  belongs_to :page

  # Indirect associations
end
