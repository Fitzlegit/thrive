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

  # sets current_users membership groups
  def user_group_ids
    @group_ids = []
    Membership.all.each do |membership|
      if membership.user_id == current_user.id
        @group_ids << membership.group_id
      end
    end
    @group_ids
  end

  # destroys numerical rep of user groups & returns an array user group records
  def current_user_groups
    user_group_ids
    @group_ids.collect do |id|
      Group.all.find_by_id(id)
    end
  end

  def current_membership
    Membership.find_by_user_id_and_group_id(current_user.id, 1)
  end
end
