class GroupsController < ApplicationController
  helper :all

  def show
    set_group
    redirect_to '/'
  end

  private

  def set_group
    if params[:current_group]
      @group = Group.all.find(params[:current_group])
      session[:current_group_id] = @group.id
    end
  end
end
