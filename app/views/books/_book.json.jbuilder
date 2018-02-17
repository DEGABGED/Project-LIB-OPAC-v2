json.extract! book, :id, :title, :author, :section, :batch, :size, :callnr, :time_in, :time_out, :status, :created_at, :updated_at
json.url book_url(book, format: :json)
