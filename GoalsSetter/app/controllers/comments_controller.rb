class CommentsController < ApplicationController
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to :back
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end
  
  def find_commentable
    params.each do |name, value|
      capture = /(.+)_id$/.match(name)
      if capture
        return capture[1].classify.constantize.find(value)
      end
    end
    nil
  end
  
  def comment_params
    params.require(:comment).permit(:body)
  end
    
end
