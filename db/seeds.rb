# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# room_1 = Room.create(name: 'Sala 1')
# room_2 = Room.create(name: 'Sala 2')
Room.create(name: 'Sala 1')
Room.create(name: 'Sala 2')
Room.create(name: 'Sala 3')
Room.create(name: 'Sala 4')
Room.create(name: 'Sala 5')
Room.create(name: 'Sala 6')
Room.create(name: 'Sala 7')
Room.create(name: 'Sala 8')


# movie_1 = Movie.create(name: 'Spiderman', description: 'La película se centra en el genio adolescente marginado Peter Parker , quien desarrolla habilidades sobrehumanas parecidas a las de una araña después de ser mordido por una araña genéticamente alterada.', image:'https://www.milenio.com/uploads/media/2021/11/22/spiderman-way-home-fecha-estreno.jpg')
# movie_2 = Movie.create(name: 'Star Wars', description: 'Dos Jedis, Qui-Gon Jinn y su Padawan Obi-Wan Kenobi deben proteger a la reina Amidala. En medio de la misión conocen a un niño llamado Anakin Skywalker quien forma parte de una antigua profecía Jedi pues es el elegido que traerá equilibrio a la galaxia. Los enemigos de esta saga son los Sith.', image:'https://i.blogs.es/69fdcc/star-wars-saga/1366_2000.jpg')




# ShowTime.create({
#     movie_id: movie_1.id,
#     room_id: room_1.id,
#     when: 'morning'
#   }, without_protection: true)

# ShowTime.create({
#     movie_id: movie_1.id,
#     room_id: room_1.id,
#     when: 'afternoon'
#   }, without_protection: true)


# ShowTime.create({
#     movie_id: movie_2.id,
#     room_id: room_1.id,
#     when: 'afternoon'
#   }, without_protection: true)

# ShowTime.create({
#     movie_id: movie_1.id,
#     room_id: room_2.id,
#     when: 'morning'
#   }, without_protection: true)