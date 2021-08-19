json.extract! myapp, :id, :first_name, :last_name, :email, :phone, :twitter, :created_at, :updated_at
json.url myapp_url(myapp, format: :json)
