class OfflinePaymentHistoriesController < InheritedResources::Base

  private

    def offline_payment_history_params
      params.require(:offline_payment_history).permit(:customer_id, :plan_id, :cash, :check, :bank_name, :check_number, :amount_paid)
    end
end

