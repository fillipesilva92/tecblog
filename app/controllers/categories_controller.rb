class CategoriesController < ApplicationController
  def filtered
    @categories = Category.find_by_name(name)
  end
end