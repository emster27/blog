require "open-uri"
class Analytic < ApplicationRecord
  before_validation :geocode_reader_location

  def geocode_reader_location
    if reader_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(reader_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.reader_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.reader_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.reader_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :page

  # Indirect associations

  has_one    :bookmark,
             through: :page,
             source: :bookmarks

  # Validations

  validates :page_id, presence: true

  validates :reader_id, presence: true

  # Scopes

  def to_s
    page.to_s
  end
end
