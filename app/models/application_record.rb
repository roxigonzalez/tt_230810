class ApplicationRecord < ActiveRecord::Base
  include ActiveModel::Serializers::Xml
  self.abstract_class = true
end
