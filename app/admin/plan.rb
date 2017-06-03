ActiveAdmin.register Plan do
permit_params :plan_name, :plan_price, :plan_start_date ,:plan_expiry_date,:speed
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
form do |f|
    f.inputs "Plan Details" do
      
      f.input :plan_name
      f.input :plan_price
      f.input :speed
      f.input :plan_start_date, as: :datepicker, datepicker_options: {dateFormat: 'dd/mm/yy'}
      f.input :plan_expiry_date, as: :datepicker, datepicker_options: {dateFormat: 'dd/mm/yy'}
    	
     
  end

  f.actions
end
end
