class PlansController < InheritedResources::Base

  private

    def plan_params
      params.require(:plan).permit(:plan_name, :plan_price, :plan_start_date, :plan_expiry_date)
    end
end

