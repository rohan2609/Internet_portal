class CustomerAttachmentsController < ApplicationController
	def destroy
		 @customer_attachment = CustomerAttachment.find(params[:id])
     @customer_attachment.destroy
     redirect_to customers_path(@customer_attachment)
	end
end
