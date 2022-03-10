class ReaderResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :reader_name, :string

  # Direct associations

  has_many   :bookmarks

  has_many   :comments

  # Indirect associations

end
