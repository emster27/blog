class AnalyticResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :page_id, :integer
  attribute :reader_location, :string
  attribute :view_count, :integer
  attribute :reader_id, :integer

  # Direct associations

  belongs_to :page

  # Indirect associations

  has_one    :bookmark
end
