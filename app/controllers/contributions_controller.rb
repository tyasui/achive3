class ContributionsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_contribution, only: [:show, :edit, :update, :destroy]
  
  def index
    @contributions=Contribution.all
  end
  
  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
    @comment = @contribution.comments.build
    @comments = @contribution.comments
  end
  
  
  def new
    if params[:back]
      @contribution = Contribution.new(contributions_params)
    else
      @contribution = Contribution.new
    end
  end

  def create
    @contribution = Contribution.create(contributions_params)
    @contribution.user_id = current_user.id
    if @contribution.save
      redirect_to contributions_path, notice: "投稿しました！"
      NoticeMailer.sendmail_contribution(@contribution).deliver
    else
      render 'new'
    end
  end
  

  def edit
    @contribution = Contribution.find(params[:id])
  end
  
  def update
    @contribution = Contribution.find(params[:id])
    if @contribution.update(contributions_params)
      redirect_to contributions_path, notice: "ツイートの編集をしました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    redirect_to contributions_path, notice: "ツイートの削除をしました！"
  end
  
  def confirm
    @contribution = Contribution.new(contributions_params)
    render :new if @contribution.invalid?
  end

  
private

  def contributions_params
      params.require(:contribution).permit(:content, :picture, :picture_cache, :remove_picture)
  end
  
  def set_contribution
    @contribution = Contribution.find(params[:id])
  end
    
end
