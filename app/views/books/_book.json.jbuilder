json.extract! book, :id, :titulo, :fecha_publicacion, :descripcion, :authors, :genres, :promedio_calificacion, :created_at, :updated_at
json.url book_url(book, format: :json)
