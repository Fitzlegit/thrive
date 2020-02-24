module GroupsHelper
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

  def current_group_name
    if session[:current_group_id].nil?
      @current_group ||= ''
    else
      @current_group = Group.all.find(session[:current_group_id]).name
    end
  end

  def check_group?
    !session[:current_group_id].nil?
  end
end
