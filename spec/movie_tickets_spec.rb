require 'rails_helper'

RSpec.describe 'Movie tickets tests', type: :system do
  let!(:room) { Room.create(name: 'Sala 1') }
  let!(:movie) do
    movie = Movie.create(name: 'Example movie', description: 'example description')
    movie.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'spiderman.jpeg')), filename: 'spiderman.jpeg')
    movie
  end
  let!(:show_time) { movie.show_times.create(room: room, when: 'morning', date: Date.today) }

  it 'buys 1 tickets' do
    visit show_times_path
    expect(show_time.movie_tickets.count).to be(0)
    click_link 'Seleccionar asientos'
    expect(page).to have_current_path(select_tickets_show_time_path(show_time))
    check 'A1'
    click_button 'Reservar asientos'
    sleep 1
    expect(show_time.movie_tickets.count).to be(1)
  end

  it 'buys consecutive tickets' do
    visit show_times_path
    expect(show_time.movie_tickets.count).to be(0)
    click_link 'Seleccionar asientos'
    expect(page).to have_current_path(select_tickets_show_time_path(show_time))
    check 'A1'
    check 'A2'
    check 'A3'
    click_button 'Reservar asientos'
    sleep 1
    expect(show_time.movie_tickets.count).to be(3)
  end

  it 'doesn\'t buy tickets from different rows' do
    visit show_times_path
    expect(show_time.movie_tickets.count).to be(0)
    click_link 'Seleccionar asientos'
    expect(page).to have_current_path(select_tickets_show_time_path(show_time))
    check 'A1'
    check 'A2'
    check 'B3'
    click_button 'Reservar asientos'
    sleep 1
    expect(page).to have_current_path(select_tickets_show_time_path(show_time))
    expect(show_time.movie_tickets.count).to be(0)
  end
end
