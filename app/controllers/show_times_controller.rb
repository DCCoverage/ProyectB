class ShowTimesController < ApplicationController
  before_action :set_show_time,
                only: %i[
                  show
                  edit
                  update
                  destroy
                  select_tickets
                  purchase_tickets
                ]
  before_action :set_movie, only: %i[new create index]

  def index
    @show_times = @movie ? @movie.show_times : ShowTime.where(date: Date.today)
  end

  def show; end

  def new
    @show_time = @movie.show_times.new
  end

  def edit; end

  def create
    @show_time = @movie.show_times.new(show_time_params)

    respond_to do |format|
      if @show_time.save
        format.html do
          redirect_to movie_show_times_path(@movie, @show_time), notice: 'Función creada con éxito.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @show_time.update(show_time_params)
        format.html do
          redirect_to movie_show_times_path(@show_time.movie, @show_time),
                      notice: 'Función actualizada con éxito.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    movie = @show_time.movie
    @show_time.destroy
    respond_to do |format|
      format.html do
        redirect_to movie_show_times_url(movie),
                    notice: 'Función eliminada con éxito.'
      end
      format.json { head :no_content }
    end
  end

  def select_tickets
    respond_to do |format|
      @occupied_tickets =
        @show_time
          .movie_tickets
          .all
          .map { |ticket| "#{ticket.row}-#{ticket.column}" }
      format.html { render :select_tickets, locals: { tickets_error: nil } }
    end
  end

  def purchase_tickets
    respond_to do |format|
      prev = nil
      ActiveRecord::Base.transaction do
        params[:tickets].each do |ticket, value|
          next unless value == '1'
          raise 'Los asientos seleccionados no son de la misma fila' if !prev.nil? && prev != ticket[0]
          row, column = ticket.split('-')
          MovieTicket.create! row: row, column: column, show_time: @show_time
          prev = ticket[0]
        end
      end
    rescue ActiveRecord::RecordInvalid => e
      format.html do
        redirect_to select_tickets_show_time_path(@show_time),
                    flash: {
                      error: e.record.errors.values.map(&:join).join(' ')
                    }
      end
    rescue StandardError => e
      format.html do
        redirect_to select_tickets_show_time_path(@show_time),
                    flash: {
                      error: e.message
                    }
      end
    rescue ActiveRecord::RecordNotUnique
      format.html do
        redirect_to select_tickets_show_time_path(@show_time),
                    notice: 'Seleccionaste asientos que ya están ocupados'
      end
    else
      format.html do
        redirect_to movie_show_times_path(@show_time.movie, @show_time),
                    notice: 'Asientos reservados correctamente'
      end
    end
  end

  private

  def set_show_time
    @show_time = ShowTime.find(params[:id])
  end

  def show_time_params
    params.require(:show_time).permit(:movie_id, :room_id, :when, :date)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id]) if params[:movie_id]
  end
end
