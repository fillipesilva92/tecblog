class CategoriesController < ApplicationController
  def filtered
    @category = Category.find_by_name!(params[:name])
  end
end