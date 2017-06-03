class CustomersController < InheritedResources::Base


skip_before_action :verify_authenticity_token, :only => [:payu_return]


	 def payu_return
    begin
      notification = PayuIndia::Notification.new(request.query_string, options = {:key => 'gtKFFx', :salt => 'eCwWELxi', :params => params})    
      @payment = Payment.find(notification.invoice)  # invoice is nothing but the payment_id
      if notification.acknowledge
        begin
          if notification.complete?
            @payment.status = params[:status]
            @payment.paid_at = params[:addedon]
            @payment.card_num = params[:cardnum]
            @payment.ip = request.remote_ip
            @payment.Payer_id = params[:mihpayid]
            flash[:notice] = "Payment Done successfully!!!"
            redirect_to payments_url
          else
            @payment.status = "failed"
            flash[:notice] = "Payment fail!. Please try again"
            redirect_to @payment    #show.html.erb
         end
        ensure
          @payment.save
        end
      end
    rescue
      flash[:notice] = "something goes wrong ! please try again after some times!!!"
      redirect_to customers_path
    end
  end

  private

    def customer_params
      params.require(:customer).permit(:fullname, :dob, :mobile_no, :phone_no, :email, :kyc, :date, :payment_mode, :status, :address1, :address2, :customer_number, :pincode)
    end
end

