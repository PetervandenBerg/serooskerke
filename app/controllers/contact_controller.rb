class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Bericht is succesvol verzonden.")
    else
      flash.now.alert = "Vul alstublieft alle velden in."
      render :new
    end
  end

end