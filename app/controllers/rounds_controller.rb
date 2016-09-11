class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  def index
    @rounds = Round.all
  end

  def show
  end

  def new
    @round = Round.new
  end

  def edit
  end

  def create
    @round = Round.new(round_params)

    respond_to do |format|
      if @round.save
        group = @round.groups.create!(round: @round)
        format.html { redirect_to edit_group_path(group), notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to edit_game_path(@round.game), notice: 'Round was successfully updated.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_url, notice: 'Round was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_round
      @round = Round.find(params[:id])
    end

    def round_params
      params.require(:round).permit(:game_id, :order, :method_split)
    end
end
