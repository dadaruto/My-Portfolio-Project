class AddNotNullConstraintToUserIdInBlogPosts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :blog_posts, :user_id, false
  end
end
