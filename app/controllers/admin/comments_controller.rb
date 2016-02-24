class Admin::CommentsController < Admin::ApplicationController
  def index
  	# @comments = Comment.where(status: true)
  	if params[:search].present?
  		@comments = Comment.matching_fullname_or_message(params[:search]).page params[:page]
  	else
  		@comments = Comment.where(status: to_boolean(params[:status])).page params[:page]
  	end
  end

  def update
  	@comment = Comment.find(params[:id])
  		if @comment.update(status: params[:status])
  			redirect_to :back, notice: 'Successfully updated comment'
  		else
  			redirect_to :back, notice: 'There a problem updating comment'
  		end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to :back, notice: 'Successfully deleted comment'
  end
end
