class UsersController < ApplicationController
    before_action :set_current_user
  before_action :require_user_logged_in!
    def dashboard
    end
  end