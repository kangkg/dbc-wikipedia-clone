class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper ApplicationHelper # this allows the views to access the helper
  include ApplicationHelper # this allows models/controllers to access the helper
end

