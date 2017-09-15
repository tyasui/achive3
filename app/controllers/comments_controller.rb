class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    # Contributionをパラメータの値から探し出し,Contributionに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @contribution = @comment.contribution
    # クライアント要求に応じてフォーマットを変更
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to contribution_path(@contribution), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

#############################################
  def destroy
    @comment = Comment.destroy(params[:id])
    @contribution = @comment.contribution

    respond_to do |format|
        format.html { redirect_to contribution_path(@contribution), notice: 'コメントを投稿しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end


  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @contribution = @comment.contribution
    
        respond_to do |format|
        format.html { redirect_to contribution_path(@contribution), notice: 'コメントを投稿しました。' }
        # JS形式でレスポンスを返します。
        format.js { render :index }
    end
    
    #redirect_to comments#index, notice: "コメントを編集しました！"
  end  

#############################################



  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:contribution_id, :content)
    end
end
