ActiveAdmin.register Customer do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :fullname, :mobile_no, :phone_no, :email,:pincode, :kyc, :date, :payment_mode, :plan_id,:customer_number,:address1,:address2,:status

# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
    f.inputs "Customer Details" do
 f.input :customer_number,
      :input_html => {:value => Customer.first.nil? ? 'C' + Date.today.strftime('%Y%m%d').to_s + 
'1' : 'C' +  Date.today.strftime('%Y%m%d').to_s + Customer.last.id.next.to_s }
      f.input :fullname  
      f.input :plan_id, :as => :select, :collection => Plan.all.map{|p| [p.plan_name,p.id]}
      f.input :mobile_no 
      f.input :pincode
      f.input :phone_no
      f.input :address1 
      f.input :address2
      f.input :email
      f.input :status
      f.input :kyc
      f.input :date, :as => :datepicker
      f.input :payment_mode, :as => :radio, :collection => ['Online', 'Offline'] 

    end
    f.actions
  end


  index do
  selectable_column
  column :fullname
  column :mobile_no
  column :status
  column :email
  column :date
end



end
