ActiveAdmin.register Plan do
permit_params :plan_name, :plan_price,:speed,:no_of_days
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
      f.input :no_of_days, :as =>:select, :collection => ['30', '60', '90','180', '360']
    	
     
  end

  f.actions
end
end



      