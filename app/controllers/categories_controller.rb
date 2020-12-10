class CategoriesController < ApplicationController
  def filtered
    @category = Category.find_by_name!(params[:name])
    
    if @category.status == 'inativo'
      redirect_to '/', notice: 'Inactive Category'
    end
  end
end