class MessagesController < ApplicationController
  before_action :authenticate_user!
  def new
    @message= Message.new
  end
  def create
    @message = current_user.messages.new(report_params)
    if @message.save
       flash[:notice] = "Your message has been sent. We will get back to you soon."
       redirect_to root_path
    else
      flash[:alert] = "Sorry! Your report was not sent. Try again"
      redirect_to messages_new_path
    end
  end
  private
  def report_params
    params.require(:message).permit(:title, :description)
  end
end
