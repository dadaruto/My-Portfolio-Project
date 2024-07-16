class PopulateBlogPostsUserId < ActiveRecord::Migration[7.1]
  def up
    default_user = User.first
    BlogPost.where(user_id: nil).update_all(user_id: default_user.id) if default_user
  end

  def down
    # Revert the changes if necessary
    BlogPost.update_all(user_id: nil)
  end
end

