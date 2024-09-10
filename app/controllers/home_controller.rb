class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only:  :index
  def index
    redirect_to tasks_path if current_user
  end
end
