class ApplicationController < ActionController::Base
  before_action :set_meta
  protect_from_forgery with: :exception
  PAGE_SIZE = 10

  def set_meta
    @meta_title = 'Пізнати істину'
    @root_meta_title = 'Пізнати істину'
    @meta_description = 'Істина Пізнати Істину Знайти Істину Сенс Життя'
  end
end
