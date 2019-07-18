class PostSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title, :source, :link, :likes, :has_liked

  has_many :comment

  def likes 
    object.like.count
  end

  def has_liked
    user_id = scope.headers["USER_ID"]
    object.like.where(user_id: user_id).exists?
  end
end
