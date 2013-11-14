class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @available_surveys = current_user.available_surveys
  end

end
