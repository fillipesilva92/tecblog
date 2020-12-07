class ApplicationController < ActionController::Base
  def self.find_by_name(name)
    @categories.find { |category| category.name == name}
  end
end
