class DashboardController < ApplicationController
  before_action :authenticate_user! # Devise method to authenticate user
  def index
  end
end
