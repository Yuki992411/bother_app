class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    @boards = case params[:board_params].to_i
                when 1
                  @boards.order(created_at: :desc)
                when 2
                  @boards.order(updated_at: :desc)
                when 3
                  @boards.order(star_rate: :desc)
                when 4
                   Board.where(user_id: @current_user.id)
                else
                  @boards.all
              end
    @boards = @boards.page(params[:page])
  end
  
  def new
    if @current_user
      @board = Board.new(flash[:board])
      @board.name = @current_user.name
    else
      redirect_to root_path, flash: { notice: "ログインをすることで新たに掲示板を作成することができます" } 
    end
  end
#createのveiwページ(html.erb)はないねー
  def create
    board = Board.new(board_params)
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    if @current_user
      temp = @board.comments.pluck(:star).compact.map(&:to_f)
      if temp.size != 0
        @board.update_attribute(:star_rate, temp.inject(:+)/temp.size)
      else 
        @board.update_attribute(:star_rate, 0.0)
      end
      @comment = Comment.new(board_id: @board.id)
    else
      redirect_to root_path, flash: { notice: "ログインをすることで内容を閲覧することができます" }
    end
  end

  def edit
  end
  
  def update
#updateのveiwページ(html.erb)はないね
    if @board.update(board_params)
      flash[:notice] = "「#{@board.title}」の掲示板を更新しました！"
      redirect_to @board
    else
#edit_board_path or back
      redirect_to edit_board_path, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
  end

  def destroy 
    @board.destroy
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました" }
  end
  private

  def board_params
    params.require(:board).permit(:user_id, :name, :title, :body, :star_rate, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end
end
