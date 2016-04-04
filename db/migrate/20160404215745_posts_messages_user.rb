class PostsMessagesUser < ActiveRecord::Migration
  def change
    add_reference "posts", "user"
    add_reference "messages", "user"
  end
end
