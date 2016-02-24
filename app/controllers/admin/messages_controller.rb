class Admin::MessagesController < Admin::ApplicationController
  def index
  	if params[:search].present?
  		@messages = Message.matching_fullname_or_content(params[:search]).page params[:page]
  	else
  		@messages = Message.all.order(id: :desc).page params[:page]
  	end
  end

  def show
  	@message = Message.find(params[:id])
  	@message.mark_read
  end

  def update
  	@message = Message.find(params[:id])
  	@message.update(status: params[:status])

  	redirect_to :back, notice: 'Succesfully updated message'
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy

  	redirect_to :back, notice: 'Succesfully deleted message'
  end
end
