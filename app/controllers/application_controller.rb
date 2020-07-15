class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:dashboard]
end
