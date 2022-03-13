json.extract! page, :id, :hero_image, :page_name, :page_content, :comment,
              :created_at, :updated_at
json.url page_url(page, format: :json)
