module MembershipsHelper



  # Assign group to user
  def assign_group
    current_user.memberships do |membership|
      membership.group_id
    end
  end
end
