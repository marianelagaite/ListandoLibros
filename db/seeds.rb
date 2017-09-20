# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@bases = []
@bases << BaseList.create!(nombre: 'En pausa')
@bases << BaseList.create!(nombre: 'Leyendo')
@bases << BaseList.create!(nombre: 'Dejados')
@bases << BaseList.create!(nombre: 'Completados')
@bases << BaseList.create!(nombre: 'Deseo leer')

@admin = User.create!(user_name: 'admin', email: 'admin@admin.com', password:'admin', password_confirmation:'admin', admin: true )
@comun = User.create!(user_name: 'comun', email: 'comun@comun.com', password:'comun', password_confirmation:'comun', admin: false )


@bases.each do |base|
	@admin.book_lists.create(nombre: base.nombre)
	@comun.book_lists.create(nombre: base.nombre)
end


# @book1 = Book.create!(titulo: 'El nombre del viento', descripcion: 'El primer libro de las crónicas del asesino de reyes', image: File.new("/home/marian/Descargas/el-nombre-del-viento.jpg"))
# @book2 = Book.create!(titulo: 'Harry Potter y la piedra filosofal', descripcion: 'El primer libro del chico mago', image: File.new("/home/marian/Descargas/harry-potter-1.jpeg"))
# @book3 = Book.create!(titulo: 'Harry Potter y la camara secreta', descripcion: 'El segundo libro del chico mago', image: File.new("/home/marian/Descargas/harry-potter-2.jpeg"))
# @book4 = Book.create!(titulo: 'Cancion de hielo y fuego - Juego de tronos', descripcion: 'El primer libro de cancion de hielo y fuego', image: File.new("/home/marian/Descargas/juego-de-tronos-saga-completa-cancion-hielo-y-fuego.jpg"))

# @book1.authors.create(nombre: 'Patrick Rothfuss')
@rowling = Author.create!(nombre: 'J. K. Rowling')
# @book2.authors << @rowling
# @book3.authors << @rowling
# @book4.authors.create(nombre: 'George R. R. Martin')

@fantasia = Genre.create!(nombre: 'Fantasia', descripcion: '90 porciento de las veces basado en la edad media europea')
@drama = Genre.create!(nombre:'Drama', descripcion: "snif snif")

# beginBook.all.each do |book|
#	book.genres << @fantasia
# end
# @book1.genres << @drama