class OfflinePaymentsController < InheritedResources::Base

  private

    def offline_payment_params
      params.require(:offline_payment).permit(:cash, :check, :customer_id, :plan_id)
    end
end

