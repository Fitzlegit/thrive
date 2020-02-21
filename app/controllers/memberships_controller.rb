# frozen_string_literal: true

class MembershipsController < ApplicationController
  before_action :index

  def index
    @memberships = Membership.all
  end

  def new
    @membership = current_user.memberships.build
  end

  def create
    @membership = current_user.memberships.build(membership_params)

    if current_user.memberships.find(@membership.group_id)
      render 'new'
      flash[:notice] = "You've already joined that group"
    else
      @membership.save
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:permission, :user_id, :group_id)
  end
end
