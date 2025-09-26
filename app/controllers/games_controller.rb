class GamesController < ApplicationController

  def index
    @games = Game.all
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(games_params)
    @game.user = current_user
    respond_to do |format|
      if @game.save
        format.html { redirect_to games_path, notice: "Game added!" }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(games_params)
      redirect_to game_path(@game), notice: "Game updated successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, status: :see_other
  end

  private

  def games_params
    params.require(:game).permit(:title, :platform, :status)
  end
end
