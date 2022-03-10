json.extract! social_link, :id, :username, :medium, :password, :profile_id,
              :created_at, :updated_at
json.url social_link_url(social_link, format: :json)
