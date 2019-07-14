class PostSerializer < ActiveModel::Serializer
  attributes :id, :slug, :title

  has_many :comment

  def likes 
    object.like.count
  end
end
