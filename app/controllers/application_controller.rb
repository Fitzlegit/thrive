class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper :all

  def current_membership
    Membership.find_by_user_id_and_group_id(current_user.id, Group.all.find(session[:current_group_id]))
  end
end
