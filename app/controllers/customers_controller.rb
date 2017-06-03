class CustomersController < InheritedResources::Base

  private

    def customer_params
      params.require(:customer).permit(:fullname, :dob, :mobile_no, :phone_no, :email, :kyc, :date, :payment_mode, :status, :address1, :address2, :customer_number, :pincode)
    end
end

