module MembershipsHelper
  # checks if current_user is a member of any group
  def check_membership?
    current_user.memberships.exists?
  end

  # checks if user has any post
  def membership_posts?
    return unless check_membership?

    memberships = Membership.find_by_user_id(current_user.id)
    memberships.posts.exists?
  end

  def current_membership
    binding.pry
    Membership.find_by_user_id_and_group_id(current_user.id, Group.all.find(session[:current_group_id]))
  end
end
