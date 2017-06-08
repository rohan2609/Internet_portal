ActiveAdmin.register Customer do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
active_admin_import
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :fullname,:payment_id, :mobile_no, :phone_no, :email,:pincode, :kyc, :date, :plan_id,:plan_start_date,:plan_expiry_date,:customer_number,:address1,:address2,:status

# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
    f.inputs "Customer Details",{:multipart => true} do
 f.input :customer_number,
      :input_html => {:value => Customer.first.nil? ? 'C' + Date.today.strftime('%Y%m%d').to_s + 
'1' : 'C' +  Date.today.strftime('%Y%m%d').to_s + Customer.last.id.next.to_s }
      f.input :fullname  
      f.input :plan_id, :as => :select, :collection => Plan.all.map{|p| [p.plan_name,p.id]}
      f.input :plan_start_date, :as => :datepicker,  :input_html => {:value => Date.today}
      f.input :plan_expiry_date, :as => :datepicker
      f.input :date, :as => :datepicker,  :input_html => {:value => Date.today}
      f.input :address1 
      f.input :address2
      f.input :pincode
      f.input :mobile_no
      f.input :phone_no
      f.input :email
      f.input :status, :as => :boolean
      f.input :kyc, :as => :file,input_html: { multiple: true}
      f.input :payment_id, :collection => Payment.all.map{|p| [p.payment_mode,p.id]} 

    end
    f.actions
  end


  index do
  selectable_column
  column :fullname
  column :mobile_no
  column :status
  column :email
  actions defaults: false do |customer|
   a "View", href: admin_customer_path(customer)
   item "Edit", edit_admin_customer_path(customer)
  
 end
end

show do
  attributes_table do
    row :customer_number
    row :fullname
    row :plan_id, :as => :select, :collection => Plan.all.map{|p| [p.plan_name,p.id]}
    row :plan_expiry_date, :input_html => {:value =>  customer.plan_start_date + customer.plan.no_of_days.to_i.days}
    row :status
    row :kyc do
        customer.kyc? ? image_tag(customer.kyc.url, height: '100') : content_tag(:span, "No photo yet")
end
end
end

end
