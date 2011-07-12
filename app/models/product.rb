class Product < ActiveRecord::Base
  
  # validation
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :image_url, :on => :create, :message => "can't be blank"
  
  validates_numericality_of :price, :on => :create, :message => "is not a number"
  
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"
  
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)}i, :on => :create, :message => "is invalid"
  
end
