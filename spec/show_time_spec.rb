require 'rails_helper'

RSpec.describe 'Show time tests', type: :system do
  let!(:room) { Room.create(name: 'Sala 1') }
  let!(:movie) do
    movie = Movie.create(name: 'Example movie', description: 'example description')
    movie.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'spiderman.jpeg')), filename: 'spiderman.jpeg')
    movie
  end

  it 'creates a show time for a movie' do
    visit movies_path
    click_link('Agregar función')
    expect(page).to have_current_path(new_movie_show_time_path(movie))
    fill_in 'show_time_date', with: '12-12-2021'
    find('#show_time_room_id').find(:xpath, 'option[2]').select_option
    find('#show_time_when').find(:xpath, 'option[2]').select_option
    click_button('Crear función')
    expect(movie.show_times.count).to be(1)
  end

  context 'existing show time' do
    let!(:show_time) { movie.show_times.create(room: room, when: 'morning', date: Date.today) }
    it 'shows detail of created show time' do
      visit show_times_path
      click_link('Detalle')
      expect(find('.title')).to have_text('Example movie')
    end

    it 'updates values on edit' do
      visit edit_show_time_path(show_time)
      fill_in 'show_time_date', with: '12-12-2021'
      click_button('Editar función')
      visit show_time_path(show_time)
      expect(find('p', text: 'Fecha')).to have_text('2021-12-12')
    end

    it 'destroys the show time' do
      visit show_times_path
      expect(all('table#show-times tr').count).to be(2)
      accept_confirm do
        click_link('Eliminar')
      end
      expect(all('table#show-times tr').count).to be(1)
    end
  end

  context 'different movies & showtimes' do
    let!(:second_movie) do
      movie = Movie.create(name: 'Example movie 2', description: 'example description 2')
      movie.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'spiderman.jpeg')), filename: 'spiderman.jpeg')
      movie
    end

    let!(:show_time_1) { movie.show_times.create!(room: room, when: 'morning', date: Date.today) }
    let!(:show_time_2) { second_movie.show_times.create!(room: room, when: 'afternoon', date: Date.today) }
    let!(:show_time_3) { second_movie.show_times.create!(room: room, when: 'morning', date: Date.tomorrow) }

    it 'shows today show times on index' do
      visit show_times_path
      expect(all('table#show-times tr').count).to be(3)
    end

    it 'shows movie\'s show times on nested index' do
      visit movie_show_times_path(second_movie)
      expect(all('table#show-times tr').count).to be(3)
    end
  end
end
