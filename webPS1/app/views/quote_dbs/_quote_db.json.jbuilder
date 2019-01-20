json.extract! quote_db, :id, :quote, :author, :category, :created_at, :updated_at
json.url quote_db_url(quote_db, format: :json)
