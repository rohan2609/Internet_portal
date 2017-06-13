class CustomersController < InheritedResources::Base
skip_before_action :verify_authenticity_token, :only => [:payu_return]

def new
  @customer = Customer.new
  @customer_attachment = @customer.customer_attachments.build
end

def update
  @customer = Customer.find(params[:id])
  @customer.update(customer_params)
  redirect_to customers_path
end


def create
  @customer = Customer.new(customer_params)
    @customer.save
        redirect_to customers_path
         if  params[:customer_attachments].present?
       params[:customer_attachments]['file'].each do |a|
        @customer_attachment = @customer.customer_attachments.create!(:file=> a)
      end
    end
end
     def show
        @customer = Customer.find(params[:id])
        @customer_attachments = @customer.customer_attachments.all
    end

  def confirm_to_pay
    @customer = Customer.find(params[:id])
    payment = @customer.payments.build(
      txnid: @customer.access_token,
      plan_id: @customer.plan_id,
      amount: @customer.try(:plan).try(:plan_price),
      email: @customer.email,
      status: 'will send request for payment'
      )
    payment.save
  end

	 def payu_return
    binding.pry
    begin
      notification = PayuIndia::Notification.new(request.query_string, options = {:key => 'fB7m8s', :salt => 'eRis5Chv', :params => params})    
      @payment = Payment.find_or_create_by(txnid: notification.invoice)  # invoice is nothing but the payment_id
      if notification.params["status"] == "success"
        begin
          if notification.params["status"] == "success"
            @payment.status = params[:status]
            @payment.paid_at = params[:addedon]
            @payment.card_num = params[:cardnum]
            @payment.ip = request.remote_ip
            @payment.Payer_id = params[:mihpayid]
            @payment.save
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
      redirect_to customer_path(current_user)
    end
  end
  private

    def customer_params
      params.require(:customer).permit( :fullname,:file,:payment_id, :mobile_no,:utf8, :authenticity_token, :customers, :commit ,:phone_no, :email,:pincode, :kyc, :date, :plan_id,:plan_start_date,:plan_expiry_date,:customer_number,:address1,:address2,:status,customer_attachments_attributes: [:customer_id,file:[]])
    end
end

