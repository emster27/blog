json.extract! comment, :id, :comment, :page_name, :reader, :page_id,
              :created_at, :updated_at
json.url comment_url(comment, format: :json)
