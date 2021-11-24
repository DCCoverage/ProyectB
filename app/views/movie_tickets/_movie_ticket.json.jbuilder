json.extract! movie_ticket, :id, :show_time_id, :row, :column, :created_at, :updated_at
json.url movie_ticket_url(movie_ticket, format: :json)
