require 'rails_helper'

RSpec.describe 'Show time test', type: :system do
  let!(:room) { Room.create(name: 'Sala 1') }
  let!(:movie) do
    movie = Movie.create(name: 'Example movie', description: 'example description')
    movie.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'spiderman.jpeg')), filename: 'spiderman.jpeg')
    movie
  end

  it 'creates a show time for a movie' do
    visit(new_movie_show_time_path(movie))
    fill_in 'show_time_date', with: '12-12-2021'
    find('#show_time_room_id').find(:xpath, 'option[2]').select_option
    find('#show_time_when').find(:xpath, 'option[2]').select_option
    click_button('Crear función')
    expect(movie.show_times.count).to be(1)
  end
end