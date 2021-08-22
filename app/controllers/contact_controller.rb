class ContactController < ApplicationController

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(params[:contact].permit(:message))
    if @contact.valid?
      render("contact/confirm")
    else
      render("contact/new")
    end
  end

  def thanks
    @contact = Contact.new(params[:contact].permit(:message))    
    ContactMailer.send_mail(@contact).deliver
    render("contact/thanks")
  end

end
