class MessageMailer < ApplicationMailer


  
  default to: "Your Name <dhanshree.j.kamble@gmail.com>"

  def new_message(message)
    @message = message  
    mail subject: "Message from #{message.name}"
  end
end


	