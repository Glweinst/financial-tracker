class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User' # users belong to users, but the user that belongs to another user we are calling
                                            # "friend" to distinguish from the user who HAS the other user aka friend. This
                                            # freind is really a user, hence the :class_name.....


end
