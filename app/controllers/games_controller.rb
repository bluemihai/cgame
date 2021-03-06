class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :admin_only!, except: [:index, :show]

  def index
    @games = Game.upcoming
    @past = Game.past
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        (1..3).each do |idx|
          @game.rounds.create(order: idx)
        end
        format.html { redirect_to @game, notice: 'Game successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:starting, :ending, :location_id, :host_id,
        :cohost_id, :facebook_event_url, :review, :decoration, :color, :name,
        :status, :container_id, :container_weeks, :blurb,
        activity_ids: [], user_ids: [])
    end
end
