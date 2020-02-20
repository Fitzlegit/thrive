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

    if @membership.save
      redirect_to @membership
    else
      render 'new'
      flash[:alert] = 'Unable to join group'
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:permission, :user_id, :group_id)
  end
end
