class CommentsController < ApplicationController
	
	
    def create
     @comment = Comment.new(params[:comment].permit(:title,:body,:article_id))
     @comment.user_id = current_user.id
         if @comment.save
         	 redirect_to :back, notice: "Thank you for the review"
        
        end
    end

end

