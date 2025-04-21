class CollectionConfigration < ApplicationRecord

	has_attached_file :avatar,
    :storage => :s3,
    :bucket => "simply-collection-app",
    :path => "collections/:class/:attachment/:id/:style/:filename",
    :s3_credentials => {:access_key_id => "#{Rails.application.secrets.aws_access_key}",
                        :secret_access_key => "#{Rails.application.secrets.aws_secret_key}"},
    :default_url => lambda { |avatar| avatar.instance.set_default_url}

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def set_default_url
    ActionController::Base.helpers.asset_path('No_image.png')
  end

end
