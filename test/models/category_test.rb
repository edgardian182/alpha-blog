require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup 
    @category = Category.new(name: "sports")
  end
  
  test "Category should be valid" do
    assert @category.valid?, "Debe existir el Model Category"
  end
  
  test "Name should be present" do
    @category.name = ""
    assert_not @category.valid?, "Agregar validación :name, presence:true"
  end
  
  test "Name should ve unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?, "Falta validadcion uniqueness"
  end
  
  test "Name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?, "Falta validacion de maximum"
  end
  
  test "Name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?, "Falta validacion de minimum"
  end
  
end