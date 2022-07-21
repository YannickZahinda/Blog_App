class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :posts, class_name: 'Post'
  after_save :update_post_likes_counter
  def self.update_post_likes_counter(post_id)
    p = Post.find(post_id)
    p.likes_counter += 1
    p.save
  end
end
