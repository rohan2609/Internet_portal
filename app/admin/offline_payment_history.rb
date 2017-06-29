ActiveAdmin.register OfflinePaymentHistory do
    filter :plan_id, :label =>'Plan', :as => :select, :collection => Plan.all.map{|p| [p.plan_name,p.id]}
    filter :customer_id, :label => 'Customer', :as => :select, :collection => Customer.all.map{|c| [c.fullname,c.id]} 
    # See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :cash, :check, :plan_id, :fullname,:customer_id,:amount_paid
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
    f.inputs "Offline Payment Details" do

        f.input :plan_id, :as => :select, :collection => Plan.all.map{|p| [p.plan_name,p.id]}
        f.input :customer_id, :as => :select, :collection => Customer.all.map{|c| [c.fullname,c.id]}
        f.input :amount_paid
        f.input :cash
        f.input :check, :as => :select, :collection => ["check","DD"]

end
  f.actions
end


end

