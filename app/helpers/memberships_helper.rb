module MembershipsHelper

  def check_membership?
    current_user.memberships.exists?
  end

  def membership_posts?
    if check_membership?
      memberships = Membership.find_by_user_id(current_user.id)
      memberships.posts.exists?
    else
      return
    end
  end

  def current_group
    @current_group ||= Group.find_by(id: params[:group_id])
  end
end
