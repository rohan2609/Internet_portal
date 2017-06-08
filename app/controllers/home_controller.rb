class HomeController < ApplicationController
  def index
    @message = Home.new
  end

  def create

    @message = Home.new(home_params)

    if @message.valid?
      MessageMailer.new_message(@message).deliver_now
      flash.now[:notice] = "Your messages has been sent."
      else
      flash.now[:error] = "An error occurred while delivering this message."    
    render :new
    end
  end

  def home_1
  end

  def home_2
  end

  def service
  end

  def pricing_plan
  end

  def about_us
  end

  def gallery
  end

  def faq
  end

  def blog_1
  end

  def blog_2
  end

  def blog_single
  end

  def contact
  end

private

def home_params
params.require(:home).permit!
end
end
