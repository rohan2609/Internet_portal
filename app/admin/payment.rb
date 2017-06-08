ActiveAdmin.register Payment do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
permit_params :payment_mode
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
    f.inputs "Customer Details",{:multipart => true} do
      f.input :payment_mode, :as => :boolean, :collection => ['Online', 'Offline'] 

    end
    f.actions
  end
end
