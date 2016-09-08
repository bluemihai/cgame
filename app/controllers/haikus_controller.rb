class HaikusController < ApplicationController
  before_action :set_haiku, only: [:show, :edit, :update, :destroy]

  def index
    @haikus = Haiku.all
  end

  def show
  end

  def new
    @haiku = Haiku.new
  end

  def edit
  end

  def create
    @haiku = Haiku.new(haiku_params)

    respond_to do |format|
      if @haiku.save
        format.html { redirect_to new_haiku_path, notice: 'Haiku was successfully created.' }
        format.json { render :show, status: :created, location: @haiku }
      else
        format.html { render :new }
        format.json { render json: @haiku.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @haiku.update(haiku_params)
        format.html { redirect_to haikus_path, notice: 'Haiku was successfully updated.' }
        format.json { render :show, status: :ok, location: @haiku }
      else
        format.html { render :edit }
        format.json { render json: @haiku.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @haiku.destroy
    respond_to do |format|
      format.html { redirect_to haikus_url, notice: 'Haiku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_haiku
      @haiku = Haiku.find(params[:id])
    end

    def haiku_params
      params.require(:haiku).permit(:author_id, :activity_id, :content,
        :activity_name)
    end
end
