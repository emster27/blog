json.extract! comment, :id, :reader_name, :reader_email, :comment, :page_id,
              :created_at, :updated_at
json.url comment_url(comment, format: :json)
