class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :page_id, :integer
  attribute :reader_id, :integer
  attribute :reader_name, :string
  attribute :reader_email, :string

  # Direct associations

  belongs_to :page

  # Indirect associations

end
