class Cart < ActiveRecord::Base
  # relationship
  has_many :line_items, :dependent => :destroy
end
