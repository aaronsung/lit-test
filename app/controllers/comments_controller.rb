class CommentsController < ApplicationController
    def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    editor = 'Visitor'
    if session[:user_name] != nil
      editor = session[:user_name]
    end
    @comment.editor = editor
    @comment.save
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:editor, :body)
    end
end
