class CustomerAttachment < ApplicationRecord
  belongs_to :customer
  mount_uploaders :file, FileUploader
end
