json.extract! profile, :id, :email, :password, :account_type, :dob, :created_at, :updated_at
json.url profile_url(profile, format: :json)
