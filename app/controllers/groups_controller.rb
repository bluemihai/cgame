class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :admin_only!

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
    @available_player_ids = @group.available_players.map(&:id)
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to edit_group_path(@group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to edit_game_path(@group.game), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    game = @group.game
    @group.destroy
    respond_to do |format|
      format.html { redirect_to edit_game_path(game), notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:round_id, :activity_id, :wild_card,
        :wc_interpretation, :wc_curation, :instigator_id, participant_ids: [])
    end
end
