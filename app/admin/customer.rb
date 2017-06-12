ActiveAdmin.register Customer do

 filter :fullname, :label => 'Customer Name', :as => :select, if: proc{Customer.all.map { |c| [c.fullname,c.id]  }}
permit_params picture_ids: []
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
permit_params :fullname,:customer,:file,:payment_id, :mobile_no,:utf8, :authenticity_token, :commit ,:phone_no, :email,:pincode, :kyc, :date, :plan_id,:plan_start_date,:plan_expiry_date,:customer_number,:address1,:address2,:status,customer_attachments_attributes: [:customer_id,file: []]
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
       f.has_many :customer_attachments do |q|
       q.input :file, :as => :file,input_html: { multiple: true},name: "customer_attachments[file][]"
    end   
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
    row :address1
    row :address2
    row :mobile_no
  
    row :plan_id, :as => :select, :collection => Plan.all.map{|p| [p.plan_name,p.id]}
       row :status


div :class => "panel" do
          h3 "Customer Attachment"
        
          if customer.customer_attachments
            div :class => "panel_contents" do
              div :class => "attributes_table" do
                table do
                  tr do
                    th do
                      "Customer Attachment"
                    end
                  end
                  tbody do
                    customer.customer_attachments.each do |p|
                      tr do
                        td do
                          
         link_to p.file_urls                                                                                                                     
    
                        end
                      end
                    end
                  end
                end
              end
            end
          else
            h3 "No Attachment available"
          end
        end
  
end

end


end