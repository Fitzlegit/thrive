class Post < ApplicationRecord
  belongs_to :membership
  belongs_to :group_id
end
