require 'rails_helper'
Capybara.ignore_hidden_elements = false

RSpec.describe 'Movie tests', type: :system do
  let!(:movie_name) {'Venom: Carnage liberado'}
  let!(:movie_description) {'La pelicula marca el regreso de Eddie Brock (Tom Hardy)...' }
  it 'creates a movie' do
    visit(new_movie_path)
    expect(Movie.all.count).to be(0)
    fill_in 'movie_name', with: movie_name
    fill_in 'movie_description', with: movie_description
    attach_file('movie_image', "#{Rails.root}/spec/fixtures/movie_image_test.jpg")
    click_button('Crear película')
    expect(Movie.all.count).to be(1)
  end

  context 'existing movie' do
    let!(:movie) do
      movie = Movie.create(name: movie_name, description: movie_description)
      movie.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'movie_image_test.jpg')), filename: 'movie_image_test.jpg')
      movie
    end

    it 'shows show times of existing movie' do
      visit movies_path
      click_link('Ver funciones')
      expect(page).to have_current_path(movie_show_times_path(movie))
    end

    it 'updates values on edit' do
      visit movies_path
      click_link('Editar película')
      expect(page).to have_current_path(edit_movie_path(movie))
      fill_in 'movie_name', with: 'Venom 2'
      click_button('Editar película')
      visit movie_path(movie)
      expect(find('p', text: 'Nombre')).to have_text('Venom 2')
    end

    it 'destroys the movie' do
      visit movies_path
      expect(all('div[id^=movie]').count).to be(1)
      accept_confirm do
        click_link('Eliminar película')
      end
      expect(all('div[id^=movie]').count).to be(0)
    end
  end
end
