require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  fixtures :products
  
  test "product attributes must not be empty" do
    product = Product.new 
    assert product.invalid? 
    assert product.errors[:title].any?
    assert product.errors[:price].any? 
    assert product.errors[:image_url].any?
  end
  
  test "product price must be positive" do 
    # create a new product
    product = Product.new(:title => "Book title", :description => "nothing", :image_url => "zzz,jpg")
    
    product.price = -1 # test the price negative
    assert product.invalid?, "The price must be greater than or equal to 0.01"

    product.price = 0 # test the price 0
    assert product.invalid?, "The price must be greater than or equal to 0.01"

    product.price = 1 # test the price positive
    assert product.invalid?    
  end
  
  test "proudct should has a unique title" do
    # create a new product
    product = Product.new(:title => products(:ruby).title, :description => "nothing", :price => 1, :image_url => "zzz,jpg")
    
    assert !product.save, "The title of proudcts should not be duplicated"
    
  end
  
end
