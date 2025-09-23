class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
  end
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(games_params)
    if @game.save
      redirect_to @game, notice: "Game added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def games_params
    params.require(:game).permit(:title, :platform, :status)
  end
end
