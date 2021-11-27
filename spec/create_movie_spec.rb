require 'rails_helper'
Capybara.ignore_hidden_elements = false

RSpec.describe 'Create Movie', type: :system do
    it 'creates a movie' do
        visit(new_movie_path)
        fill_in 'movie_name', :with => 'Venom: Carnage liberado'
        fill_in 'movie_description', :with => 'La pelicula marca el regreso de Eddie Brock (Tom Hardy), el astuto periodista y reportero que, despues de quedar infectado, experimento radicales cambios en su cuerpo y adquirio los poderes del simbionte Venom, que usa a Brock como huesped y le convertio en un despiadado y peligroso supervillano. En esta ocasion, Venom se reencontrara con Cletus Cassady, mas conocido como Carnage, el enemigo mas sangriento de la historia de Spider-Man.' 
        attach_file('movie_image', "#{Rails.root}/spec/fixtures/movie_image_test.jpg")
        click_button('Crear película')
        expect(page).to have_content('Movie was successfully created.')
    end
end 