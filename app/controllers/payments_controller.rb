class PaymentsController < InheritedResources::Base

  private

    def payment_params
      params.require(:payment).permit(:mihpayid, :txnid, :status, :unmappedstatus, :amount, :cardCategory, :email, :name_on_card, :issuing_bank, :customer_id, :plan_id,:payment_mode)
    end
end

