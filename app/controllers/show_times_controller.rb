class ShowTimesController < ApplicationController
  before_action :set_show_time, only: %i[ show edit update destroy ]

  # GET /show_times or /show_times.json
  def index
    @show_times = ShowTime.all
  end

  # GET /show_times/1 or /show_times/1.json
  def show
  end

  # GET /show_times/new
  def new
    @show_time = ShowTime.new
  end

  # GET /show_times/1/edit
  def edit
  end

  # POST /show_times or /show_times.json
  def create
    @show_time = ShowTime.new(show_time_params)

    respond_to do |format|
      if @show_time.save
        format.html { redirect_to @show_time, notice: "Show time was successfully created." }
        format.json { render :show, status: :created, location: @show_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @show_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /show_times/1 or /show_times/1.json
  def update
    respond_to do |format|
      if @show_time.update(show_time_params)
        format.html { redirect_to @show_time, notice: "Show time was successfully updated." }
        format.json { render :show, status: :ok, location: @show_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @show_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /show_times/1 or /show_times/1.json
  def destroy
    @show_time.destroy
    respond_to do |format|
      format.html { redirect_to show_times_url, notice: "Show time was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_time
      @show_time = ShowTime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_time_params
      params.fetch(:show_time, {})
    end
end
