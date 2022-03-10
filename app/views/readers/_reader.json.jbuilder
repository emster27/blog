json.extract! reader, :id, :email, :reader_name, :created_at, :updated_at
json.url reader_url(reader, format: :json)
