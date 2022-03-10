json.extract! comment, :id, :page_id, :reader_id, :reader_name, :reader_email, :created_at, :updated_at
json.url comment_url(comment, format: :json)
