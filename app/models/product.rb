class Product < ActiveRecord::Base
  
  # allow display products in alphabetical order with title
  default_scope :order => 'title'
  
  # validation
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :image_url, :on => :create, :message => "can't be blank"  
  validates_numericality_of :price, :on => :create, :message => "is not a number"  
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"  
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)}i, :on => :create, :message => "is invalid"
  
  # relationship
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
  
end
