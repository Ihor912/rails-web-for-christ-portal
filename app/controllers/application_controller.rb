class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  PAGE_SIZE = 10
end
